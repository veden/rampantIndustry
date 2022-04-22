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

-- local aliens = require("prototypes/Aliens")

-- imported functions

-- local addAlienResource = aliens.addAlienResource

-- module code

-- addAlienResource()

local power = require("prototypes/Power")
local buildings = require("prototypes/Buildings")
local technologies = require("prototypes/Technologies")

technologies.enable()
power.enable()
buildings.enable()
