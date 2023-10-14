func int is_prayday_now() {
    if ((prayday != wld_getday()) || (Menu_ReadInt("PUNCLEVUTILS", "InfinitePrayers") != 0)) {
        return true;
    };
};

func int is_prayday_beliar_now() {
    if ((prayidolday != wld_getday()) || (Menu_ReadInt("PUNCLEVUTILS", "InfinitePrayers") != 0)) {
        return true;
    };
};

func void use_itmi_innosstatue() {
    var int karma_per_prayer;
    karma_per_prayer = Menu_ReadInt("PUNCLEVUTILS", "ExtraInnosKarmaPerPrayer");
    if(karma_per_prayer == 0) {
        karma_per_prayer = 1;
    };

    var c_npc her;

    her = hlp_getnpc(pc_hero);
    if(hlp_getinstanceid(self) == hlp_getinstanceid(her)) {
        if((hero.guild != gil_kdm) && (!rx_isdarkwarrior())) {
            if(is_prayday_now() == true) {
                b_say(self, self, "$HELLO_INNOS");
                if((hero.guild == gil_kdf) || (hero.guild == gil_pal)) {
                    rx_restoremana(10000);
                    b_giveplayerxp(50);
                    rx_innos(karma_per_prayer + 1);
                }
                else if(hero.guild == gil_nov) {
                    b_giveplayerxp(25);
                };
                rx_innos(karma_per_prayer);
                rankpoints = rankpoints + 1;
                prayday = wld_getday();
                ai_print(print_blessnone);
            }
            else {
                ai_print(print_enoughtpray);
            };
        }
        else {
            ai_print(print_blessnonekdm);
        };
    };
};

func void pc_prayshrine_pray_info() {
    var int karma_per_prayer;
    karma_per_prayer = Menu_ReadInt("PUNCLEVUTILS", "ExtraInnosKarmaPerPrayer");
    if(karma_per_prayer == 0) {
        karma_per_prayer = 1;
    };

    if(shrineisobsessed == true) {
        sc_isobsessed = true;
        ai_print(print_scisobsessed);
        snd_play("DEM_Die");
    }
    else if((hero.guild == gil_kdm) || rx_isdarkwarrior()) {
        ai_print(print_blessnonekdm);
    }
    else if(is_prayday_now() == true) {
        rx_playeffect("spellFX_Innoseye", hero);
        if((hero.guild == gil_kdf) || (hero.guild == gil_pal)) {
            rx_restoremana(10000);
            b_giveplayerxp(50);
            rx_innos(karma_per_prayer + 1);
        }
        else if(hero.guild == gil_nov) {
            b_giveplayerxp(25);
        };
        rx_innos(karma_per_prayer);
        rankpoints = rankpoints + 1;
        prayday = wld_getday();
        ai_print(print_blessnone);
    }
    else {
        ai_print(print_enoughtpray);
    };
};

func void pc_idolmobile_do_info() {
    var int karma_per_prayer;
    karma_per_prayer = Menu_ReadInt("PUNCLEVUTILS", "ExtraBeliarKarmaPerPrayer");

    if(karma_per_prayer == 0) {
        karma_per_prayer = 1;
    };

    if((hero.guild != gil_pal) && (hero.guild != gil_kdf)) {
        if(is_prayday_beliar_now() == true) {
            if((rx_necrosummonkarmamanatimes < 50) && (hero.guild == gil_kdm) && rx_isnecrosummoner()) {
                rx_playeffect("SPELLFX_BELIARSHRINE", hero);
                snd_play("DEM_RITUAL_02");
                b_raiseattribute_bonus(hero, atr_mana_max, 1);
                rx_necrosummonkarmamanatimes += 1;
            };
            if((hero.guild == gil_kdm) || rx_isdarkwarrior()) {
                rx_restoremana(10000);
                b_giveplayerxp(50);
                rx_beliar(karma_per_prayer + 1);
            }
            else if(hero.guild == gil_ndm) {
                b_giveplayerxp(25);
            };
            rx_beliar(karma_per_prayer);
            rankpoints = rankpoints + 1;
            prayidolday = wld_getday();
            ai_print(print_beliarprayok);
        }
        else {
            ai_print(print_enoughtpray);
        };
    }
    else {
        ai_print(print_blessbeliarpraypalkdf);
    };
};

func void pc_prayidol_prayidol_info() {
    var int karma_per_prayer;
    karma_per_prayer = Menu_ReadInt("PUNCLEVUTILS", "ExtraBeliarKarmaPerPrayer");

    if(karma_per_prayer == 0) {
        karma_per_prayer = 1;
    };


    if((hero.guild != gil_pal) && (hero.guild != gil_kdf)) {
        if(is_prayday_beliar_now() == true) {
            rx_playeffect("SPELLFX_BELIARSHRINE", hero);
            snd_play("DEM_RITUAL_01");
            if((rx_necrosummonkarmamanatimes < 50) && (hero.guild == gil_kdm) && rx_isnecrosummoner()) {
                if(rx_necrosummonkarmamanatimes == 49) {
                    b_raiseattribute_bonus(hero, atr_mana_max, 1);
                    rx_necrosummonkarmamanatimes += 1;
                }
                else {
                    b_raiseattribute_bonus(hero, atr_mana_max, 2);
                    rx_necrosummonkarmamanatimes += 2;
                };
            };
            if((hero.guild == gil_kdm) || rx_isdarkwarrior()) {
                rx_restoremanapercent(100);
                b_giveplayerxp(50);
                rx_beliar(karma_per_prayer + 1);
            }
            else if(hero.guild == gil_ndm) {
                b_giveplayerxp(25);
            };
            rx_beliar(karma_per_prayer);
            rankpoints = rankpoints + 1;
            prayidolday = wld_getday();
            ai_print(print_beliarprayok);
        }
        else {
            ai_print(print_enoughtpray);
        };
    }
    else {
        ai_print(print_blessbeliarpraypalkdf);
    };
};
