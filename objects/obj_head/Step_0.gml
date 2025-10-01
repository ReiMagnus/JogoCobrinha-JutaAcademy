if(global.jogo) {

    moveTick--;
    
    if(!global.modelo_ia) { // ---------------------- Manual
        
        var _up    = keyboard_check(vk_up);
        var _right = keyboard_check(vk_right);
        var _down  = keyboard_check(vk_down);
        var _left  = keyboard_check(vk_left);
        
        // Definindo a direção da cobrinha
        if(_up and dir != 2)    {dirTemp = 0;} else
        if(_right and dir != 3) {dirTemp = 1;} else 
        if(_down and dir != 0)  {dirTemp = 2;} else 
        if(_left and dir != 1)  {dirTemp = 3;} 
    } else { // ------------------------------------- IA
        
        if(ds_queue_empty(fila)) {
            var _inicio, _fim;
            _inicio = [x/GRID_TAM, y/GRID_TAM];
            _fim = pos_comida;
            
            var _caminho = []
            switch(floor(global.modelo_ia/2)) {
            	case 0: _caminho = move_profundidade(_inicio, _fim); break;
                case 1: _caminho = move_amplitude(_inicio, _fim);    break;
            }
            
            if(_caminho == pointer_null) {
                global.jogo = false;
                show_message("==================\nFIM DE JOGO, A IA não achou um caminho\n==================");
                show_debug_message("RESET")
                room_restart();
            } else {
                proximos_movimentos(fila, _caminho, global.modelo_ia%2);
            }
            
            
        }
    }
    
    
    
    
    
    
    if(moveTick <= 0) {
        // Definindo a direção do passo
        dir = (!global.modo_jogo) ? dirTemp : ds_queue_dequeue(fila);
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
            global.jogo = false;
            show_debug_message("==================\nFIM DE JOGO\n==================")
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
            
            if(global.crescer) {
                tamCorpo++;
                with(obj_body) {
                    numCorpo++;
                }
            }
                
            
            if( tamCorpo != ((LARGURA_GUI/GRID_TAM) * (ALTURA_GUI/GRID_TAM)) ) {
                criar_comida();
                
            } else {
                global.jogo = false;
                show_debug_message("==================\nVOCÊ GANHOU O JOGO!!!\n==================")
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