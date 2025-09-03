if(jogo) {

    moveTick--;
    
    // 
    var _up    = keyboard_check(vk_up);
    var _right = keyboard_check(vk_right);
    var _down  = keyboard_check(vk_down);
    var _left  = keyboard_check(vk_left);
    
    // Definindo a direção da cobrinha
    if(_up and dir != 2)    {dirTemp = 0;} else
    if(_right and dir != 3) {dirTemp = 1;} else 
    if(_down and dir != 0)  {dirTemp = 2;} else 
    if(_left and dir != 1)  {dirTemp = 3;} 
    
    if(moveTick <= 0) {
        
        // Definindo a direção do passo
        dir = dirTemp;
        image_index = dir;
        
        var _xCorpo = x; // Posição onde o corpo será criado
        var _yCorpo = y;
        
        var _xPos = 0; // Posição onde a cabeça vai andar
        var _yPos = 0;
        switch (dir) {
        	case 0: _yPos -= GRID_TAM; break;
            case 1: _xPos += GRID_TAM; break;
            case 2: _yPos += GRID_TAM; break;
            case 3: _xPos -= GRID_TAM; break;
        }
        
        // Colisões
        if(place_meeting(x+_xPos, y+_yPos, [obj_body, obj_parede])) {
            jogo = false;
            return;
        }
        
        // Cabeça dando um passo
        x += _xPos;
        y += _yPos;
        
        // Criando um novo corpo após um passo
        var _inst = instance_create_layer(_xCorpo, _yCorpo, "Instances", obj_body);
        _inst.numCorpo = tamCorpo;
        
        // Comendo a comida
        var _comida = instance_place(x, y, obj_comida);
        if(_comida) {
            instance_destroy(_comida);
            tamCorpo++;
            
            with(obj_body) {
                numCorpo++;
            }
            
            if( tamCorpo != ((display_get_gui_width()/GRID_TAM) * (display_get_gui_height()/GRID_TAM)) ) {
                criar_comida();
                
            } else {
                jogo = false;
                show_debug_message("GANHOU A FASE!!");
            }
            
        }
        
        // Atualizando todos corpo
        with(obj_body) {
        	andar_corpo();
        }
        
        moveTick = spd * GAME_SPEED;
        global.grid_map = att_grid_map();
        
    }
    
}