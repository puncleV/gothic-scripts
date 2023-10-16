func void use_joint() {
    var int level;
    var int random;

    var int skip_day_check;
    var int mana_bonus_amount;
    var int max_mana_bonus;
    var int skip_guild_check;

    
    skip_day_check = Menu_ReadInt("PUNCLEVUTILS", "JointBonusSkipDayCheck");
    mana_bonus_amount = Menu_ReadInt("PUNCLEVUTILS", "JointBonusManaBonusPerSmoke");
    max_mana_bonus = Menu_ReadInt("PUNCLEVUTILS", "JointBonusMaxManaBonus");
    skip_guild_check = Menu_ReadInt("PUNCLEVUTILS", "JointBonusEveryguildMode");

    if (mana_bonus_amount == 0) {
        mana_bonus_amount = 3;
    };

    if (max_mana_bonus == 0) {
        max_mana_bonus = 150;
    };

    if(npc_isplayer(self)) {
        rx_smokecount += 1;
        if(jointrest == false) {
            hero_fatigue = hero_fatigue + 2;
            if(hero_fatigue >= 10) {
                hero_fatigue = 10;
            };
            jointrest = true;
        };
        if((hero.guild == gil_tpl) && rx_checktplguild() && (!rx_arenabattlestarted)) {
            startchangeworldtime(35, 0.9);
        };
        if((hero.guild == gil_gur || skip_guild_check == 1) && (rx_totalsmokebonus < max_mana_bonus)) {
            if(mana_rationday != wld_getday() || skip_day_check == 1) {
                level = hero.level;
                random = 1;
                if(level > random) {
                    b_giveplayerxp(50);
                    rankpoints = rankpoints + mana_bonus_amount;
                    print("Received bonus from smoking joint!");
                    b_raiseattribute_bonus(self, atr_mana_max, mana_bonus_amount);
                    npc_changeattribute(self, atr_mana, mana_bonus_amount);
                    bonuscount += mana_bonus_amount;
                    rx_totalsmokebonus += mana_bonus_amount;
                    npc_setstatetime(self, 0);
                    mana_rationday = wld_getday();
                }
                else {
                    print("Cant smoke for some reason...");
                };
            }
            else {
                mana_rationday = wld_getday();
                print("I already smoked some joint today.");
            };
        };
    };
};
