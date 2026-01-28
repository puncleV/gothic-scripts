func int spell_logic_summon_skeleton_uniq(var int manainvested) {
    if(npc_isplayer(self) && rx_isshaman()) {
        ai_print("Шаманы не могут использовать магию призыва!");
        return spl_sendstop;
    };
    if(skeletonuniqisup) {
        ai_print("Скелет-служитель уже вызван...");
        return spl_sendstop;
    };
    if((rx_summoncount + 2) > getsummoncountmax()) {
        if(rx_newmes) {
            ai_printiteminfo("Информация", "Макс. кол-во призывных существ...", 1, 1);
        }
        else {
            ai_print("Достигнуто максимальное кол-во призывных существ...");
        };
        return spl_sendstop;
    };
    if(self.attribute[2] >= spl_cost_summon_skeleton_uniq) {
        return spl_sendcast;
    }
    else {
        return spl_sendstop;
    };
    return spl_sendstop;
};

func int spell_logic_summoncrait(var int manainvested) {
    if(rx_checkandshowarenapet()) {
        return spl_sendstop;
    };
    if(rx_crchanged || rx_use_itpo_mud) {
        ai_print("Я уже отдал Крайта!");
        return spl_sendstop;
    };
    if(npc_isplayer(self) && rx_isshaman()) {
        ai_print("Шаманы не могут использовать магию призыва!");
        return spl_sendstop;
    };
    if(playerknowsorclanguage == false) {
        b_say(self, self, "$CANTREADTHIS");
        return spl_sendstop;
    };
    if((rx_summoncount + 1) > getsummoncountmax()) {
        if(rx_newmes) {
            ai_printiteminfo("Информация", "Достигнуто максимальное кол-во призывных существ...", 1, 1);
        }
        else {
            ai_print("Достигнуто максимальное кол-во призывных существ...");
        };
        return spl_sendstop;
    };
    if(craitisup) {
        ai_print("Крайт уже призван!");
        return spl_sendstop;
    };
    if(jinawolfisup) {
        ai_print("Сначала надо отозвать Джину!");
        return spl_sendstop;
    };
    if(skeletonuniqisup) {
        ai_print("Сначала надо отозвать Сида!");
        return spl_sendstop;
    };
    if(npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_trfrune)) {
        return spl_sendcast;
    }
    else if(self.attribute[2] >= spl_cost_trfrune) {
        return spl_sendcast;
    };
    return spl_sendstop;
};

instance itru_sumdemonhub(c_item) {
    name = name_rune;
    mainflag = item_kat_rune;
    flags = item_mission;
    value = 10;
    visual = "ItAr_Rune_14.3DS";
    material = mat_stone;
    spell = spl_sumkhub;
    mag_circle = 1;
    wear = wear_effect;
    description = name_spl_summondemon;
    text = name_mag_circle;
    count = mag_circle;
    text[1] = name_manakosten;
    count[1] = spl_cost_sumkhub;
    text[4] = "Призыв Хубаскиса";
    inv_animate = 1;
};


func int spell_logic_sumkhub(var int manainvested) {
    if(sactanomeprogress == true) {
        sactanomeprogress = false;
    };
    if(rx_demonhub_active) {
        ai_print("Хубаскис уже призван!");
        return spl_sendstop;
    };
    if(npc_isplayer(self) && rx_isshaman()) {
        ai_print("Шаманы не могут использовать магию призыва!");
        return spl_sendstop;
    };
    if((!rx_demonhub_learned)) {
        ai_print("Я не знаю как это использовать!");
        return spl_sendstop;
    };
    if((rx_summoncount + 1) > getsummoncountmax()) {
        if (rx_newmes) {
            ai_printiteminfo("Информация", "Макс. кол-во призывных существ...", 1, 1);
        }
        else {
            ai_print("Достигнуто максимальное кол-во призывных существ...");
        };
        return spl_sendstop;
    };
    if(npc_getactivespellisscroll(self) && (self.attribute[2] >= spl_cost_scroll4)) {
        return spl_sendcast;
    }
    else if(self.attribute[2] >= spl_cost_sumkhub) {
        return spl_sendcast;
    }
    else if(npc_isplayer(self) && (xardas_knowssactanome == true) && (sactanomeprogress == false)) {
        sactanomeprogress = true;
        return spl_sendcast;
    }
    else {
        return spl_sendstop;
    };
    return spl_sendstop;
};
var int rx_sid_learned_punclev;




func int dia_summons_extra_condition() {
    return !rx_demonhub_learned || !rx_sid_learned_punclev;
};


func void dia_summons_extra_info() {
    info_clearchoices(dia_khubaskis_extra);

    info_addchoice(dia_khubaskis_extra, dialog_back, dia_khubaskis_extra_back);

    if (!rx_demonhub_learned){
        info_addchoice(dia_khubaskis_extra, "Изучить личного демона-слугу (20 очков обучения если не АСНК, 3500 золота)", dia_khubaskis_extra_info);
    };

    if (!rx_sid_learned_punclev){
        info_addchoice(dia_khubaskis_extra, "Сид (10 очков обучения если не АСНК, 1000 золота)", dia_sid_extra_info);
    };
};

func void dia_khubaskis_extra_back() {
    info_clearchoices(dia_khubaskis_extra);
};


instance dia_khubaskis_extra(c_info) {
    npc = none_100_xardas;
    nr = 2;
    condition = dia_summons_extra_condition;
    information = dia_summons_extra_info;
    permanent = true;
    important = false;
    description = "Изучить призывы";
};

