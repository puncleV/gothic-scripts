func int rx_getthieftchance(var c_npc thief, var c_npc target) {
    var int schanceproc;
    var int schance;
    var int targetdex;
    var int no_leg_dividor_for_pickpocket_skill;
    var int leg_dividor_for_pickpocket_skill;
    
    no_leg_dividor_for_pickpocket_skill = Menu_ReadInt("PUNCLEVUTILS", "PickpocketDefaultDivisor");
    leg_dividor_for_pickpocket_skill = Menu_ReadInt("PUNCLEVUTILS", "PickpocketLegendaryDivisor");
    
    if (leg_dividor_for_pickpocket_skill == 0) {
        leg_dividor_for_pickpocket_skill = 12;
    };

    if (no_leg_dividor_for_pickpocket_skill == 0) {
        no_leg_dividor_for_pickpocket_skill = 6;
    };

    targetdex = target.attribute[5];
    if(rx_getnpcvar(target, aivrx_isdualwarrior) > 0) {
        targetdex = targetdex / 10;
        if(rx_monsterpower > 100) {
            targetdex = targetdex * 100 / rx_monsterpower;
        };
    };

    if(thief.attribute[5] < targetdex) {
        schance = targetdex - thief.attribute[5];
        if(npc_isinstate(target, zs_unconscious)) {
            schance = 0;
        };
        if(schance >= 100) {
            if(rx_isleg()) {
                schanceproc = 10 + (pickpocketbonuscount / leg_dividor_for_pickpocket_skill);
            }
            else {
                schanceproc = 10 + (pickpocketbonuscount / no_leg_dividor_for_pickpocket_skill);
            };
        }
        else if(rx_isleg()) {
            schanceproc = 10 + 100 - schance + (pickpocketbonuscount / leg_dividor_for_pickpocket_skill);
        }
        else {
            schanceproc = 10 + 100 - schance + (pickpocketbonuscount / no_leg_dividor_for_pickpocket_skill);
        };
    }
    else {
        schanceproc = 100;
    };

    schanceproc += rx_thiefring * 10;
    if(strcmp("SNEAK", getwalkmodestring(hero))) {
        schanceproc += 10;
    };
    if(npc_gettalentskill(hero, npc_talent_sneak) > 0) {
        schanceproc += 5;
    };
    if(npc_isinstate(target, zs_sleep) || npc_isinstate(target, zs_magicsleep) || npc_isinstate(target, zs_unconscious)) {
        var int sleep_chance_addition;

        if (Menu_ReadInt("PUNCLEVUTILS", "PickpocketSleepChanceAddition") == 0) {
            sleep_chance_addition = 10;
        } 
        else {
            sleep_chance_addition = Menu_ReadInt("PUNCLEVUTILS", "PickpocketSleepChanceAddition");
        };

        schanceproc += sleep_chance_addition;
    };
    if(wld_istime(22, 0, 4, 0)) {
        schanceproc += 5;
    };
    if(rx_npchasoverlay(target, "Humans_Drunken.MDS") || rx_npchasoverlay(target, "Humans_DrunkenExt.MDS")) {
        schanceproc = 100;
    };
    if(schanceproc > 100) {
        schanceproc = 100;
    };
    if(schanceproc < 0) {
        schanceproc = 0;
    };
    return schanceproc;
};
