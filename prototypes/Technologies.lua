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

local technologies = {}

local technologyUtils = require("utils/TechnologyUtils")

local makeTechnology = technologyUtils.makeTechnology

function technologies.enable()

    if settings.startup["rampant-industry-enableAdvancedLab"].value then
        makeTechnology({
                name="advanced-lab",
                icon="__RampantIndustry__/graphics/technology/advanced-lab.png",
                prerequisites = {"research-speed-2", "space-science-pack"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                count = 5000,
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableGreenHouse"].value then
        local greenhouse = makeTechnology({
                name="greenhouse",
                icons={
                    {
                        icon="__RampantIndustry__/graphics/technology/advanced-lab.png",
                        tint={r=0.5,g=0.8,b=0.5},
                        icon_mipmaps=4,
                        icon_size=128
                    }
                },
                prerequisites = {},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1}
                },
                count = 800,
                time = 30
        })

        makeTechnology({
                name="greenhouse-2",
                icons={
                    {
                        icon="__RampantIndustry__/graphics/technology/advanced-lab.png",
                        tint={r=0.5,g=0.8,b=0.5},
                        icon_mipmaps=4,
                        icon_size=128
                    }
                },
                prerequisites = {"chemical-science-pack", greenhouse},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                count = 2000,
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableLargeStorageTank"].value then
        makeTechnology({
                name="large-storage-tank-2",
                icon="__base__/graphics/technology/fluid-handling.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"fluid-handling", "utility-science-pack"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                count = 2000,
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableOilBurner"].value then
        makeTechnology({
                name = "oil-burner",
                icon="__RampantIndustry__/graphics/technology/oil-burner.png",
                prerequisites = {"flammables", "electric-energy-distribution-1"},
                effects = {},
                count = 120,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                },
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableAdvancedRepairPack"].value then
        makeTechnology({
                name = "advanced-repair-pack",
                icon="__base__/graphics/icons/repair-pack.png",
                iconSize=64,
                iconMipmaps=4,
                prerequisites = {"logistic-science-pack", "steel-processing"},
                effects = {},
                count = 120,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                },
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableAdvanceFurnace"].value then
        makeTechnology({
                name = "advanced-material-processing-3",
                icon="__base__/graphics/technology/advanced-material-processing.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"advanced-material-processing", "steel-processing", "space-science-pack"},
                effects = {},
                count = 3000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableAdvanceElectricFurnace"].value then
        makeTechnology({
                name = "advanced-material-processing-4",
                icon="__base__/graphics/technology/advanced-material-processing-2.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"rampant-industry-technology-advanced-material-processing-3", "space-science-pack"},
                effects = {},
                count = 5000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 60
        })
    end

    if settings.startup["rampant-industry-enableAdvanceOilRefinery"].value then
        makeTechnology({
                name = "oil-processing-2",
                icon="__base__/graphics/technology/oil-processing.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"advanced-oil-processing", "productivity-module-2", "space-science-pack"},
                effects = {},
                count = 5000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 60
        })
    end

    if settings.startup["rampant-industry-enableAdvanceAssembler"].value then
        makeTechnology({
                name = "automation-4",
                icon="__base__/graphics/technology/automation-3.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"automation-3", "productivity-module-2", "space-science-pack"},
                effects = {},
                count = 5000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 60
        })
    end

    if settings.startup["rampant-industry-enableAdvanceChemicalPlant"].value then
        makeTechnology({
                name = "advanced-chemical-plant-2",
                icon="__base__/graphics/technology/oil-gathering.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"automation-3", "productivity-module-2", "space-science-pack"},
                effects = {},
                count = 5000,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                    {"space-science-pack", 1}
                },
                time = 60
        })
    end

    if settings.startup["rampant-industry-enableAirFiltering"].value then
        makeTechnology({
                name = "air-filtering",
                icon="__RampantIndustry__/graphics/technology/air-filter.png",
                iconSize=128,
                iconMipmaps=1,
                prerequisites = {"automation-2", "oil-processing", "chemical-science-pack"},
                effects = {},
                count = 800,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1}
                },
                time = 30
        })

        makeTechnology({
                name = "air-filtering-2",
                icon="__RampantIndustry__/graphics/technology/air-filter.png",
                iconSize=128,
                iconMipmaps=1,
                prerequisites = {"rampant-industry-technology-air-filtering", "nuclear-power", "production-science-pack", "utility-science-pack"},
                effects = {},
                count = 1200,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1},
                },
                time = 60
        })
    end
end

return technologies
