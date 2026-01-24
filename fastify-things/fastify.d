func void pc_psionicquest_templatedialog_311_info() 
{
    var int current_blessing;
    current_blessing = rx_isgarothmana;
    pc_psionicquest_templatedialog_311_info_old();
    rx_isgarothmana += current_blessing;
};

func void dia_isgaroth_segen_info() {
    var int current_blessing;
    current_blessing = rx_isgarothregensta;
    dia_isgaroth_segen_info_old();
    rx_isgarothregensta += current_blessing;
};

func void dia_pyrokar_perm_info() {
    var int current_blessing;
    current_blessing = rx_isgarothregen;
    dia_pyrokar_perm_info_old();
    rx_isgarothregen += current_blessing;
};

func void use_schildkroetesoup_sborka() {
    use_schildkroetesoup_sborka_old();
    if(self.id == 0) {
        var int amount;
        amount = npc_hasitems(self, ITFO_SCHILDKROETESOUP_SBORKA);
        if (amount > 0) {
        b_raiseattribute(self, atr_hitpoints_max, amount);
        rx_sethunger(5 * amount);
        npc_removeinvitems(self, ITFO_SCHILDKROETESOUP_SBORKA, amount);
        };
    };
};

func void use_coragonsbeerbeer() {
    use_coragonsbeerbeer_old();

    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_coragonsbeer);
        if (amount > 0) {
        b_raiseattribute_bonus(self, atr_mana_max, 2 * amount);
        b_raiseattribute_bonus(self, atr_hitpoints_max, 5 * amount);
        npc_changeattribute(self, atr_mana, 2 * amount);
        npc_changeattribute(self, atr_hitpoints, 5 * amount);
        rx_setfoodhealthregen(30 * amount);
        rx_restorestaminapercent(10 * amount);
        rx_setthirst(3 * amount);
        npc_removeinvitems(self, itfo_coragonsbeer, amount);
        };
    };
};


func void use_smellyfish() {
    use_smellyfish_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_smellyfish);
        if (amount > 0) {
        
        b_raiseattribute(self, atr_hitpoints_max, 1 * amount);
        npc_changeattribute(self, atr_hitpoints, 10 * amount);
        rx_healthbonusteach += 1  * amount;
        rx_sethunger(3 * amount);

        npc_removeinvitems(self, itfo_smellyfish, amount);
        };
    };
};

func void useitpo_perm_health_liker() {
    useitpo_perm_health_liker_old();
    if(self.id == 0) {
        var int amount;
        amount = npc_hasitems(self, itpo_health_liker);
        if (amount > 0) {
        
        b_raiseattribute(self, atr_hitpoints_max, 3 * amount);
        npc_changeattribute(self, atr_hitpoints, 3 * amount);
        rx_setfoodhealthregen(60 * amount);
        rx_healthbonusteach += 3 * amount;
        b_raiseattribute_bonus(self, atr_mana_max, 1 * amount);
        npc_changeattribute(self, atr_mana, 1 * amount);
        rx_sethunger(5 * amount);
        rx_setthirst(2 * amount);

        npc_removeinvitems(self, itpo_health_liker, amount);
        };
    };
};

func void use_pottage_mushroom_black() {
    use_pottage_mushroom_black_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_pottage_mushroom_black);
        if (amount > 0) {
        
        npc_changeattribute(self, atr_hitpoints, 50 * amount);
        npc_changeattribute(self, atr_mana, 15 * amount);
        b_raiseattribute_bonus(self, atr_mana_max, 1 * amount);
        rx_useitfo_pottage_mushroom_black += 1 * amount;
        rx_sethunger(4 * amount);
        rx_setfoodhealthregen(60 * amount);

        npc_removeinvitems(self, itfo_pottage_mushroom_black, amount);
        };
    };
};

func void use_compote_00() {
    use_compote_00_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_compote_00);
        if (amount > 0) {
        
        b_raiseattribute(self, atr_hitpoints_max, 10 * amount);
        rx_healthbonusteach += 10 * amount;
        npc_changeattribute(self, atr_hitpoints, 60 * amount);
        rx_setthirst(3 * amount);
        rx_sethunger(3 * amount);
        rx_usedcompote0 += 1 * amount;

        npc_removeinvitems(self, itfo_compote_00, amount);
        };
    };
};

func void use_compote_01() {
    use_compote_01_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_compote_01);
        if (amount > 0) {
        
        b_raiseattribute(self, atr_hitpoints_max, 10 * amount);
        rx_healthbonusteach += 10 * amount;
        npc_changeattribute(self, atr_hitpoints, 60 * amount);
        rx_setthirst(3 * amount);
        rx_sethunger(3 * amount);
        rx_usedcompote0 += 1 * amount;

        npc_removeinvitems(self, itfo_compote_01, amount);
        };
    };
};

