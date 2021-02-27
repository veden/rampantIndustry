
local constants = require("libs/Constants")


-- data.raw.fluid["alien-goo"].emissions_multiplier = 3
-- data.raw.fluid["alien-goo"].fuel_value = "2.5MJ"

-- data.raw["assembling-machine"]["centrifuge"].fluid_boxes =
--     {
-- 	{
-- 	    production_type = "input",
-- 	    pipe_covers = pipecoverspictures(),
-- 	    base_area = 10,
-- 	    base_level = -1,
-- 	    pipe_connections = {{ type="input", position = {-1, -2} }}
-- 	},
-- 	{
-- 	    production_type = "input",
-- 	    pipe_covers = pipecoverspictures(),
-- 	    base_area = 10,
-- 	    base_level = -1,
-- 	    pipe_connections = {{ type="input", position = {1, -2} }}
-- 	},
-- 	{
-- 	    production_type = "output",
-- 	    pipe_covers = pipecoverspictures(),
-- 	    base_level = 2,
-- 	    pipe_connections = {{ position = {-1, 2} }}
-- 	},
-- 	{
-- 	    production_type = "output",
-- 	    pipe_covers = pipecoverspictures(),
-- 	    base_level = 2,
-- 	    pipe_connections = {{ position = {1, 2} }}
-- 	}
--     }


if mods["hardened_pipes"] then
    local entity = data.raw["pipe"]["PCHP-hardened-pipe"]
    entity.resistances[#entity.resistances+1] = {type="laser",percent=80}
    entity.resistances[#entity.resistances+1] = {type="electric",percent=80}
    entity.resistances[#entity.resistances+1] = {type="poison",percent=80}

    entity = data.raw["pipe-to-ground"]["PCHP-hardened-pipe-to-ground"]
    entity.resistances[#entity.resistances+1] = {type="laser",percent=80}
    entity.resistances[#entity.resistances+1] = {type="electric",percent=80}
    entity.resistances[#entity.resistances+1] = {type="poison",percent=80}
end
