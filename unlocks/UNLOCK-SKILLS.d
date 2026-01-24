func int rx_isrealmage() {
    return npc_gettalentskill(other, npc_talent_mage) >= 1 || rx_isrealmage_old();
};

func int rx_heroismage() 
{
    return npc_gettalentskill(other, npc_talent_mage) >= 1 || rx_heroismage_old();
};

func int pc_psionicquest_templatedialog_546_condition() {
    return pc_psionicquest_templatedialog_546_condition_old() || rx_isrealmage();
};

func int dia_baalnamib_preteach_condition() {
    return dia_baalnamib_preteach_condition_old() || rx_isrealmage();
};

func int pc_psionicquest_templatedialog_394_condition() {
    if((!rx_skill_dot1) || (!rx_skill_dot2) || (!rx_skill_dotplus1) || (!rx_skill_dotnewdamage) || (!rx_skill_dotrepeat)) {
        return pc_psionicquest_templatedialog_394_condition_old() || rx_isrealmage();
    };
};

func int pc_psionicquest_templatedialog_888_condition() {
    return pc_psionicquest_templatedialog_888_condition_old() || rx_isrealmage();
};

func int dia_xardas_preteach_condition() {
    return dia_xardas_preteach_condition_old() || rx_isrealmage();
};

func int dia_parlan_teach_condition() {
    return dia_parlan_teach_condition_old() || rx_isrealmage();
};

func int dia_baaltyon_teach_condition() {
    return dia_baaltyon_teach_condition_old() || rx_isrealmage();
};

func int dia_baalnamib_runen_condition() {
    return dia_baalnamib_runen_condition_old() || rx_isrealmage();
};

func int dia_baaltyon_trade_condition() {
    return dia_baaltyon_trade_condition_old() ||  rx_isrealmage();
};

func int pc_psionicquest_templatedialog_453_condition() {
    return pc_psionicquest_templatedialog_453_condition_old() || rx_isrealmage();
};

func int dia_xardas_preteach_condition() {
    return dia_xardas_preteach_condition_old() || rx_isrealmage();
};

func int dia_xardas_sactanome_condition() {
    return dia_xardas_sactanome_condition_old() || rx_isrealmage();
};
func int dia_xardas_runen_condition() {
    return dia_xardas_runen_condition_old() || rx_isrealmage();
};

func int dia_xardas_ndm_teachdemonolog_condition() {
    if((xardasteachcastdemon_simple == false) || (xardasteachcastdemon_lord == false) && (!rx_isshaman())) {
        return true;
    };
};

func int dia_hyglas_firebolt_condition() {
    return dia_hyglas_firebolt_condition_old() || rx_isrealmage();
};

func int dia_hyglas_talent_firebolt_condition() {
    dia_hyglas_talent_firebolt_condition_old();
    if((player_talent_runes[19] == false) && (npc_hasitems(other, itmi_runeblank) >= 1) && (npc_hasitems(other, itsc_firebolt) >= 1) && (npc_hasitems(other, itmi_sulfur) >= 1)) {
        return dia_hyglas_talent_firebolt_condition_old() || rx_isrealmage();
    };
};

func int dia_addon_nefarius_preteach_condition() {
    return dia_addon_nefarius_preteach_condition_old() || rx_isrealmage();
};

