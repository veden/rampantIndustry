-- imports

local constants = require("libs/Constants")
local mathUtils = require("libs/MathUtils")

-- constants

local DEFAULT_SPOUT_SIZE = constants.DEFAULT_SPOUT_SIZE

local RAW_GOO_TYPES = constants.RAW_GOO_TYPES
local RAMPANT_PREFIX_TABLE = constants.RAMPANT_PREFIX_TABLE
local DEFAULT_GOO_TYPE = constants.DEFAULT_GOO_TYPE

local ENABLE_NORMAL_GOO = constants.ENABLE_NORMAL_GOO
local ENABLE_ALL_GOO = constants.ENABLE_ALL_GOO
local MENDING_WALL_COOLDOWN = constants.MENDING_WALL_COOLDOWN

local CHUNK_SIZE = constants.CHUNK_SIZE
local CHUNK_SIZE_DIVIDER = constants.CHUNK_SIZE_DIVIDER

-- imported functions

local gaussianRandomRange = mathUtils.gaussianRandomRange

local strFind = string.find
local substr = string.sub
local mRandom = math.random
local mFloor = math.floor
local mCeil = math.ceil

-- local references

local world

-- module code

local function onModSettingsChange(event)

    if event and (string.sub(event.setting, 1, 18) ~= "rampant-industry") then
        return false
    end

    -- world.airFilterCooldown = settings.global["rampant-industry-airFilterCooldown"].value

    -- world.spoutThreshold = settings.global["rampant-industry-spoutThreshold"].value
    -- world.spoutScaler = settings.global["rampant-industry-spoutScaler"].value
    -- world.spoutDefaultValue = world.spoutScaler * DEFAULT_SPOUT_SIZE

    return true
end


local function onConfigChanged()
    onModSettingsChange()
    if not world.version then
        world.airFilterTick = nil
        world.position = {x=0,y=0}
        world.airFilter = { len = 0 }
        world.airFilterCursor = 1
        world.airFilterFill = 0
        world.playerSelection = {}

        for _,surface in pairs(game.surfaces) do
            local entities = surface.find_entities_filtered({
                    name = "air-filter-rampant-industry"
            })
            for _,e in pairs(entities) do
                world.airFilter[world.airFilter.len] = e
                world.airFilter.len = world.airFilter.len + 1
            end
            entities = surface.find_entities_filtered({
                    name = "air-filter-2-rampant-industry"
            })
            for _,e in pairs(entities) do
                world.airFilter[world.airFilter.len] = e
                world.airFilter.len = world.airFilter.len + 1
            end
        end

        world.insertFluidQuery = {
            name="pollution-fluid-rampant-industry",
            amount=10
        }

        for i,p in ipairs(game.connected_players) do
            p.print("Rampant Industry - Version 1.0.0")
        end
        world.version = 1
    end
end

local function onInit()
    global.world = {}

    world = global.world

    onConfigChanged()
end

local function onLoad()
    world = global.world
end