func void use_pottage_mushroom() {
    use_pottage_mushroom_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_pottage_mushroom);
        if (amount > 0) {
        
        npc_changeattribute(self, atr_hitpoints, 100 * amount);
        npc_changeattribute(self, atr_mana, 20 * amount);
        self.protection[5] += 2 * amount;
        realprotmagic += 2 * amount;
        rx_sethunger(4 * amount);
        rx_useitfo_pottage_mushroom += 1 * amount;
        rx_setfoodhealthregen(60 * amount);

        npc_removeinvitems(self, itfo_pottage_mushroom, amount);
        };
    };
};

func void use_itfo_cake_apple() {
    use_itfo_cake_apple_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_cake_apple);
        if (amount > 0) {
        
        rx_setfoodhealthregen(120 * amount);
        rx_pieapple += 1 * amount;
        rx_usedapplepie += 1 * amount;
        b_raiseattribute(self, atr_hitpoints_max, 10 * amount);
        npc_changeattribute(self, atr_hitpoints, 10 * amount);
        rx_healthbonusteach += 10 * amount;
        rx_restorestaminapercent(20 * amount);
        rx_sethunger(4 * amount);

        npc_removeinvitems(self, itfo_cake_apple, amount);
        };
    };
};

func void use_itfo_cake_mushroom() {
    use_itfo_cake_mushroom_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_cake_mushroom);
        if (amount > 0) {
        
        rx_setfoodhealthregen(120 * amount);
        rx_piemushroom += 1 * amount;
        rx_usedmushpie += 1 * amount;
        b_raiseattribute_bonus(self, atr_mana_max, 2 * amount);
        npc_changeattribute(self, atr_mana, 2 * amount);
        rx_restorestaminapercent(10 * amount);
        rx_sethunger(3 * amount);

        npc_removeinvitems(self, itfo_cake_mushroom, amount);
        };
    };
};


func void use_itfo_cake_fish() {
    use_itfo_cake_fish_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_cake_fish);
        if (amount > 0) {
        
        rx_piefish += 1 * amount;
        rx_setfoodhealthregen(120 * amount);
        rx_usedfishpie += 1 * amount;
        b_raiseattribute_bonus(self, atr_dexterity, 1 * amount);
        rx_restorestaminapercent(10 * amount);
        rx_sethunger(4 * amount);

        npc_removeinvitems(self, itfo_cake_fish, amount);
        };
    };
};

func void use_itfo_cake_honey() {
    use_itfo_cake_honey_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_cake_honey);
        if (amount > 0) {
        
        rx_setfoodhealthregen(120 * amount);
        rx_piehoney += 1 * amount;
        rx_usedhoneypie += 1 * amount;
        rx_changeint(2 * amount);
        rx_restorestaminapercent(15 * amount);
        rx_sethunger(2 * amount);

        npc_removeinvitems(self, itfo_cake_honey, amount);
        };
    };
};


func void use_itfo_cake_meat() {
    use_itfo_cake_meat_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_cake_meat);
        if (amount > 0) {
        
        rx_piemeat += 1 * amount;
        rx_setfoodhealthregen(120 * amount);
        rx_usedmeatpie += 1 * amount;
        b_raiseattribute_bonus(self, atr_strength, 1 * amount);
        rx_restorestaminapercent(20 * amount);
        rx_sethunger(4 * amount);

        npc_removeinvitems(self, itfo_cake_meat, amount);
        };
    };

};


func void use_itfo_ealbalzamtwo() {
    use_itfo_ealbalzamtwo_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_ealbalzamtwo);
        if (amount > 0) {
        
        b_raiseattribute(self, atr_hitpoints_max, 12 * amount);
        npc_changeattribute(self, atr_hitpoints, 12 * amount);
        rx_healthbonusteach += 12 * amount;
        rx_restorestaminapercent(50 * amount);
        rx_setthirst(4 * amount);
        rx_useitfo_ealbalzamtwo += 1 * amount;
        b_drunk();

        npc_removeinvitems(self, itfo_ealbalzamtwo, amount);
        };
    };
};

func void use_itfo_ealbalzam() {
    var int staminamax;
    var int manares;
    use_itfo_ealbalzam_old();
    if(npc_isplayer(self)) {
        var int amount;
        amount = npc_hasitems(self, itfo_ealbalzam);
        if (amount > 0) {
        
        b_raiseattribute_bonus(self, atr_mana_max, 3 * amount);
        manares = amount * self.attribute[3] * 20 / 100 ;
        npc_changeattribute(self, atr_mana, manares);
        if(self.attribute[2] > self.attribute[3]) {
            self.attribute[2] = self.attribute[3];
        };
        rx_setthirst(2 * amount);
        rx_useitfo_ealbalzam += 1 * amount;
        b_drunk();

        npc_removeinvitems(self, itfo_ealbalzam, amount);
        };
    };
};
