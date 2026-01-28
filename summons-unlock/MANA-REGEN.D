instance dia_mana_regen_punclev(c_info) {
    npc = none_100_xardas;
    nr = 2;
    condition = dia_mana_regen_punclev_condition;
    information = dia_mana_regen_punclev_info;
    permanent = true;
    important = false;
    description = b_buildlearnstringformanaregen();
};

func int dia_mana_regen_punclev_condition() {
    return !vatras_teachregenmana;
};

func void dia_mana_regen_punclev_info() {
   rx_teachregenmana();
};