local function onDeath(event)
    local entity = event.entity
    -- if (event.cause and event.cause.force.name == "player") and (entity.force.name == "enemy") then
    --     if (mRandom() < world.spoutThreshold) then
    --         if (entity.type == "unit-spawner") then
    --             local name = entity.name
    --             local gooType
    --             if ENABLE_ALL_GOO then
    --                 if (substr(name, -7) == "rampant") then
    --                     local prefix = (strFind(name,"-")) - 1
    --                     gooType = RAMPANT_PREFIX_TABLE[(substr(name,1,prefix))]
    --                 else
    --                     gooType = RAW_GOO_TYPES[mRandom(#RAW_GOO_TYPES)]
    --                 end
    --             elseif ENABLE_NORMAL_GOO then
    --                 gooType = DEFAULT_GOO_TYPE
    --             end
    --             local position = entity.position
    --             local x = position.x
    --             local y = position.y
    --             local potentialYield = (((x * x) + (y * y)) ^ 0.5) * world.spoutDefaultValue

    --             local yield = gaussianRandomRange(potentialYield, 0.15, potentialYield * 0.7, potentialYield * 1.3)
    --             entity.surface.create_entity({name=gooType, amount=yield, position=entity.position})
    --         end
    --     end
    -- end
end

local function onBuilding(event)
    local entity = event.created_entity or event.entity
    if entity.valid and
        (entity.name == "air-filter-rampant-industry") or
        (entity.name == "air-filter-2-rampant-industry") then
        local n = world.airFilter.len + 1
        world.airFilter[n] = entity
        world.airFilter.len = n
    end
end

local function onAirFiltering(event)
    if (world.airFilterCursor <= world.airFilter.len) then
        local entity = world.airFilter[world.airFilterCursor]
        if entity.valid then
            if (entity.is_connected_to_electric_network() and
                ((entity.energy / entity.prototype.max_energy_usage) > 0.65)) then
                local amount = entity.surface.get_pollution(entity.position)
                if (amount > 0) then
                    world.insertFluidQuery.amount = amount * 3
                    entity.insert_fluid(world.insertFluidQuery)
                end
            end
            local n = world.airFilterFill + 1
            world.airFilter[n] = entity
            world.airFilterFill = n
        end
        world.airFilterCursor = world.airFilterCursor + 1
    else
        world.airFilter.len = world.airFilterFill
        world.airFilterCursor = 1
        world.airFilterFill = 0
    end
end

local function onSelectionChanged(event)
    local player = game.players[event.player_index]
    local selection = game.players[event.player_index].selected
    if selection then
        local previousSelection = world.playerSelection[event.player_index]

        if previousSelection then
            if (selection ~= previousSelection[1]) then
                for i=2,#previousSelection do
                    rendering.destroy(previousSelection[i])
                end
            end
        end

        if (selection.name == "air-filter-rampant-industry") or (selection.name == "air-filter-2-rampant-industry") then
            local chunkX = mFloor(selection.position.x / 32) * 32
            local chunkY = mFloor(selection.position.y / 32) * 32

            local graphicId = rendering.draw_rectangle({
                    color = {0.1, 0.3, 0.1, 0.6},
                    width = 32 * 32,
                    filled = true,
                    left_top = {chunkX, chunkY},
                    right_bottom = {chunkX+32, chunkY+32},
                    surface = selection.surface,
                    draw_on_ground = true,
                    visible = true
            })
            world.playerSelection[event.player_index] = {selection.unit_number, graphicId}
        end
    end
end

local function removePlayerSelection(event)
    for player,pair in pairs(world.playerSelection) do
        local selection = game.players[player].selected
        local previousSelection = world.playerSelection[player]

        if previousSelection then
            if not selection or (previousSelection[1] ~= selection.unit_number) then
                for i=2,#previousSelection do
                    rendering.destroy(previousSelection[i])
                end
                world.playerSelection[player] = nil
            end
        end
    end
end


-- hooks

script.on_init(onInit)
script.on_load(onLoad)
script.on_event(defines.events.on_runtime_mod_setting_changed, onModSettingsChange)

script.on_configuration_changed(onConfigChanged)

script.on_nth_tick(15, removePlayerSelection)
script.on_event(defines.events.on_tick, onAirFiltering)

script.on_event(defines.events.on_selected_entity_changed, onSelectionChanged)

-- script.on_event(defines.events.on_entity_died, onRemoval)
-- script.on_event({defines.events.script_raised_destroy}, onRemoval)

script.on_event(defines.events.on_built_entity, onBuilding, {
                    {
                        name = "air-filter-rampant-industry",
                        filter = "name"
                    },
                    {
                        name = "air-filter-2-rampant-industry",
                        filter = "name"
                    }
})

script.on_event(defines.events.on_robot_built_entity, onBuilding, {
                    {
                        name = "air-filter-rampant-industry",
                        filter = "name"
                    },
                    {
                        name = "air-filter-2-rampant-industry",
                        filter = "name"
                    }
})

script.on_event({ defines.events.script_raised_built,
                  defines.events.script_raised_revive }, onBuilding)
