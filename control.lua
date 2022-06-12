-- Copyright (C) 2022  veden

-- This program is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.

-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.

-- You should have received a copy of the GNU General Public License
-- along with this program.  If not, see <https://www.gnu.org/licenses/>.

-- imports

-- constants
local mFloor = math.floor

-- local references

local world

-- module code

local function onModSettingsChange(event)

    for i=1,world.airFilter.len do
        local entityActivePair = world.airFilter[i]
        if entityActivePair[1].valid then
            entityActivePair[1].active = true
            entityActivePair[2] = true
        end
    end

    if event and (string.sub(event.setting, 1, #"rampant-industry") ~= "rampant-industry") then
        return false
    end

    return true
end


local function onConfigChanged()
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

        world.version = 1
    end
    if world.version < 2 then
        world.version = 2

        game.print("Rampant Industry - Version 1.3.0")

        local minDiffuse = game.map_settings.pollution.min_to_diffuse
        world.minDiffuseDeactivate = minDiffuse * 0.25
        world.minDiffuseActivate = minDiffuse * 0.75

        for i=1,world.airFilter.len do
            world.airFilter[i] = {world.airFilter[i],true}
        end
    end
    onModSettingsChange()
end

local function onInit()
    global.world = {}

    world = global.world

    onConfigChanged()
end

local function onLoad()
    world = global.world
end

local function onBuilding(event)
    local entity = event.created_entity or event.entity
    if entity.valid and
        (entity.name == "air-filter-rampant-industry") or
        (entity.name == "air-filter-2-rampant-industry") then
        local n = world.airFilter.len + 1
        world.airFilter[n] = {entity,true}
        world.airFilter.len = n
    end
end

local function onAirFiltering()
    if (world.airFilterCursor <= world.airFilter.len) then
        local entityActivePair = world.airFilter[world.airFilterCursor]
        local entity = entityActivePair[1]
        if entity.valid then
            local amount = entity.surface.get_pollution(entity.position)
            if (amount < world.minDiffuseDeactivate) then
                if entity.active and entityActivePair[2] then
                    entity.active = false
                    entityActivePair[2] = false
                end
            else
                if not entity.active
                    and not entityActivePair[2]
                    and (amount > world.minDiffuseActivate)
                then
                    entity.active = true
                    entityActivePair[2] = true
                end
            end
            local n = world.airFilterFill + 1
            world.airFilter[n] = entityActivePair
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

local function removePlayerSelection()
    for player in pairs(world.playerSelection) do
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