func void dia_xardas_runen_info() {
    if((npc_gettalentskill(other, npc_talent_demonolog) == 1) && (player_talent_runes[40] == false)) {
        info_addchoice(dia_xardas_runen, "Руна демонолога", dia_xardas_runen_dem);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 6) {
        info_addchoice(dia_xardas_runen, "6 Круг Магии", dia_xardas_runen_6);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 5) {
        info_addchoice(dia_xardas_runen, "5 Круг Магии", dia_xardas_runen_5);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 4) {
        info_addchoice(dia_xardas_runen, "4 Круг Магии", dia_xardas_runen_4);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 3) {
        info_addchoice(dia_xardas_runen, "3 Круг Магии", dia_xardas_runen_3);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 2) {
        info_addchoice(dia_xardas_runen, "2 Круг Магии", dia_xardas_runen_2);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 1) {
        info_addchoice(dia_xardas_runen, "1 Круг Магии", dia_xardas_runen_1);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 6) {
        info_addchoice(dia_xardas_runen, "6 Круг Магии Призывателя", dia_xardas_runen_6_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 5) {
        info_addchoice(dia_xardas_runen, "5 Круг Магии Призывателя", dia_xardas_runen_5_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 4) {
        info_addchoice(dia_xardas_runen, "4 Круг Магии Призывателя", dia_xardas_runen_4_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 3) {
        info_addchoice(dia_xardas_runen, "3 Круг Магии Призывателя", dia_xardas_runen_3_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 2) {
        info_addchoice(dia_xardas_runen, "2 Круг Магии Призывателя", dia_xardas_runen_2_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 1) {
        info_addchoice(dia_xardas_runen, "1 Круг Магии Призывателя", dia_xardas_runen_1_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 6) {
        info_addchoice(dia_xardas_runen, "6 Круг Магии Темного Мага", dia_xardas_runen_6_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 5) {
        info_addchoice(dia_xardas_runen, "5 Круг Магии Темного Мага", dia_xardas_runen_5_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 4) {
        info_addchoice(dia_xardas_runen, "4 Круг Магии Темного Мага", dia_xardas_runen_4_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 3) {
        info_addchoice(dia_xardas_runen, "3 Круг Магии Темного Мага", dia_xardas_runen_3_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 2) {
        info_addchoice(dia_xardas_runen, "2 Круг Магии Темного Мага", dia_xardas_runen_2_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 1) {
        info_addchoice(dia_xardas_runen, "1 Круг Магии Темного Мага", dia_xardas_runen_1_dm);
    };
};

func int dia_kreol_runen_condition() {
    return rx_isrealmage();
};


func int pc_psionicquest_templatedialog_299_condition() {
    if(talentcount_alchemy >= 90 || pc_psionicquest_templatedialog_299_condition_old()) {
        return true;
    };
};

func int pc_psionicquest_templatedialog_300_condition() {
    if(pc_psionicquest_templatedialog_300_condition_old() || talentcount_smith >= 100) {
        return true;
    };
};

func int rx_canusedarkrunes_test() {
    return rx_canusedarkrunes_test_old() || rx_isrealmage();
};

func void dia_kreol_runen_info() {
    ai_output(other, self, "DIA_Parlan_TEACH_15_00");
    info_clearchoices(dia_kreol_runen);
    info_addchoice(dia_kreol_runen, dialog_back, dia_kreol_runen_back);

    if((npc_gettalentskill(other, npc_talent_demonolog) == 1) && (player_talent_runes[40] == false) && (hero.guild == gil_kdm)) {
        info_addchoice(dia_kreol_runen, "Руна демонолога", dia_kreol_runen_dem);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 6) {
        info_addchoice(dia_kreol_runen, "6 Круг Магии", dia_kreol_runen_6);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 5) {
        info_addchoice(dia_kreol_runen, "5 Круг Магии", dia_kreol_runen_5);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 4) {
        info_addchoice(dia_kreol_runen, "4 Круг Магии", dia_kreol_runen_4);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 3) {
        info_addchoice(dia_kreol_runen, "3 Круг Магии", dia_kreol_runen_3);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 2) {
        info_addchoice(dia_kreol_runen, "2 Круг Магии", dia_kreol_runen_2);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 1) {
        info_addchoice(dia_kreol_runen, "1 Круг Магии", dia_kreol_runen_1);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 6) {
        info_addchoice(dia_kreol_runen, "6 Круг Магии Призывателя", dia_kreol_runen_6_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 5) {
        info_addchoice(dia_kreol_runen, "5 Круг Магии Призывателя", dia_kreol_runen_5_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 4) {
        info_addchoice(dia_kreol_runen, "4 Круг Магии Призывателя", dia_kreol_runen_4_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 3) {
        info_addchoice(dia_kreol_runen, "3 Круг Магии Призывателя", dia_kreol_runen_3_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 2) {
        info_addchoice(dia_kreol_runen, "2 Круг Магии Призывателя", dia_kreol_runen_2_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 1) {
        info_addchoice(dia_kreol_runen, "1 Круг Магии Призывателя", dia_kreol_runen_1_sum);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 6) {
        info_addchoice(dia_kreol_runen, "6 Круг Магии Темного Мага", dia_kreol_runen_6_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 5) {
        info_addchoice(dia_kreol_runen, "5 Круг Магии Темного Мага", dia_kreol_runen_5_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 4) {
        info_addchoice(dia_kreol_runen, "4 Круг Магии Темного Мага", dia_kreol_runen_4_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 3) {
        info_addchoice(dia_kreol_runen, "3 Круг Магии Темного Мага", dia_kreol_runen_3_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 2) {
        info_addchoice(dia_kreol_runen, "2 Круг Магии Темного Мага", dia_kreol_runen_2_dm);
    };
    if(npc_gettalentskill(other, npc_talent_mage) >= 1) {
        info_addchoice(dia_kreol_runen, "1 Круг Магии Темного Мага", dia_kreol_runen_1_dm);
    };
};

func int dia_addon_nefarius_adw_runen_condition() {
    return dia_addon_nefarius_adw_runen_condition_old() || rx_isrealmage();
};

func int dia_xardas_trade_condition() {
    return rx_isrealmage() || dia_xardas_trade_condition_old();
};

func int dia_kreol_trade_condition() {
    return rx_isrealmage() || dia_kreol_trade_condition_old();
};

var int last_cost_original;


func int b_getlearncosttalent(var c_npc oth, var int talent, var int skill) {
    var int kosten_override;
    kosten_override = Menu_ReadInt("PUNCLEVUTILS_MAGE_SKILLS", "NoLpRunes");
    if(talent == npc_talent_runes && kosten_override > 0) {
        last_cost_original = b_getlearncosttalent_old(oth, talent, skill);
        return 0;
    };
    return b_getlearncosttalent_old(oth, talent, skill);
};

func int b_getmoneytalent(var int talent, var int kosten) {
    var int kosten_override;
    kosten_override = Menu_ReadInt("PUNCLEVUTILS_MAGE_SKILLS", "NoLpRunes");
    if(talent == npc_talent_runes && kosten_override > 0) {
        return  b_getmoneytalent_old(talent, last_cost_original);
    };

    return b_getmoneytalent_old(talent, kosten);
};

func int rx_isdarkmage()
{
    return rx_isrealmage() || rx_isdarkmage_old();
};

func int rx_isdarkmagedialog() 
{
    return rx_isdarkmage() || rx_isdarkmagedialog_old();
};

func int rx_canusedarkrunes_test() 
{
    return rx_canusedarkrunes_test_old() || TRUE;
};
