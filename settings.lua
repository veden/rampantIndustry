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
