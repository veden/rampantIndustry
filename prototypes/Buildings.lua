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

local buildings = {}

local technologyUtils = require("utils/TechnologyUtils")
local scaleUtils = require("utils/ScaleUtils")
local oilUtils = require("utils/OilUtils")

local addEffectToTech = technologyUtils.addEffectToTech
local scalePicture = scaleUtils.scalePicture
local addFluid = oilUtils.addFluid

function buildings.enable()

    if settings.startup["rampant-industry-enableAdvancedLab"].value then
        data:extend({
                {
                    type = "corpse",
                    name = "advanced-lab-remnants-rampant-industry",
                    icon = "__base__/graphics/icons/lab.png",
                    icon_size = 64, icon_mipmaps = 4,
                    flags = {"placeable-neutral", "not-on-map"},
                    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
                    tile_width = 3,
                    tile_height = 3,
                    selectable_in_game = false,
                    subgroup = "remnants",
                    order="d[remnants]-a[generic]-a[small]",
                    time_before_removed = 60 * 60 * 15, -- 15 minutes
                    final_render_layer = "remnants",
                    remove_on_tile_placement = false,
                    animation = make_rotated_animation_variations_from_sheet (2,
                                                                              {
                                                                                  filename = "__base__/graphics/entity/lab/remnants/lab-remnants.png",
                                                                                  line_length = 1,
                                                                                  width = 134,
                                                                                  height = 100,
                                                                                  frame_count = 1,
                                                                                  variation_count = 1,
                                                                                  axially_symmetrical = false,
                                                                                  direction_count = 1,
                                                                                  shift = util.by_pixel(7, 6),
                                                                                  scale = 4,
                                                                                  hr_version =
                                                                                      {
                                                                                          filename = "__base__/graphics/entity/lab/remnants/hr-lab-remnants.png",
                                                                                          line_length = 1,
                                                                                          width = 266,
                                                                                          height = 196,
                                                                                          frame_count = 1,
                                                                                          variation_count = 1,
                                                                                          axially_symmetrical = false,
                                                                                          direction_count = 1,
                                                                                          shift = util.by_pixel(7, 5.5),
                                                                                          scale = 2
                                                                                      },
                    })
                }
        })

        local lab = table.deepcopy(data.raw["lab"]["lab"])
        lab.name = "advanced-lab-rampant-industry"
        lab.minable.result = "advanced-lab-rampant-industry"
        lab.collision_box[1][1] = lab.collision_box[1][1] * 4
        lab.collision_box[1][2] = lab.collision_box[1][2] * 4
        lab.collision_box[2][1] = lab.collision_box[2][1] * 4
        lab.collision_box[2][2] = lab.collision_box[2][2] * 4

        lab.selection_box[1][1] = lab.selection_box[1][1] * 4
        lab.selection_box[1][2] = lab.selection_box[1][2] * 4
        lab.selection_box[2][1] = lab.selection_box[2][1] * 4
        lab.selection_box[2][2] = lab.selection_box[2][2] * 4
        lab.corpse = "advanced-lab-remnants-rampant-industry"

        lab.drawing_box = nil

        lab.max_health = 1000

        lab.energy_usage = "1.75MW"

        lab.researching_speed = 24

        lab.next_upgrade = nil

        lab.module_specification =
            {
                module_slots = settings.startup["rampant-industry--advanced-lab-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }

        scalePicture(2, lab.on_animation)
        scalePicture(2, lab.off_animation)

        lab.on_animation.layers[4].shift = {4,0}
        lab.on_animation.layers[4].hr_version.shift = {4,0}
        lab.on_animation.layers[2].shift = {0,1.8}
        lab.on_animation.layers[2].hr_version.shift = {0,1.8}

        lab.off_animation.layers[2].shift = {0,1.8}
        lab.off_animation.layers[2].hr_version.shift = {0,1.8}
        lab.off_animation.layers[3].shift = {4,0}
        lab.off_animation.layers[3].hr_version.shift = {4,0}

        local recipe = table.deepcopy(data.raw["recipe"]["lab"])
        recipe.name = "advanced-lab-rampant-industry"
        recipe.enabled = false
        recipe.ingredients = {
            {"steel-plate", 20},
            {"electronic-circuit", 30},
            {"lab", 16}
        }
        recipe.energy_required = 30
        recipe.result = "advanced-lab-rampant-industry"

        local item = table.deepcopy(data.raw["item"]["lab"])
        item.name = "advanced-lab-rampant-industry"
        item.icons = {{icon = item.icon, tint={0.8,0.8,1,1}}}
        item.icon = nil
        item.place_result = "advanced-lab-rampant-industry"
        item.order = "g[zlab]"

        addEffectToTech("advanced-lab",
                        {
                            type = "unlock-recipe",
                            recipe = recipe.name,
        })

        data:extend({
                lab,
                recipe,
                item
        })
    end

    if settings.startup["rampant-industry-enableGreenHouse"].value then
        data:extend({
                {
                    type = "corpse",
                    name = "greenhouse-remnants-rampant-industry",
                    icon = "__base__/graphics/icons/lab.png",
                    icon_size = 64, icon_mipmaps = 4,
                    flags = {"placeable-neutral", "not-on-map"},
                    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
                    tile_width = 3,
                    tile_height = 3,
                    selectable_in_game = false,
                    subgroup = "remnants",
                    order="d[remnants]-a[generic]-a[small]",
                    time_before_removed = 60 * 60 * 15, -- 15 minutes
                    final_render_layer = "remnants",
                    remove_on_tile_placement = false,
                    animation = make_rotated_animation_variations_from_sheet (2,
                                                                              {
                                                                                  filename = "__base__/graphics/entity/lab/remnants/lab-remnants.png",
                                                                                  line_length = 1,
                                                                                  width = 134,
                                                                                  height = 100,
                                                                                  frame_count = 1,
                                                                                  variation_count = 1,
                                                                                  axially_symmetrical = false,
                                                                                  direction_count = 1,
                                                                                  shift = util.by_pixel(7, 6),
                                                                                  tint = {r=0.5,g=0.7,b=0.5},
                                                                                  scale = 2.5,
                                                                                  hr_version =
                                                                                      {
                                                                                          filename = "__base__/graphics/entity/lab/remnants/hr-lab-remnants.png",
                                                                                          line_length = 1,
                                                                                          width = 266,
                                                                                          height = 196,
                                                                                          frame_count = 1,
                                                                                          variation_count = 1,
                                                                                          axially_symmetrical = false,
                                                                                          direction_count = 1,
                                                                                          tint = {r=0.5,g=0.7,b=0.5},
                                                                                          shift = util.by_pixel(7, 5.5),
                                                                                          scale = 1.25
                                                                                      },
                    })
                }
        })

        local greenhouse = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
        greenhouse.name = "greenhouse-rampant-industry"
        greenhouse.minable.result = "greenhouse-rampant-industry"
        greenhouse.collision_box[1][1] = greenhouse.collision_box[1][1] * 2.51
        greenhouse.collision_box[1][2] = greenhouse.collision_box[1][2] * 2.51
        greenhouse.collision_box[2][1] = greenhouse.collision_box[2][1] * 2.51
        greenhouse.collision_box[2][2] = greenhouse.collision_box[2][2] * 2.51

        greenhouse.selection_box[1][1] = greenhouse.selection_box[1][1] * 2.1
        greenhouse.selection_box[1][2] = greenhouse.selection_box[1][2] * 2.1
        greenhouse.selection_box[2][1] = greenhouse.selection_box[2][1] * 2.1
        greenhouse.selection_box[2][2] = greenhouse.selection_box[2][2] * 2.1
        greenhouse.corpse = "greenhouse-remnants-rampant-industry"

        greenhouse.drawing_box = nil
        greenhouse.scale_entity_info_icon = true
        greenhouse.max_health = 600
        greenhouse.energy_usage = "450KW"
        greenhouse.energy_source.emissions_per_minute = 0
        greenhouse.crafting_categories = {"greenhouse-rampant-industry"}
        greenhouse.next_upgrade = nil
        greenhouse.crafting_speed = 1
        greenhouse.module_specification =
            {
                module_slots = settings.startup["rampant-industry--greenhouse-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }
        greenhouse.allowed_effects = { "speed", "consumption" }

        local onAnimation = table.deepcopy(data.raw["lab"]["lab"].on_animation)
        greenhouse.animation = onAnimation
        scalePicture(1.125, greenhouse.animation)

        greenhouse.fluid_boxes[1].pipe_connections[1].position[2] = -4
        greenhouse.fluid_boxes[2] = nil

        greenhouse.animation.layers[1].tint = {r=0.5,g=0.8,b=0.5}
        greenhouse.animation.layers[1].hr_version.tint = {r=0.5,g=0.8,b=0.5}
        greenhouse.animation.layers[2].shift = {0,1}
        greenhouse.animation.layers[2].hr_version.shift = {0,1}
        greenhouse.animation.layers[3].shift = {1,0}
        greenhouse.animation.layers[3].hr_version.shift = {1,0}
        greenhouse.animation.layers[4].shift = {2,0}
        greenhouse.animation.layers[4].hr_version.shift = {2,0}

        local recipe = table.deepcopy(data.raw["recipe"]["lab"])
        recipe.name = "greenhouse-rampant-industry"
        recipe.enabled = false
        recipe.ingredients = {
            {"iron-plate", 20},
            {"copper-cable", 20},
            {"electronic-circuit", 8}
        }
        recipe.energy_required = 15
        recipe.result = "greenhouse-rampant-industry"

        local recipeTemplate = table.deepcopy(data.raw["recipe"]["lab"])
        recipeTemplate.enabled = false
        recipeTemplate.category = "greenhouse-rampant-industry"
        recipeTemplate.subgroup = "intermediate-product"
        recipeTemplate.show_amount_in_title = true
        recipeTemplate.hide_from_player_crafting = true
        recipeTemplate.result = nil

        local recipeBalanced = table.deepcopy(recipeTemplate)
        recipeBalanced.name = "grow-balanced-rampant-industry"
        recipeBalanced.icon = "__base__/graphics/icons/wood.png"
        recipeBalanced.icon_size = 64
        recipeBalanced.icon_mipmaps = 4
        recipeBalanced.ingredients = {
            {type="item", name="seed-rampant-industry", amount=2},
            {type="fluid", name="water", amount=7500}
        }
        recipeBalanced.energy_required = 22
        recipeBalanced.results = {
            {type="item", name="wood", amount_min=2, amount_max=6},
            {type="item", name="seed-rampant-industry", amount_min=0, amount_max=2}
        }
        recipeBalanced.main_product = ""
        recipeBalanced.order = "a"

        local recipeGrow = table.deepcopy(recipeTemplate)
        recipeGrow.name = "grow-tree-rampant-industry"
        recipeGrow.icon = "__RampantIndustry__/graphics/icons/recipe-grow.png"
        recipeGrow.icon_size = 64
        recipeGrow.icon_mipmaps = 1
        recipeGrow.ingredients = {
            {type="item", name="seed-rampant-industry", amount=3},
            {type="fluid", name="water", amount=9000}
        }
        recipeGrow.energy_required = 22
        recipeGrow.results = {
            {type="item", name="wood", amount_min=4, amount_max=12},
            {type="item", name="seed-rampant-industry", amount_min=0, amount_max=1}
        }
        recipeGrow.main_product = ""
        recipeGrow.order = "b"

        local recipeHarvest = table.deepcopy(recipeTemplate)
        recipeHarvest.name = "grow-harvest-rampant-industry"
        recipeHarvest.icon = "__RampantIndustry__/graphics/icons/recipe-harvest.png"
        recipeHarvest.icon_size = 64
        recipeHarvest.icon_mipmaps = 1
        recipeHarvest.ingredients = {
            {type="item", name="wood", amount=3},
            {type="fluid", name="water", amount=8250}
        }
        recipeHarvest.energy_required = 22
        recipeHarvest.results = {
            {type="item", name="seed-rampant-industry", amount_min=2, amount_max=5},
            {type="item", name="wood", amount_min=0, amount_max=2}
        }
        recipeHarvest.main_product = ""
        recipeHarvest.order = "c"

        local recipeBalanced2 = table.deepcopy(recipeTemplate)
        recipeBalanced2.name = "grow-balanced-2-rampant-industry"
        recipeBalanced2.icon = "__RampantIndustry__/graphics/icons/recipe-balanced-2.png"
        recipeBalanced2.icon_size = 64
        recipeBalanced2.icon_mipmaps = 1
        recipeBalanced2.ingredients = {
            {type="item", name="seed-rampant-industry", amount=3},
            {type="fluid", name="water", amount=10000},
            {type="item", name="sulfur", amount=1}
        }
        recipeBalanced2.energy_required = 22
        recipeBalanced2.results = {
            {type="item", name="wood", amount_min=5, amount_max=14},
            {type="item", name="seed-rampant-industry", amount_min=1, amount_max=3}
        }
        recipeBalanced2.main_product = ""
        recipeBalanced2.order = "ab"

        local recipeGrow2 = table.deepcopy(recipeTemplate)
        recipeGrow2.name = "grow-tree-2-rampant-industry"
        recipeGrow2.icon = "__RampantIndustry__/graphics/icons/recipe-grow-2.png"
        recipeGrow2.icon_size = 64
        recipeGrow2.icon_mipmaps = 1
        recipeGrow2.ingredients = {
            {type="item", name="seed-rampant-industry", amount=4},
            {type="fluid", name="water", amount=12500},
            {type="item", name="sulfur", amount=1}
        }
        recipeGrow2.energy_required = 22
        recipeGrow2.results = {
            {type="item", name="wood", amount_min=7, amount_max=19},
            {type="item", name="seed-rampant-industry", amount_min=0, amount_max=1}
        }
        recipeGrow2.main_product = ""
        recipeGrow2.order = "ba"

        local recipeHarvest2 = table.deepcopy(recipeTemplate)
        recipeHarvest2.name = "grow-harvest-2-rampant-industry"
        recipeHarvest2.icon = "__RampantIndustry__/graphics/icons/recipe-harvest-2.png"
        recipeHarvest2.icon_size = 64
        recipeHarvest2.icon_mipmaps = 1
        recipeHarvest2.ingredients = {
            {type="item", name="wood", amount=4},
            {type="fluid", name="water", amount=11000},
            {type="item", name="sulfur", amount=1}
        }
        recipeHarvest2.energy_required = 22
        recipeHarvest2.results = {
            {type="item", name="seed-rampant-industry", amount_min=5, amount_max=9},
            {type="item", name="wood", amount_min=2, amount_max=5}
        }
        recipeHarvest2.main_product = ""
        recipeHarvest2.order = "ca"

        local item = table.deepcopy(data.raw["item"]["lab"])
        item.name = "greenhouse-rampant-industry"
        item.icons = {{icon = item.icon, tint={r=0.5,g=0.8,b=0.5,a=1}}}
        item.icon = nil
        item.place_result = "greenhouse-rampant-industry"
        item.order = "g[zzlab]"

        local itemSeed = table.deepcopy(data.raw["item"]["wood"])
        itemSeed.name = "seed-rampant-industry"
        itemSeed.fuel_value = "1KJ"
        itemSeed.subgroup = "intermediate-product"
        itemSeed.icon = "__RampantIndustry__/graphics/icons/recipe-harvest.png"
        itemSeed.icon_size = 64
        itemSeed.icon_mipmaps = 1


        addEffectToTech("greenhouse",
                        {
                            type = "unlock-recipe",
                            recipe = recipe.name
        })
        addEffectToTech("greenhouse",
                        {
                            type = "unlock-recipe",
                            recipe = recipeHarvest.name
        })
        addEffectToTech("greenhouse",
                        {
                            type = "unlock-recipe",
                            recipe = recipeGrow.name
        })
        addEffectToTech("greenhouse",
                        {
                            type = "unlock-recipe",
                            recipe = recipeBalanced.name
        })

        addEffectToTech("greenhouse-2",
                        {
                            type = "unlock-recipe",
                            recipe = recipeHarvest2.name
        })
        addEffectToTech("greenhouse-2",
                        {
                            type = "unlock-recipe",
                            recipe = recipeGrow2.name
        })
        addEffectToTech("greenhouse-2",
                        {
                            type = "unlock-recipe",
                            recipe = recipeBalanced2.name
        })

        data:extend({
                {
                    type = "recipe-category",
                    name = "greenhouse-rampant-industry"
                },
                greenhouse,
                item,
                itemSeed,
                recipe,
                recipeGrow,
                recipeGrow2,
                recipeHarvest,
                recipeHarvest2,
                recipeBalanced,
                recipeBalanced2
        })
    end

    if settings.startup["rampant-industry-enableLargeStorageTank"].value then
        data:extend({
                {
                    type = "corpse",
                    name = "large-storage-tank-remnants-rampant-industry",
                    icon = "__base__/graphics/icons/storage-tank.png",
                    icon_size = 64, icon_mipmaps = 4,
                    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
                    selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
                    tile_width = 3,
                    tile_height = 3,
                    selectable_in_game = false,
                    subgroup = "remnants",
                    order="d[remnants]-a[generic]-b[medium]",
                    time_before_removed = 60 * 60 * 15, -- 15 minutes
                    final_render_layer = "remnants",
                    remove_on_tile_placement = false,
                    animation = make_rotated_animation_variations_from_sheet(1,
                                                                             {
                                                                                 filename = "__base__/graphics/entity/storage-tank/remnants/storage-tank-remnants.png",
                                                                                 line_length = 1,
                                                                                 width = 214,
                                                                                 height = 142,
                                                                                 frame_count = 1,
                                                                                 direction_count = 1,
                                                                                 shift = util.by_pixel(27, 21), --shift = util.by_pixel(-3, 10.5),
                                                                                 scale = 4,
                                                                                 hr_version =
                                                                                     {
                                                                                         filename = "__base__/graphics/entity/storage-tank/remnants/hr-storage-tank-remnants.png",
                                                                                         line_length = 1,
                                                                                         width = 426,
                                                                                         height = 282,
                                                                                         frame_count = 1,
                                                                                         direction_count = 1,
                                                                                         shift = util.by_pixel(27, 21), --shift = util.by_pixel(-2.5, 10.5),
                                                                                         scale = 2
                                                                                     }
                    })
                }
        })

        local storageTank = table.deepcopy(data.raw["storage-tank"]["storage-tank"])
        storageTank.minable.mining_time = 3
        storageTank.next_upgrade = nil
        storageTank.name = "large-storage-tank-rampant-industry"
        storageTank.minable.result = "large-storage-tank-rampant-industry"
        storageTank.collision_box[1][1] = storageTank.collision_box[1][1] * 4
        storageTank.collision_box[1][2] = storageTank.collision_box[1][2] * 4
        storageTank.collision_box[2][1] = storageTank.collision_box[2][1] * 4
        storageTank.collision_box[2][2] = storageTank.collision_box[2][2] * 4

        storageTank.next_upgrade = nil

        storageTank.selection_box[1][1] = storageTank.selection_box[1][1] * 4
        storageTank.selection_box[1][2] = storageTank.selection_box[1][2] * 4
        storageTank.selection_box[2][1] = storageTank.selection_box[2][1] * 4
        storageTank.selection_box[2][2] = storageTank.selection_box[2][2] * 4
        storageTank.drawing_box = nil
        storageTank.corpse = "large-storage-tank-remnants-rampant-industry"
        storageTank.window_bounding_box = {{0, 0.5}, {0, 3}}
        storageTank.circuit_connector_sprites = {{connector_main={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04a-base-sequence.png",priority="low",width=52,height=50,scale=0.5,x=156,y=150,shift={1.046875 + 3.2,0.609375 + 3}},
                                                  wire_pins={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04c-wire-sequence.png",priority="low",width=62,height=58,scale=0.5,x=186,y=174,shift={1.046875 + 3.2,0.578125 + 3}},
                                                  wire_pins_shadow={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04d-wire-shadow-sequence.png",priority="low",draw_as_shadow=true,width=70,height=54,scale=0.5,x=210,y=162,shift={1.203125 + 3.2,0.703125 + 3}},
                                                  led_blue={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04e-blue-LED-on-sequence.png",priority="low",width=60,height=60,scale=0.5,x=180,y=180,shift={1.046875 + 3.2,0.578125 + 3}},
                                                  led_blue_off={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04f-blue-LED-off-sequence.png",priority="low",width=46,height=44,scale=0.5,x=138,y=132,shift={1.046875 + 3.2,0.578125 + 3}},
                                                  led_green={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04h-green-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=144,y=138,shift={1.046875 + 3.2,0.578125 + 3}},
                                                  led_red={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04i-red-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=144,y=138,shift={1.046875 + 3.2,0.578125 + 3}},
                                                  led_light={intensity=0.8,size=0.9},
                                                  blue_led_light_offset={1.203125 + 3.2,0.828125 + 3},
                                                  red_green_led_light_offset={1.203125 + 3.2,0.71875 + 3}},
            {connector_main={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04a-base-sequence.png",priority="low",width=52,height=50,scale=0.5,x=52,y=150,shift={-1.046875 + 3.2,0.640625 + 3}},
             wire_pins={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04c-wire-sequence.png",priority="low",width=62,height=58,scale=0.5,x=62,y=174,shift={-1.046875 + 3.2,0.609375 + 3}},
             wire_pins_shadow={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04d-wire-shadow-sequence.png",priority="low",draw_as_shadow=true,width=70,height=54,scale=0.5,x=70,y=162,shift={-0.890625 + 3,0.734375 + 3}},
             led_blue={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04e-blue-LED-on-sequence.png",priority="low",width=60,height=60,scale=0.5,x=60,y=180,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_blue_off={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04f-blue-LED-off-sequence.png",priority="low",width=46,height=44,scale=0.5,x=46,y=132,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_green={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04h-green-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=48,y=138,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_red={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04i-red-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=48,y=138,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_light={intensity=0.8,size=0.9},
             blue_led_light_offset={-1.15625 + 3,0.875 + 3},
             red_green_led_light_offset={-1.15625 + 3,0.765625 + 3}},
            {connector_main={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04a-base-sequence.png",priority="low",width=52,height=50,scale=0.5,x=156,y=150,shift={1.046875 + 3.2,0.609375 + 3}},
             wire_pins={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04c-wire-sequence.png",priority="low",width=62,height=58,scale=0.5,x=186,y=174,shift={1.046875 + 3.2,0.578125 + 3}},
             wire_pins_shadow={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04d-wire-shadow-sequence.png",priority="low",draw_as_shadow=true,width=70,height=54,scale=0.5,x=210,y=162,shift={1.203125 + 3.2,0.703125 + 3}},
             led_blue={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04e-blue-LED-on-sequence.png",priority="low",width=60,height=60,scale=0.5,x=180,y=180,shift={1.046875 + 3.2,0.578125 + 3}},
             led_blue_off={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04f-blue-LED-off-sequence.png",priority="low",width=46,height=44,scale=0.5,x=138,y=132,shift={1.046875 + 3.2,0.578125 + 3}},
             led_green={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04h-green-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=144,y=138,shift={1.046875 + 3.2,0.578125 + 3}},
             led_red={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04i-red-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=144,y=138,shift={1.046875 + 3.2,0.578125 + 3}},
             led_light={intensity=0.8,size=0.9},
             blue_led_light_offset={1.203125 + 3.2,0.828125 + 3},
             red_green_led_light_offset={1.203125 + 3.2,0.71875 + 3}},
            {connector_main={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04a-base-sequence.png",priority="low",width=52,height=50,scale=0.5,x=52,y=150,shift={-1.046875 + 3.2,0.640625 + 3}},
             wire_pins={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04c-wire-sequence.png",priority="low",width=62,height=58,scale=0.5,x=62,y=174,shift={-1.046875 + 3.2,0.609375 + 3}},
             wire_pins_shadow={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04d-wire-shadow-sequence.png",priority="low",draw_as_shadow=true,width=70,height=54,scale=0.5,x=70,y=162,shift={-0.890625 + 3,0.734375 + 3}},
             led_blue={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04e-blue-LED-on-sequence.png",priority="low",width=60,height=60,scale=0.5,x=60,y=180,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_blue_off={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04f-blue-LED-off-sequence.png",priority="low",width=46,height=44,scale=0.5,x=46,y=132,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_green={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04h-green-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=48,y=138,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_red={filename="__base__/graphics/entity/circuit-connector/hr-ccm-universal-04i-red-LED-sequence.png",priority="low",width=48,height=46,scale=0.5,x=48,y=138,shift={-1.046875 + 3.2,0.609375 + 3}},
             led_light={intensity=0.8,size=0.9},
             blue_led_light_offset={-1.15625 + 3,0.875 + 3},
             red_green_led_light_offset={-1.15625 + 3,0.765625 + 3}}}
        storageTank.circuit_wire_connection_points = {
            {wire={red={1.34375 + 3.2,0.46875 + 3},green={1.40625 + 3.2,0.6875 + 3}},
             shadow={red={1.65625 + 3.2,0.703125 + 3},green={1.5 + 3.2,0.71875 + 3}}},
            {wire={red={-0.90625 + 3.2,0.8125 + 3},green={-0.984375 + 3.2,1 + 3}},
             shadow={red={-0.59375 + 3.2,1.078125 + 3},green={-0.828125 + 3.2,1.109375 + 3}}},
            {wire={red={1.34375 + 3.2,0.46875 + 3},green={1.40625 + 3.2,0.6875 + 3}},
             shadow={red={1.65625 + 3.2,0.703125 + 3},green={1.5 + 3.2,0.71875 + 3}}},
            {wire={red={-0.90625 + 3.2,0.8125 + 3},green={-0.984375 + 3.2,1 + 3}},
             shadow={red={-0.59375 + 3.2,1.078125 + 3},green={-0.828125 + 3.2,1.109375 + 3}}}}

        storageTank.next_upgrade = ""

        storageTank.pictures = {
            picture =
                {
                    sheets =
                        {
                            {
                                filename = "__RampantIndustry__/graphics/entities/lr-large-storage-tank.png",
                                priority = "extra-high",
                                frames = 2,
                                width = 109.5,
                                height = 108,
                                shift = util.by_pixel(-0.25, 3.75),
                                scale = 1,
                                hr_version =
                                    {
                                        filename = "__RampantIndustry__/graphics/entities/large-storage-tank.png",
                                        priority = "extra-high",
                                        frames = 2,
                                        width = 219,
                                        height = 215,
                                        shift = util.by_pixel(-0.25, 3.75),
                                        scale = 1
                                    }
                            },
                            {
                                filename = "__base__/graphics/entity/storage-tank/storage-tank-shadow.png",
                                priority = "extra-high",
                                frames = 2,
                                width = 146,
                                height = 77,
                                shift = util.by_pixel(105, 22.5),
                                scale = 1,
                                draw_as_shadow = true,
                                hr_version =
                                    {
                                        filename = "__base__/graphics/entity/storage-tank/hr-storage-tank-shadow.png",
                                        priority = "extra-high",
                                        frames = 2,
                                        width = 291,
                                        height = 153,
                                        shift = util.by_pixel(105, 22.25),
                                        scale = 1,
                                        draw_as_shadow = true
                                    }
                            }
                        }
                },
            fluid_background =
                {
                    -- filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
                    filename = "__RampantIndustry__/graphics/entities/fluid-background.png",
                    priority = "extra-high",
                    width = 45,
                    height = 35,
                    shift = {0,1.7},
                    scale = 1.2
                },
            window_background =
                {
                    filename = "__base__/graphics/entity/storage-tank/window-background.png",
                    priority = "extra-high",
                    width = 17,
                    height = 24,
                    scale = 2,
                    shift = {0,1.7},
                    hr_version =
                        {
                            filename = "__base__/graphics/entity/storage-tank/hr-window-background.png",
                            priority = "extra-high",
                            width = 34,
                            height = 48,
                            shift = {0,1.7},
                            scale = 1
                        }
                },
            flow_sprite =
                {
                    filename = "__RampantIndustry__/graphics/entities/fluid-flow-low-temperature.png",
                    priority = "extra-high",
                    width = 160,
                    height = 60,
                    shift = {0,1.7},
                    scale = 1
                },
            gas_flow = {
                filename = "__base__/graphics/entity/pipe/steam.png",
                priority = "extra-high",
                line_length = 10,
                width = 24,
                height = 15,
                frame_count = 60,
                axially_symmetrical = false,
                direction_count = 1,
                animation_speed = 0.25,
                shift = {0.2,1.7},
                scale = 2,
                hr_version =
                    {
                        filename = "__RampantIndustry__/graphics/entities/hr-steam.png",
                        priority = "extra-high",
                        line_length = 10,
                        width = 48,
                        height = 120,
                        frame_count = 60,
                        shift = {0.2,1.7},
                        axially_symmetrical = false,
                        animation_speed = 0.25,
                        direction_count = 1
                    }
            }
        }

        storageTank.max_health = 2000

        storageTank.fluid_box.base_area = 6000
        storageTank.fluid_box.pipe_connections =
            {
                { position = {-4, 6} },
                { position = {-3, 6} },
                { position = {-6, 3} },
                { position = {-6, 4} },

                { position = {4, -6} },
                { position = {3, -6} },
                { position = {6, -3} },
                { position = {6, -4} }
            }

        scalePicture(2, storageTank.pictures)

        local recipe = table.deepcopy(data.raw["recipe"]["storage-tank"])
        recipe.name = "large-storage-tank-rampant-industry"
        recipe.ingredients = {
            {"steel-plate", 20},
            {"electronic-circuit", 30},
            {"storage-tank", 16}
        }
        recipe.energy_required = 30
        recipe.result = "large-storage-tank-rampant-industry"

        local item = table.deepcopy(data.raw["item"]["storage-tank"])
        item.name = "large-storage-tank-rampant-industry"
        item.icons = {{icon = item.icon, tint={0.8,0.8,1,1}}}
        item.icon = nil
        item.place_result = "large-storage-tank-rampant-industry"
        item.order = "b[fluid]-a[zstorage-tank]"

        addEffectToTech("large-storage-tank-2",
                        {
                            type = "unlock-recipe",
                            recipe = recipe.name,
        })

        data:extend({
                storageTank,
                recipe,
                item
        })
    end

    if settings.startup["rampant-industry-enableAirFiltering"].value then
        local airFilter = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-2"])
        airFilter.name = "air-filter-rampant-industry"
        airFilter.fixed_recipe = "air-filter-pollution-rampant-industry"
        airFilter.crafting_categories = { "air-filter-rampant-industry" }
        airFilter.minable = {mining_time=2,result="air-filter-rampant-industry"}
        airFilter.next_upgrade = nil
        airFilter.energy_usage = "750KW"
        airFilter.energy_source.drain = "500KW"
        airFilter.match_speed_to_activity = true
        airFilter.match_volume_to_activity = true
        airFilter.crafting_speed = 1
        airFilter.module_specification.module_slots = 0
        airFilter.fast_replaceable_group = nil
        airFilter.default_recipe_tint = {
            primary = {r=0,g=1,b=1,a=1},
            secondary = {r=1,g=1,b=1,a=1},
            tertiary = {r=1,g=1,b=1,a=1},
            quaternary = {r=1,g=1,b=1,a=1}
        }
        airFilter.allowed_effects = { "speed", "productivity", "consumption", "pollution" }
        airFilter.animation = {
            layers =
                {
                    {
                        filename = "__RampantIndustry__/graphics/entities/hr-air-filter.png",
                        priority = "high",
                        width = 275,
                        height = 210,
                        frame_count = 8,
                        line_length = 4,
                        shift = {-0.45, -0.1},
                        scale = 0.6,
                        hr_version =
                            {
                                filename = "__RampantIndustry__/graphics/entities/hr-air-filter.png",
                                priority = "high",
                                width = 275,
                                height = 210,
                                frame_count = 8,
                                line_length = 4,
                                shift = {-0.45, -0.1},
                                scale = 0.6
                            }
                    },
                    {
                        filename = "__RampantIndustry__/graphics/entities/hr-air-filter-shadow.png",
                        priority = "high",
                        width = 260,
                        height = 162,
                        frame_count = 8,
                        line_length = 4,
                        draw_as_shadow = true,
                        shift = util.by_pixel(28, 4),
                        hr_version =
                            {
                                filename = "__RampantIndustry__/graphics/entities/hr-air-filter-shadow.png",
                                priority = "high",
                                width = 260,
                                height = 162,
                                frame_count = 8,
                                line_length = 4,
                                draw_as_shadow = true,
                                shift = util.by_pixel(28, 4),
                                scale = 0.5
                            }
                    }
                }
        }
        airFilter.idle_animation =  airFilter.animation
        airFilter.always_draw_idle_animation = true
        airFilter.fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {
                    { type="input", position = {-1, -2} }
                },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {
                    { type="input", position = {1, -2} }
                },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 1,
                base_level = 1,
                pipe_connections = {
                    { type="output", position = {-1, 2} }
                },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 1,
                base_level = 1,
                pipe_connections = {
                    { type="output", position = {1, 2} }
                },
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = false
        }

        airFilter.fluid_boxes[2].pipe_picture.east = {
            filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-E.png",
            priority = "extra-high",
            width = 42,
            height = 76,
            shift = util.by_pixel(-24.5, 1),
            hr_version =
                {
                    filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-E.png",
                    priority = "extra-high",
                    width = 42,
                    height = 76,
                    shift = util.by_pixel(-24.5, 1),
                    scale = 0.5
                }
        }
        airFilter.fluid_boxes[2].pipe_picture.west = {
            filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-W.png",
            priority = "extra-high",
            width = 39,
            height = 73,
            shift = util.by_pixel(25.75, 1.25),
            hr_version =
                {
                    filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-W.png",
                    priority = "extra-high",
                    width = 39,
                    height = 73,
                    shift = util.by_pixel(25.75, 1.25),
                    scale = 0.5
                }
        }


        local airFilter2 = table.deepcopy(airFilter)
        airFilter2.name = "air-filter-2-rampant-industry"
        airFilter2.fixed_recipe = "air-filter-2-pollution-rampant-industry"
        airFilter2.crafting_categories = { "air-filter-rampant-industry" }
        airFilter2.minable = {mining_time=2,result="air-filter-2-rampant-industry"}
        airFilter2.next_upgrade = nil
        airFilter2.max_health = airFilter2.max_health * 2
        airFilter2.energy_usage = "2250KW"
        airFilter2.energy_source.drain = "1500KW"
        airFilter2.match_speed_to_activity = true
        airFilter2.match_volume_to_activity = true
        airFilter2.crafting_speed = 1
        airFilter2.module_specification.module_slots = 0
        airFilter2.fast_replaceable_group = nil
        airFilter2.animation = {
            layers =
                {
                    {
                        filename = "__RampantIndustry__/graphics/entities/hr-air-filter.png",
                        priority = "high",
                        width = 275,
                        height = 210,
                        frame_count = 8,
                        line_length = 4,
                        shift = {-0.75, -0.4},
                        scale = 1,
                        tint = { r=0.8,g=0.8,b=0.9,a=1 },
                        hr_version =
                            {
                                filename = "__RampantIndustry__/graphics/entities/hr-air-filter.png",
                                priority = "high",
                                width = 275,
                                height = 210,
                                frame_count = 8,
                                line_length = 4,
                                tint = { r=0.8,g=0.8,b=0.9,a=1 },
                                shift = {-0.75, -0.4},
                                scale = 1
                            }
                    },
                    {
                        filename = "__RampantIndustry__/graphics/entities/hr-air-filter-shadow.png",
                        priority = "high",
                        width = 260,
                        height = 162,
                        frame_count = 8,
                        line_length = 4,
                        draw_as_shadow = true,
                        shift = util.by_pixel(28, 4),
                        scale = 1.9,
                        hr_version =
                            {
                                filename = "__RampantIndustry__/graphics/entities/hr-air-filter-shadow.png",
                                priority = "high",
                                width = 260,
                                height = 162,
                                frame_count = 8,
                                line_length = 4,
                                draw_as_shadow = true,
                                shift = util.by_pixel(28, 4),
                                scale = 0.95
                            }
                    }
                }
        }

        airFilter2.collision_box[1][1] = airFilter2.collision_box[1][1] * 2.05
        airFilter2.collision_box[1][2] = airFilter2.collision_box[1][2] * 2.05
        airFilter2.collision_box[2][1] = airFilter2.collision_box[2][1] * 2.05
        airFilter2.collision_box[2][2] = airFilter2.collision_box[2][2] * 2.05

        airFilter2.drawing_box = nil
        airFilter2.selection_box[1][1] = airFilter2.selection_box[1][1] * 1.66
        airFilter2.selection_box[1][2] = airFilter2.selection_box[1][2] * 1.66
        airFilter2.selection_box[2][1] = airFilter2.selection_box[2][1] * 1.66
        airFilter2.selection_box[2][2] = airFilter2.selection_box[2][2] * 1.66
        airFilter2.fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {
                    { type="input", position = {1, -3} }
                },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {
                    { type="input", position = {-1, -3} }
                },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 2,
                base_level = 1,
                pipe_connections = {
                    { type="output", position = {1, 3} }
                },
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 2,
                base_level = 1,
                pipe_connections = {
                    { type="output", position = {-1, 3} }
                },
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = false
        }

        airFilter2.fluid_boxes[2].pipe_picture.east = {
            filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-E.png",
            priority = "extra-high",
            width = 42,
            height = 76,
            shift = util.by_pixel(-24.5, 1),
            hr_version =
                {
                    filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-E.png",
                    priority = "extra-high",
                    width = 42,
                    height = 76,
                    shift = util.by_pixel(-24.5, 1),
                    scale = 0.5
                }
        }
        airFilter2.fluid_boxes[1].pipe_picture.east = airFilter2.fluid_boxes[2].pipe_picture.east
        airFilter2.fluid_boxes[3].pipe_picture.east = airFilter2.fluid_boxes[2].pipe_picture.east
        airFilter2.fluid_boxes[4].pipe_picture.east = airFilter2.fluid_boxes[2].pipe_picture.east
        airFilter2.fluid_boxes[2].pipe_picture.west = {
            filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-W.png",
            priority = "extra-high",
            width = 39,
            height = 73,
            shift = util.by_pixel(25.75, 1.25),
            hr_version =
                {
                    filename = "__RampantIndustry__/graphics/entities/hr-assembling-machine-3-pipe-W.png",
                    priority = "extra-high",
                    width = 39,
                    height = 73,
                    shift = util.by_pixel(25.75, 1.25),
                    scale = 0.5
                }
        }
        airFilter2.fluid_boxes[1].pipe_picture.west = airFilter2.fluid_boxes[2].pipe_picture.west
        airFilter2.fluid_boxes[3].pipe_picture.west = airFilter2.fluid_boxes[2].pipe_picture.west
        airFilter2.fluid_boxes[4].pipe_picture.west = airFilter2.fluid_boxes[2].pipe_picture.west

        airFilter2.idle_animation =  airFilter2.animation


        local recipe = table.deepcopy(data.raw["recipe"]["assembling-machine-1"])
        recipe.name = "air-filter-rampant-industry"
        recipe.icon = "__RampantIndustry__/graphics/icons/air-filter.png"
        recipe.icon_size = 64
        recipe.icon_mipmaps = 1
        recipe.ingredients = {
            {"steel-plate", 20},
            {"electronic-circuit", 15},
            {"assembling-machine-2", 1},
            {"chemical-plant", 1},
            {"pump", 1}
        }
        recipe.energy_required = 30
        recipe.hidden = false
        recipe.enabled = false
        recipe.result = "air-filter-rampant-industry"

        local recipe2 = table.deepcopy(data.raw["recipe"]["assembling-machine-1"])
        recipe2.name = "air-filter-2-rampant-industry"
        recipe2.icon = nil
        recipe2.icons = {
            {icon = "__RampantIndustry__/graphics/icons/air-filter.png", tint = {0.8,0.8,1,1}}
        }
        recipe2.icon_size = 64
        recipe2.icon_mipmaps = 1
        recipe2.ingredients = {
            {"steel-plate", 25},
            {"advanced-circuit", 20},
            {"steam-turbine", 1},
            {"chemical-plant", 2},
            {"pump", 1}
        }
        recipe2.energy_required = 30
        recipe2.hidden = false
        recipe2.enabled = false
        recipe2.result = "air-filter-2-rampant-industry"

        local item = table.deepcopy(data.raw["item"]["assembling-machine-2"])
        item.name = "air-filter-rampant-industry"
        item.icon = nil
        item.icons = {
            {icon = "__RampantIndustry__/graphics/icons/air-filter.png"}
        }
        item.place_result = "air-filter-rampant-industry"
        item.order = "c[zassembling-machine-3]"

        local item2 = table.deepcopy(data.raw["item"]["assembling-machine-2"])
        item2.name = "air-filter-2-rampant-industry"
        item2.icon = nil
        item2.icons = {
            {icon = "__RampantIndustry__/graphics/icons/air-filter.png", tint = {0.8,0.8,1,1}}
        }
        item2.place_result = "air-filter-2-rampant-industry"
        item2.order = "c[zzassembling-machine-3]"

        local recipePollution = table.deepcopy(data.raw["recipe"]["assembling-machine-2"])
        recipePollution.name = "air-filter-pollution-rampant-industry"
        recipePollution.category = "air-filter-rampant-industry"
        recipePollution.subgroup = "raw-material"
        recipePollution.normal.ingredients = {
            {type="fluid",name="pollution-fluid-rampant-industry", amount=20},
            {name="clean-air-filter-rampant-industry", amount=2}
        }
        recipePollution.normal.energy_required = 90
        recipePollution.normal.hide_from_player_crafting = true
        recipePollution.normal.hidden = false
        recipePollution.normal.enabled = true
        recipePollution.normal.emissions_multiplier = -10
        recipePollution.normal.allow_as_intermediate = false
        recipePollution.normal.always_show_products = true
        recipePollution.normal.show_amount_in_title = false
        recipePollution.normal.result = nil
        -- recipePollution.normal.main_product = "compressed-pollution-fluid-rampant-industry"
        recipePollution.normal.results = {
            {name="dirty-air-filter-rampant-industry", amount=2}
        }

        local recipePollution2 = table.deepcopy(data.raw["recipe"]["assembling-machine-2"])
        recipePollution2.name = "air-filter-2-pollution-rampant-industry"
        recipePollution2.category = "air-filter-rampant-industry"
        recipePollution2.subgroup = "raw-material"
        recipePollution2.normal.ingredients = {
            {type="fluid",name="pollution-fluid-rampant-industry", amount=60},
            {name="clean-air-filter-rampant-industry", amount=6}
        }
        recipePollution2.normal.energy_required = 90
        recipePollution2.normal.hide_from_player_crafting = true
        recipePollution2.normal.hidden = false
        recipePollution2.normal.enabled = true
        recipePollution2.normal.emissions_multiplier = -40
        recipePollution2.normal.allow_as_intermediate = false
        recipePollution2.normal.always_show_products = true
        recipePollution2.normal.show_amount_in_title = false
        recipePollution2.normal.result = nil
        -- recipePollution2.normal.main_product = "compressed-pollution-fluid-rampant-industry"
        recipePollution2.normal.results = {
            {name="dirty-air-filter-rampant-industry", amount=6}
        }

        local recipeAirFilter = table.deepcopy(data.raw["recipe"]["assembling-machine-2"])
        recipeAirFilter.name = "clean-air-filter-rampant-industry"
        recipeAirFilter.category = "crafting-with-fluid"
        recipeAirFilter.subgroup = "intermediate-product"
        recipeAirFilter.normal.ingredients = {
            {name="plastic-bar", amount=5},
            {type="fluid", name="water", amount=20},
            {name="empty-barrel", amount=1}
        }
        recipeAirFilter.normal.energy_required = 20
        recipeAirFilter.normal.hide_from_player_crafting = true
        recipeAirFilter.normal.hidden = false
        recipeAirFilter.normal.enabled = false
        -- recipeAirFilter.normal.emissions_multiplier = -3
        recipeAirFilter.normal.allow_as_intermediate = false
        recipeAirFilter.normal.always_show_products = true
        recipeAirFilter.normal.show_amount_in_title = false
        recipeAirFilter.normal.result = nil
        -- recipeAirFilter.normal.main_product = "compressed-pollution-fluid-rampant-industry"
        recipeAirFilter.normal.results = {
            {name="clean-air-filter-rampant-industry", amount=1}
        }

        local recipeCleanAirFilter = table.deepcopy(data.raw["recipe"]["assembling-machine-2"])
        recipeCleanAirFilter.name = "dirty-air-filter-rampant-industry"
        recipeCleanAirFilter.category = "chemistry"
        recipeCleanAirFilter.subgroup = "intermediate-product"
        recipeCleanAirFilter.icon = "__RampantIndustry__/graphics/icons/dirty-air-filter.png"
        recipeCleanAirFilter.icon_size = 64
        recipeCleanAirFilter.icon_mipmaps = 1
        recipeCleanAirFilter.normal.ingredients = {
            {name="dirty-air-filter-rampant-industry", amount=1},
            {type="fluid", name="sulfuric-acid", amount=5}
        }
        recipeCleanAirFilter.normal.energy_required = 15
        recipeCleanAirFilter.normal.hide_from_player_crafting = true
        recipeCleanAirFilter.normal.hidden = false
        recipeCleanAirFilter.normal.enabled = false
        -- recipeCleanAirFilter.normal.emissions_multiplier = -3
        recipeCleanAirFilter.normal.allow_as_intermediate = false
        recipeCleanAirFilter.normal.always_show_products = true
        recipeCleanAirFilter.normal.show_amount_in_title = false
        recipeCleanAirFilter.normal.result = nil
        -- recipeCleanAirFilter.normal.main_product = "compressed-pollution-fluid-rampant-industry"
        recipeCleanAirFilter.normal.results = {
            {name="clean-air-filter-rampant-industry", amount=1, probability = 0.95},
            {name="coal", amount=10},
            {type="fluid", name="water", amount=15}
        }

        addFluid({
                name="pollution",
                icons={{icon="__base__/graphics/icons/fluid/steam.png",
                        icon_size = 64,
                        icon_mipmaps = 4,
                        tint = {r=0.5, g=0.5, b=0.5, a=1}}},
                disableAutoBarrel = true
        })

        addFluid({
                name="compressed-pollution",
                iconSize = 64,
                iconMipmaps = 4,
                tint = {r=0.5, g=0.5, b=0.5, a=1}
        })

        cleanAirFilter = {
            type = "item",
            name = "clean-air-filter-rampant-industry",
            icon = "__RampantIndustry__/graphics/icons/clean-air-filter.png",
            icon_size = 64, icon_mipmaps = 1,
            subgroup = "raw-material",
            order = "c[copper-plate]",
            stack_size = 100
        }

        dirtyAirFilter = {
            type = "item",
            name = "dirty-air-filter-rampant-industry",
            icon = "__RampantIndustry__/graphics/icons/dirty-air-filter.png",
            icon_size = 64, icon_mipmaps = 1,
            subgroup = "raw-material",
            order = "c[copper-plate]",
            stack_size = 100
        }

        data:extend({
                {
                    type="recipe-category",
                    name="air-filter-rampant-industry"
                },
                cleanAirFilter,
                dirtyAirFilter,
                recipeAirFilter,
                recipeCleanAirFilter,
                recipePollution,
                recipePollution2,
                airFilter,
                airFilter2,
                recipe,
                recipe2,
                item,
                item2
        })

        addEffectToTech("air-filtering", {
                            type = "unlock-recipe",
                            recipe = "air-filter-rampant-industry",
        })

        addEffectToTech("air-filtering", {
                            type = "unlock-recipe",
                            recipe = "clean-air-filter-rampant-industry",
        })

        addEffectToTech("air-filtering", {
                            type = "unlock-recipe",
                            recipe = "dirty-air-filter-rampant-industry",
        })

        addEffectToTech("air-filtering-2", {
                            type = "unlock-recipe",
                            recipe = "air-filter-2-rampant-industry",
        })
    end

    if settings.startup["rampant-industry-enableAdvancedRepairPack"].value then
        data:extend({
                {
                    type = "repair-tool",
                    name = "advanced-repair-pack-rampant-industry",
                    icons = {{ icon="__base__/graphics/icons/repair-pack.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}},
                    icon_size = 64, icon_mipmaps = 4,
                    subgroup = "tool",
                    order = "b[repair]-b[repair-pack]",
                    speed = 3,
                    durability = 750,
                    stack_size = 100
                },
                {
                    type = "recipe",
                    name = "advanced-repair-pack-rampant-industry",
                    energy_required = 3,
                    enabled = false,
                    ingredients =
                        {
                            {"electronic-circuit", 2},
                            {"steel-plate", 2},
                            {"repair-pack", 1}
                        },
                    result = "advanced-repair-pack-rampant-industry"
                }
        })

        addEffectToTech("advanced-repair-pack",
                        {
                            type = "unlock-recipe",
                            recipe = "advanced-repair-pack-rampant-industry",
        })
    end

    if settings.startup["rampant-industry-enableAdvanceFurnace"].value then
        local corpse = table.deepcopy(data.raw["corpse"]["steel-furnace-remnants"])
        corpse.name = "advanced-furnace-corpse-rampant-industry"
        scalePicture(1.5, corpse.animation)


        local steelFurnace = table.deepcopy(data.raw["furnace"]["steel-furnace"])
        steelFurnace.name = "advanced-furnace-rampant-industry"
        steelFurnace.corpse = "advanced-furnace-corpse-rampant-industry"
        steelFurnace.minable.result = "advanced-furnace-rampant-industry"
        steelFurnace.minable.mining_time = 4
        steelFurnace.max_health = steelFurnace.max_health * 2
        scalePicture(1.5, steelFurnace.animation)
        scalePicture(1.5, steelFurnace.working_visualisations)

        steelFurnace.crafting_speed = 27
        steelFurnace.collision_box = scaleUtils.scaleBoundingBox(3.9, steelFurnace.collision_box)
        steelFurnace.selection_box = scaleUtils.scaleBoundingBox(3, steelFurnace.selection_box)

        steelFurnace.animation.layers[2].shift = {5,0.5}
        steelFurnace.animation.layers[2].hr_version.shift = {5,0.5}

        steelFurnace.working_visualisations[1].animation.shift = {0,0.30}
        steelFurnace.working_visualisations[1].animation.hr_version.shift = {0,0.30}

        steelFurnace.working_visualisations[2].animation.shift = {0,0}

        steelFurnace.working_visualisations[3].animation.shift = {0,-0.6}
        steelFurnace.working_visualisations[3].animation.hr_version.shift = {0,-0.6}

        steelFurnace.working_visualisations[4].animation.shift = {0,4}
        steelFurnace.working_visualisations[4].animation.hr_version.shift = {0,4}

        steelFurnace.fast_replaceable_group = nil
        steelFurnace.next_upgrade = nil

        steelFurnace.module_specification =
            {
                module_slots = settings.startup["rampant-industry--advanced-furnace-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }

        steelFurnace.allowed_effects = {"speed", "productivity", "consumption", "pollution"}

        steelFurnace.energy_source = {
            type = "burner",
            fuel_category = "chemical",
            effectivity = 1,
            emissions_per_minute = 54,
            fuel_inventory_size = 1,
            light_flicker =
                {
                    color = {0,0,0},
                    minimum_intensity = 0.6,
                    maximum_intensity = 0.95
                },
            smoke =
                {
                    {
                        name = "smoke",
                        frequency = 10,
                        position = {3, -3},
                        starting_vertical_speed = 0.08,
                        starting_frame_deviation = 60
                    }
                }
        }

        local item = table.deepcopy(data.raw["item"]["steel-furnace"])
        item.name = "advanced-furnace-rampant-industry"
        item.icon = nil
        item.icons = {
            {icon = "__base__/graphics/icons/steel-furnace.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        item.place_result = "advanced-furnace-rampant-industry"
        item.order = "b[zsteel-furnace]"

        local recipe = table.deepcopy(data.raw["recipe"]["steel-furnace"])
        recipe.name = "advanced-furnace-rampant-industry"
        recipe.icons = {
            {icon = "__base__/graphics/icons/steel-furnace.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        recipe.ingredients = {
            {"steel-plate", 20},
            {"electronic-circuit", 30},
            {"chemical-plant", 3},
            {"steel-furnace", 9}
        }
        recipe.energy_required = 30
        recipe.hidden = false
        recipe.enabled = false
        recipe.order = "b[zsteel-furnace]"
        recipe.result = "advanced-furnace-rampant-industry"

        data:extend{
            corpse,
            steelFurnace,
            item,
            recipe
        }

        addEffectToTech("advanced-material-processing-3",
                        {
                            type = "unlock-recipe",
                            recipe = "advanced-furnace-rampant-industry",
        })
    end

    if settings.startup["rampant-industry-enableAdvanceOilRefinery"].value then

        local corpse = table.deepcopy(data.raw["corpse"]["oil-refinery-remnants"])
        corpse.name = "advanced-oil-refinery-corpse-rampant-industry"
        scalePicture(1.5, corpse.animation)


        local refinery = table.deepcopy(data.raw["assembling-machine"]["oil-refinery"])
        refinery.name = "advanced-oil-refinery-rampant-industry"
        refinery.corpse = "advanced-oil-refinery-corpse-rampant-industry"
        refinery.minable.result = "advanced-oil-refinery-rampant-industry"
        refinery.minable.mining_time = 4
        refinery.max_health = refinery.max_health * 2
        scalePicture(1.45, refinery.animation)
        scalePicture(1.45, refinery.working_visualisations)

        refinery.crafting_speed = 13.5
        refinery.animation.north.layers[1].shift = {7.5,1.2}
        refinery.animation.north.layers[1].hr_version.shift = {0,-1}
        refinery.animation.south.layers[1].shift = {7.5,1.2}
        refinery.animation.south.layers[1].hr_version.shift = {0,-1}
        refinery.animation.west.layers[1].shift = {7.5,1.2}
        refinery.animation.west.layers[1].hr_version.shift = {0,-1}
        refinery.animation.east.layers[1].shift = {7.5,1.2}
        refinery.animation.east.layers[1].hr_version.shift = {0,-1}

        refinery.animation.north.layers[2].shift = {7.5,1.2}
        refinery.animation.north.layers[2].hr_version.shift = {6,-1}
        refinery.animation.south.layers[2].shift = {7.5,1.2}
        refinery.animation.south.layers[2].hr_version.shift = {6,-1}
        refinery.animation.west.layers[2].shift = {7.5,1.2}
        refinery.animation.west.layers[2].hr_version.shift = {6,-1}
        refinery.animation.east.layers[2].shift = {7.5,1.2}
        refinery.animation.east.layers[2].hr_version.shift = {6,-1}

        refinery.working_visualisations[1].north_position = {-2.85,-14}
        refinery.working_visualisations[1].east_position = {-10.625,-13.75}
        refinery.working_visualisations[1].south_position = {-11.1,-15.75}
        refinery.working_visualisations[1].west_position = {-0.75,-13.5}
        refinery.working_visualisations[1].animation.shift = {6, 7}
        refinery.working_visualisations[1].animation.hr_version.shift = {6, 7}

        refinery.working_visualisations[2].north_animation.shift = {0,-4.9}
        refinery.working_visualisations[2].north_animation.hr_version.shift = {0,-4.9}

        refinery.working_visualisations[2].east_animation.shift = {-0.1,-4.9}
        refinery.working_visualisations[2].east_animation.hr_version.shift = {-0.1,-4.9}

        refinery.working_visualisations[2].south_animation.shift = {-0.075,-4.82}
        refinery.working_visualisations[2].south_animation.hr_version.shift = {-0.075,-4.82}

        refinery.working_visualisations[2].west_animation.shift = {-0.3,-4.85}
        refinery.working_visualisations[2].west_animation.hr_version.shift = {-0.3,-4.85}

        refinery.collision_box = scaleUtils.scaleBoundingBox(2.95, refinery.collision_box)
        refinery.selection_box = scaleUtils.scaleBoundingBox(2.5, refinery.selection_box)

        refinery.fast_replaceable_group = nil
        refinery.next_upgrade = nil

        refinery.module_specification =
            {
                module_slots = settings.startup["rampant-industry--advanced-refinery-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }

        refinery.fluid_boxes =  {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-4, 8} }}
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {4, 8} }}
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-2, 8} }}
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {2, 8} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {{ position = {-5, -8} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {{ position = {-7, -8} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {{ position = {1, -8} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {{ position = {-1, -8} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {{ position = {5, -8} }}
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_level = 1,
                pipe_connections = {{ position = {7, -8} }}
            }
        }

        refinery.energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 81
            }
        refinery.energy_usage = "5859kW"

        local item = table.deepcopy(data.raw["item"]["oil-refinery"])
        item.name = "advanced-oil-refinery-rampant-industry"
        item.icon = nil
        item.icons = {
            {icon = "__base__/graphics/icons/oil-refinery.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        item.place_result = "advanced-oil-refinery-rampant-industry"
        item.order = "c[zassembling-machine-3]"

        local recipe = table.deepcopy(data.raw["recipe"]["oil-refinery"])
        recipe.name = "advanced-oil-refinery-rampant-industry"
        recipe.icons = {
            {icon = "__base__/graphics/icons/oil-refinery.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        recipe.ingredients = {
            {"steel-plate", 20},
            {"processing-unit", 30},
            {"chemical-plant", 2},
            {"electric-engine-unit", 10},
            {"oil-refinery", 9}
        }
        recipe.energy_required = 30
        recipe.hidden = false
        recipe.enabled = false
        recipe.order = "d[zrefinery]"
        recipe.result = "advanced-oil-refinery-rampant-industry"

        data:extend{
            corpse,
            refinery,
            item,
            recipe
        }

        addEffectToTech("oil-processing-2",
                        {
                            type = "unlock-recipe",
                            recipe = "advanced-oil-refinery-rampant-industry",
        })

    end

    if settings.startup["rampant-industry-enableAdvanceAssembler"].value then
        local corpse = table.deepcopy(data.raw["corpse"]["assembling-machine-3-remnants"])
        corpse.name = "advanced-assembler-corpse-rampant-industry"
        scalePicture(1.5, corpse.animation)


        local assembler = table.deepcopy(data.raw["assembling-machine"]["assembling-machine-3"])
        assembler.name = "advanced-assembler-rampant-industry"
        assembler.corpse = "advanced-assembler-corpse-rampant-industry"
        assembler.minable.result = "advanced-assembler-rampant-industry"
        assembler.minable.mining_time = 4
        assembler.max_health = assembler.max_health * 2
        scalePicture(1.6, assembler.animation)

        assembler.crafting_speed = 16.875
        assembler.animation.layers[2].shift = {5,0.5}
        assembler.animation.layers[2].hr_version.shift = {5,0.5}

        assembler.collision_box = scaleUtils.scaleBoundingBox(3.34, assembler.collision_box)
        assembler.selection_box = scaleUtils.scaleBoundingBox(2.5, assembler.selection_box)

        assembler.fast_replaceable_group = nil
        assembler.next_upgrade = nil

        assembler.fluid_boxes = {
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {1.5, -4.6} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-1.5, -4.6} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {1.5, 4.6} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_picture = assembler3pipepictures(),
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {-1.5, 4.6} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = true
        }

        assembler.energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 27
            }
        assembler.energy_usage = "5MW"

        assembler.module_specification =
            {
                module_slots = settings.startup["rampant-industry--advanced-assembler-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }


        local item = table.deepcopy(data.raw["item"]["assembling-machine-3"])
        item.name = "advanced-assembler-rampant-industry"
        item.icon = nil
        item.icons = {
            {icon = "__base__/graphics/icons/assembling-machine-3.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        item.place_result = "advanced-assembler-rampant-industry"
        item.order = "c[zassembling-machine-3]"

        local recipe = table.deepcopy(data.raw["recipe"]["assembling-machine-3"])
        recipe.name = "advanced-assembler-rampant-industry"
        recipe.icons = {
            {icon = "__base__/graphics/icons/assembling-machine-3.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        recipe.ingredients = {
            {"steel-plate", 20},
            {"processing-unit", 30},
            {"electric-engine-unit", 10},
            {"lab", 2},
            {"assembling-machine-3", 9}
        }
        recipe.energy_required = 30
        recipe.hidden = false
        recipe.enabled = false
        recipe.order = "c[zassembling-machine-3]"
        recipe.result = "advanced-assembler-rampant-industry"

        data:extend{
            corpse,
            assembler,
            item,
            recipe
        }

        addEffectToTech("automation-4",
                        {
                            type = "unlock-recipe",
                            recipe = "advanced-assembler-rampant-industry",
        })

    end

    if settings.startup["rampant-industry-enableAdvanceElectricFurnace"].value then
        local corpse = table.deepcopy(data.raw["corpse"]["electric-furnace-remnants"])
        corpse.name = "advanced-electric-furnace-corpse-rampant-industry"
        scalePicture(1.5, corpse.animation)


        local electricFurnace = table.deepcopy(data.raw["furnace"]["electric-furnace"])
        electricFurnace.name = "advanced-electric-furnace-rampant-industry"
        electricFurnace.corpse = "advanced-electric-furnace-corpse-rampant-industry"
        electricFurnace.minable.result = "advanced-electric-furnace-rampant-industry"
        electricFurnace.minable.mining_time = 4
        electricFurnace.max_health = electricFurnace.max_health * 2
        scalePicture(1.5, electricFurnace.animation)
        scalePicture(1.5, electricFurnace.working_visualisations)

        electricFurnace.collision_box = scaleUtils.scaleBoundingBox(3.65, electricFurnace.collision_box)
        electricFurnace.selection_box = scaleUtils.scaleBoundingBox(2.8, electricFurnace.selection_box)

        electricFurnace.animation.layers[2].shift = {5,0.5}
        electricFurnace.animation.layers[2].hr_version.shift = {5,0.5}

        electricFurnace.working_visualisations[1].animation.layers[1].shift = {0.15,2.7}
        electricFurnace.working_visualisations[1].animation.layers[1].hr_version.shift = {0.15,2.7}
        electricFurnace.working_visualisations[1].animation.layers[1].tint = {0.7,0.7,0.7,1}
        electricFurnace.working_visualisations[1].animation.layers[1].hr_version.shift = {0.15,2.7}
        electricFurnace.working_visualisations[1].animation.layers[1].hr_version.tint = {0.7,0.7,0.7,1}


        electricFurnace.working_visualisations[1].animation.layers[2].shift = {0.05,-0.35}
        electricFurnace.working_visualisations[1].animation.layers[2].hr_version.shift = {0.05,-0.35}

        electricFurnace.working_visualisations[2].animation.shift = {0.1,6}
        electricFurnace.working_visualisations[2].animation.hr_version.shift = {0.1,6}

        electricFurnace.working_visualisations[3].animation.shift = {-2,-2.1}
        electricFurnace.working_visualisations[3].animation.hr_version.shift = {-2,-2.1}

        electricFurnace.working_visualisations[4].animation.shift = {0.35,-3.885}
        electricFurnace.working_visualisations[4].animation.hr_version.shift = {0.35,-3.885}

        electricFurnace.fast_replaceable_group = nil
        electricFurnace.next_upgrade = nil

        electricFurnace.crafting_speed = 27

        electricFurnace.energy_source = {
            type = "electric",
            usage_priority = "secondary-input",
            emissions_per_minute = 13.5
        }

        electricFurnace.module_specification =
            {
                module_slots = settings.startup["rampant-industry--advanced-electric-furnace-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }

        electricFurnace.energy_usage = "2511kW"

        local item = table.deepcopy(data.raw["item"]["electric-furnace"])
        item.name = "advanced-electric-furnace-rampant-industry"
        item.icon = nil
        item.icons = {
            {icon = "__base__/graphics/icons/electric-furnace.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        item.place_result = "advanced-electric-furnace-rampant-industry"
        item.order = "c[zelectric-furnace]"

        local recipe = table.deepcopy(data.raw["recipe"]["electric-furnace"])
        recipe.name = "advanced-electric-furnace-rampant-industry"
        recipe.icons = {
            {icon = "__base__/graphics/icons/electric-furnace.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        recipe.ingredients = {
            {"steel-plate", 20},
            {"processing-unit", 30},
            {"stone-furnace", 2},
            {"electric-furnace", 9}
        }
        recipe.energy_required = 30
        recipe.hidden = false
        recipe.enabled = false
        recipe.order = "c[zelectric-furnace]"
        recipe.result = "advanced-electric-furnace-rampant-industry"

        data:extend{
            corpse,
            electricFurnace,
            item,
            recipe
        }

        addEffectToTech("advanced-material-processing-4",
                        {
                            type = "unlock-recipe",
                            recipe = "advanced-electric-furnace-rampant-industry",
        })
    end

    if settings.startup["rampant-industry-enableAdvanceChemicalPlant"].value then
        local corpse = table.deepcopy(data.raw["corpse"]["chemical-plant-remnants"])
        corpse.name = "advanced-chemical-plant-corpse-rampant-industry"
        scalePicture(1.5, corpse.animation)


        local assembler = table.deepcopy(data.raw["assembling-machine"]["chemical-plant"])
        assembler.name = "advanced-chemical-plant-rampant-industry"
        assembler.corpse = "advanced-chemical-plant-corpse-rampant-industry"
        assembler.minable.result = "advanced-chemical-plant-rampant-industry"
        assembler.minable.mining_time = 4
        assembler.max_health = assembler.max_health * 2
        scalePicture(1.5, assembler.animation)

        assembler.crafting_speed = 13.5

        assembler.collision_box = scaleUtils.scaleBoundingBox(3.4, assembler.collision_box)
        assembler.selection_box = scaleUtils.scaleBoundingBox(2.5, assembler.selection_box)

        assembler.animation.north.layers[1].shift = {0.2,-0.75}
        assembler.animation.north.layers[1].hr_version.shift = {0.2,-0.75}
        assembler.animation.south.layers[1].shift = {0.2,-0.75}
        assembler.animation.south.layers[1].hr_version.shift = {0.2,-0.75}
        assembler.animation.west.layers[1].shift = {0.075,-0.65}
        assembler.animation.west.layers[1].hr_version.shift = {0.075,-0.65}
        assembler.animation.east.layers[1].shift = {0.075,-0.65}
        assembler.animation.east.layers[1].hr_version.shift = {0.075,-0.65}

        assembler.animation.north.layers[2].shift = {4,0}
        assembler.animation.north.layers[2].hr_version.shift = {4,0}
        assembler.animation.south.layers[2].shift = {4,0}
        assembler.animation.south.layers[2].hr_version.shift = {4,0}
        assembler.animation.west.layers[2].shift = {4,0}
        assembler.animation.west.layers[2].hr_version.shift = {4,0}
        assembler.animation.east.layers[2].shift = {4,0}
        assembler.animation.east.layers[2].hr_version.shift = {4,0}

        assembler.working_visualisations[3].animation.scale = 2
        assembler.working_visualisations[3].animation.hr_version.scale = 1

        assembler.working_visualisations[4].animation.scale = 2
        assembler.working_visualisations[4].animation.hr_version.scale = 1

        assembler.working_visualisations[1].north_animation.shift = {2.25,1.5} -- water
        assembler.working_visualisations[1].north_animation.scale = 3.3
        assembler.working_visualisations[1].north_animation.hr_version.shift = {2.25,1.5}
        assembler.working_visualisations[1].north_animation.hr_version.scale = 1.65
        assembler.working_visualisations[2].north_animation.shift = {2.25,1.5} -- foam
        assembler.working_visualisations[2].north_animation.scale = 3.3
        assembler.working_visualisations[2].north_animation.hr_version.shift = {2.25,1.5}
        assembler.working_visualisations[2].north_animation.hr_version.scale = 1.65
        assembler.working_visualisations[3].north_position = {-1.3,-8.5} -- smoke
        assembler.working_visualisations[4].north_position = {-1.3,-7.8}

        assembler.working_visualisations[1].east_animation.shift = {0,2.2}
        assembler.working_visualisations[1].east_animation.scale = 3.3
        assembler.working_visualisations[1].east_animation.hr_version.shift = {0,2.2}
        assembler.working_visualisations[1].east_animation.hr_version.scale = 1.65
        assembler.working_visualisations[2].east_animation.shift = {0,2.2}
        assembler.working_visualisations[2].east_animation.scale = 3.65
        assembler.working_visualisations[2].east_animation.hr_version.shift = {0,2.2}
        assembler.working_visualisations[2].east_animation.hr_version.scale = 1.65
        assembler.working_visualisations[3].east_position = {1.3,-7.8}
        assembler.working_visualisations[4].east_position = {1.3,-7.1}

        assembler.working_visualisations[1].south_animation.shift = {0.1,1.7}
        assembler.working_visualisations[1].south_animation.scale = 3.3
        assembler.working_visualisations[1].south_animation.hr_version.shift = {0.1,1.7}
        assembler.working_visualisations[1].south_animation.hr_version.scale = 1.65
        assembler.working_visualisations[2].south_animation.shift = {0.1,1.7}
        assembler.working_visualisations[2].south_animation.scale = 3.65
        assembler.working_visualisations[2].south_animation.hr_version.shift = {0.1,1.7}
        assembler.working_visualisations[2].south_animation.hr_version.scale = 1.65
        assembler.working_visualisations[3].south_position = {0.6,-7.2}
        assembler.working_visualisations[4].south_position = {0.6,-6.5}


        assembler.working_visualisations[1].west_animation.shift = {-1,1.5}
        assembler.working_visualisations[1].west_animation.scale = 3.3
        assembler.working_visualisations[1].west_animation.hr_version.shift = {-1,1.5}
        assembler.working_visualisations[1].west_animation.hr_version.scale = 1.65
        assembler.working_visualisations[2].west_animation.shift = {-1,1.5}
        assembler.working_visualisations[2].west_animation.scale = 3.65
        assembler.working_visualisations[2].west_animation.hr_version.shift = {-1,1.5}
        assembler.working_visualisations[2].west_animation.hr_version.scale = 1.65
        assembler.working_visualisations[3].west_position = {-1.5,-6.9}
        assembler.working_visualisations[4].west_position = {-1.5,-6.2}


        assembler.fast_replaceable_group = nil
        assembler.next_upgrade = nil

        assembler.module_specification =
            {
                module_slots = settings.startup["rampant-industry--advanced-chemical-plant-module-slots"].value,
                module_info_icon_shift = {0, 0.9}
            }


        assembler.fluid_boxes = {
            {
                production_type = "input",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {2, -5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {4, -5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-2, -5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "input",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = -1,
                pipe_connections = {{ type="input", position = {-4, -5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {2, 5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {4, 5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {-2, 5} }},
                secondary_draw_orders = { north = -1 }
            },
            {
                production_type = "output",
                pipe_covers = pipecoverspictures(),
                base_area = 10,
                base_level = 1,
                pipe_connections = {{ type="output", position = {-4, 5} }},
                secondary_draw_orders = { north = -1 }
            },
            off_when_no_fluid_recipe = false
        }

        assembler.energy_source =
            {
                type = "electric",
                usage_priority = "secondary-input",
                emissions_per_minute = 54
            }
        assembler.energy_usage = "2929kW"

        local item = table.deepcopy(data.raw["item"]["chemical-plant"])
        item.name = "advanced-chemical-plant-rampant-industry"
        item.icon = nil
        item.icons = {
            {icon = "__base__/graphics/icons/chemical-plant.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        item.place_result = "advanced-chemical-plant-rampant-industry"
        item.order = "c[zassembling-machine-3]"

        local recipe = table.deepcopy(data.raw["recipe"]["chemical-plant"])
        recipe.name = "advanced-chemical-plant-rampant-industry"
        recipe.icons = {
            {icon = "__base__/graphics/icons/chemical-plant.png", icon_size=64, icon_mipmaps=4, tint={0.8,0.8,1,1}}
        }
        recipe.ingredients = {
            {"steel-plate", 20},
            {"steel-furnace", 2},
            {"electric-engine-unit", 10},
            {"chemical-plant", 9}
        }
        recipe.energy_required = 30
        recipe.hidden = false
        recipe.enabled = false
        recipe.order = "e[zchemical-plant]"
        recipe.result = "advanced-chemical-plant-rampant-industry"

        data:extend{
            corpse,
            assembler,
            item,
            recipe
        }

        addEffectToTech("advanced-chemical-plant-2",
                        {
                            type = "unlock-recipe",
                            recipe = "advanced-chemical-plant-rampant-industry",
        })
    end

end

return buildings
