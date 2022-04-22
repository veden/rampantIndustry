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