func void dia_khubaskis_extra_info() {
    var int kosten;
    var int money;

    kosten = 20;
    money = 3500;
    
    if(hero.lp < kosten && !rx_isfullsnc()) {
        ai_print(print_notenoughlearnpoints);
        b_say(self, other, "$NOLEARNNOPOINTS");
        ai_stopprocessinfos(self);
        return;
    };
    
    if(npc_hasitems(hero, itmi_gold) < money) {
        ai_print(print_notenoughgold);
        ai_output(self, other, "DIA_Xardas_TeachSactaNome_01_08");
        ai_stopprocessinfos(self);
        return;
    };

    if(!rx_isfullsnc()) {
        hero.lp = hero.lp - kosten;
    };
    rankpoints = rankpoints + kosten;
    npc_removeinvitems(hero, itmi_gold, money);

    rx_learnprivatedemon();
};


func void dia_sid_extra_info() {
    var int kosten;
    var int money;

    kosten = 10;
    money = 1000;

    if(hero.lp < kosten && !rx_isfullsnc()) {
        ai_print(print_notenoughlearnpoints);
        b_say(self, other, "$NOLEARNNOPOINTS");
        ai_stopprocessinfos(self);
        return;
    };
    if(npc_hasitems(hero, itmi_gold) < money) {
        ai_print(print_notenoughgold);
        ai_output(self, other, "DIA_Xardas_TeachSactaNome_01_08");
        ai_stopprocessinfos(self);
        return;
    };

    if(!rx_isfullsnc()) {
        hero.lp = hero.lp - kosten;
    };

    rankpoints = rankpoints + kosten;

    npc_removeinvitems(hero, itmi_gold, money);
    rx_sid_learned_punclev = true;

    snd_play("LevelUP");
    ai_output(self, other, "DIA_Xardas_NecroSkeletonCreated_01");
    ai_output(self, other, "DIA_Xardas_NecroSkeletonCreated_02");
    ai_output(self, other, "DIA_Xardas_NecroSkeletonCreated_03");
    ai_output(other, self, "DIA_Xardas_NecroSkeletonCreated_04");
    b_giveinvitems(self, other, itru_sumskeluniq, 1);
    rx_callbackdialog(self, 0.1, rx_callback_xardascreateskeleton);
    b_giveplayerxp(500);
    ai_stopprocessinfos(self);
};

func int dia_orc_8549_tradeorc_tradecrait_condition() {
    if (rx_isshaman() || rx_isvampire()) {
        return false;
    };
    return (((kapitel >= 2) && (orcrespect >= 100)) && (!rx_craitboughtonce)) && playerknowsorclanguage;
};

func void b_giveplayerxp(var int add_xp) {
    b_giveplayerxp_old(add_xp);
    var int set_player_exp_for_summons;
    var int xp_percent;
    var int xp_percent_huba;
    var int xp_percent_sid;
    var int xp_percent_crait;
    var int xp_percent_jina;
    var int percent_from_stats;
    var int use_intellect;
    var int intellect_factor;

    set_player_exp_for_summons = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "ExpAsPlayer");
    xp_percent_huba = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "ExpPercentHuba");
    xp_percent_sid = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "ExpPercentSid");
    xp_percent_crait = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "ExpPercentCrait");
    xp_percent_jina = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "ExpPercentJina");
    use_intellect = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "UseIntellectAsBonus");
    intellect_factor = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "IntellecrFactor");
    if (set_player_exp_for_summons > 0) {
        if (xp_percent_huba == 0) {
            xp_percent_huba = 15;
            menu_writeint("PUNCLEVUTILS_SUMMONS", "ExpPercentHuba", 15);
        };
        if (xp_percent_sid == 0) {
            xp_percent_sid = 15;
            menu_writeint("PUNCLEVUTILS_SUMMONS", "ExpPercentSid", 15);
        };
        if (xp_percent_crait == 0) {
            xp_percent_crait = 15;
            menu_writeint("PUNCLEVUTILS_SUMMONS", "ExpPercentCrait", 15);
        };
        if (xp_percent_jina == 0) {
            xp_percent_jina = 15;
            menu_writeint("PUNCLEVUTILS_SUMMONS", "ExpPercentJina", 15);
        };
        if (intellect_factor == 0) {
            intellect_factor = 10;
            menu_writeint("PUNCLEVUTILS_SUMMONS", "IntellecrFactor", 10);
        };

        if (use_intellect) {
            percent_from_stats = atr_intellect / intellect_factor;
        } else {
            percent_from_stats = 0;
        };
       

        craitexplvl = hero.exp * (xp_percent_crait + percent_from_stats) / 100;
        rx_demonhub_exp = hero.exp * (xp_percent_huba + percent_from_stats) / 100;
        jinawolfexplvl = hero.exp * (xp_percent_jina + percent_from_stats) / 100;
        skeletonuniqexp = hero.exp * (xp_percent_sid + percent_from_stats) / 100;
        dsnapperexplvl = hero.exp;
    };
};


func void rx_updatekhub(var c_npc slf) {
    var int softcap_override;
    softcap_override = Menu_ReadInt("PUNCLEVUTILS_SUMMONS", "HubaSoftcapOverride");

    if (softcap_override == 0) {
        softcap_override = 75;
        menu_writeint("PUNCLEVUTILS_SUMMONS", "HubaSoftcapOverride", 75);
    };

    if (softcap_override >= 0) {
        rx_khubasoftcaplevel = softcap_override;
    };

    rx_updatekhub_old(slf);
};
