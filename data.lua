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
