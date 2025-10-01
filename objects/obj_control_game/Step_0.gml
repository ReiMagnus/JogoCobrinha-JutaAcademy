
if(keyboard_check_released(vk_space)) {
    if(!global.jogo) {
        global.jogo = true;
    } else {
        global.jogo = false;
        room_restart();
    }
}
if(keyboard_check_released(ord("1"))) {
    global.modo_jogo = !global.modo_jogo;
    room_restart();
}
if(keyboard_check_released(ord("2"))) {global.crescer = !global.crescer;}
    
if(keyboard_check_released(ord("3"))) {global.modelo_ia = 0; room_restart();}
if(keyboard_check_released(ord("4"))) {global.modelo_ia = 1; room_restart();}
if(keyboard_check_released(ord("5"))) {global.modelo_ia = 2; room_restart();}
if(keyboard_check_released(ord("6"))) {global.modelo_ia = 3; room_restart();}