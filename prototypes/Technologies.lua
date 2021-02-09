local technologies = {}

local technologyUtils = require("utils/TechnologyUtils")

local makeTechnology = technologyUtils.makeTechnology

function technologies.enable()

    if settings.startup["rampant-industry-enableAdvancedLab"].value then
        makeTechnology({
                name="advanced-lab",
                icon="__RampantIndustry__/graphics/technology/advanced-lab.png",
                prerequisites = {"research-speed-2"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                },
                count = 800,
                time = 30
        })
    end

    if settings.startup["rampant-industry-enableLargeStorageTank"].value then
        makeTechnology({
                name="large-storage-tank-2",
                icon="__base__/graphics/technology/fluid-handling.png",
                iconSize=256,
                iconMipmaps=4,
                prerequisites = {"fluid-handling"},
                effects = {},
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1}
                },
                count = 800,
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
                prerequisites = {"advanced-material-processing", "steel-processing", "production-science-pack"},
                effects = {},
                count = 200,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1}
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
                prerequisites = {"advanced-material-processing-2", "production-science-pack", "utility-science-pack"},
                effects = {},
                count = 300,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
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
                prerequisites = {"advanced-oil-processing", "productivity-module-2", "production-science-pack", "utility-science-pack"},
                effects = {},
                count = 300,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
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
                prerequisites = {"automation-3", "productivity-module-2", "production-science-pack", "utility-science-pack"},
                effects = {},
                count = 300,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
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
                prerequisites = {"automation-3", "productivity-module-2", "production-science-pack", "utility-science-pack"},
                effects = {},
                count = 300,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
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
                count = 300,
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
                count = 600,
                ingredients = {
                    {"automation-science-pack", 1},
                    {"logistic-science-pack", 1},
                    {"chemical-science-pack", 1},
                    {"production-science-pack", 1},
                    {"utility-science-pack", 1}
                },
                time = 60
        })
    end
end

return technologies
