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
    
end

return technologies
