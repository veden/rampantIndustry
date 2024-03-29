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

data:extend({

        -- {
        --     type = "int-setting",
        --     name = "rampant-industry-airFilterCooldown",
        --     description = "rampant-industry-airFilterCooldown",
        --     setting_type = 'runtime-global',
        --     default_value = 30 * 60,
        --     min_value = 1,
        --     max_value = 1000000,
        --     order = "a[modifer]-a[resource]",
        --     per_user = false
        -- },


        {
            type = "bool-setting",
            name = "rampant-industry--enableFuelEmissions",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-b[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvancedRepairPack",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAirFiltering",
            setting_type = 'startup',
            hidden = false,
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableGreenHouse",
            setting_type = 'startup',
            hidden = false,
            default_value = false,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableOilBurner",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvancedLab",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableLargeStorageTank",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvancedSolarPanel",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvanceElectricFurnace",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvanceFurnace",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvanceChemicalPlant",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvanceOilRefinery",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvanceAssembler",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "bool-setting",
            name = "rampant-industry-enableAdvancedAccumulator",
            setting_type = 'startup',
            default_value = true,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--greenhouse-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 2,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--advanced-chemical-plant-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 4,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--advanced-electric-furnace-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 4,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--advanced-furnace-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 4,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--advanced-lab-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 4,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--advanced-refinery-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 4,
            order = "a[projectile]-a[collide]",
            per_user = false
        },

        {
            type = "int-setting",
            name = "rampant-industry--advanced-assembler-module-slots",
            setting_type = 'startup',
            min_value = 0,
            max_value = 32,
            default_value = 4,
            order = "a[projectile]-a[collide]",
            per_user = false
        }


        -- {
        --     type = "bool-setting",
        --     name = "rampant-industry-infiniteSpouts",
        --     description = "rampant-industry-infiniteSpouts",
        --     setting_type = 'startup',
        --     default_value = true,
        --     order = "a[modifer]-a[resource]",
        --     per_user = false
        -- },

        -- {
        --     type = "double-setting",
        --     name = "rampant-industry-spoutThreshold",
        --     description = "rampant-industry-spoutThreshold",
        --     setting_type = 'runtime-global',
        --     default_value = 0.1,
        --     min_value = 0.0,
        --     max_value = 1.0,
        --     order = "a[modifer]-a[resource]",
        --     per_user = false
        -- },

        -- {
        --     type = "double-setting",
        --     name = "rampant-industry-spoutScaler",
        --     description = "rampant-industry-spoutThreshold",
        --     setting_type = 'runtime-global',
        --     default_value = 1.0,
        --     min_value = 0.0,
        --     max_value = 1000000.0,
        --     order = "a[modifer]-a[resource]",
        --     per_user = false
        -- }

})
