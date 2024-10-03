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


func void rx_applybeliar_pray(var int ismobilestatue) {
    var int karma_per_prayer;
    karma_per_prayer = Menu_ReadInt("PUNCLEVUTILS", "ExtraBeliarKarmaPerPrayer");

    if(karma_per_prayer == 0) {
        karma_per_prayer = 1;
    };

    if((hero.guild == gil_pal) || (hero.guild == gil_kdf)) {
        ai_print(print_blessbeliarpraypalkdf);
        return;
    };
    if(is_prayday_beliar_now() != true) {
        ai_print(print_enoughtpray);
        return;
    };
    if(ismobilestatue) {
        b_say(hero, hero, "$HELLO_BELIAR");
    };
    rx_playeffect("SPELLFX_BELIARSHRINE", hero);
    snd_play("DEM_RITUAL_01");
    ai_print(print_beliarprayok);
    prayidolday = wld_getday();
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
    if(rx_isheroindarkguild()) {
        if(rx_isvampire()) {
            rx_restoremanapercent(50);
            rx_restorestaminapercent(50);
            rx_restorehealthpercent(hero, 50);
            rx_beliar(karma_per_prayer);
        }
        else {
            rx_restoremanapercent(100);
            rx_restorestaminapercent(50);
            rx_restorehealthpercent(hero, 100);
            b_giveplayerxp(50);
            rx_beliar(karma_per_prayer * 2);
        };
    }
    else {
        rx_beliar(karma_per_prayer);
    };
    rankpoints = rankpoints + 1;
};