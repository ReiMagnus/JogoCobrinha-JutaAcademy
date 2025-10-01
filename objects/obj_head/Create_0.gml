
spd = 0.01;
moveTick = spd * GAME_SPEED;
dir = 0; // Cima = 0, Diretira = 1, Baixo = 2 e Esquerda = 3 
dirTemp = dir;

tamCorpo = 3;

function criar_comida() {
    var _pX, _pY
    var _valido = true;
    
    while(_valido) {
        _pX = irandom_range(0, display_get_gui_width()-1);
        _pY = irandom_range(0, display_get_gui_height()-1);
        
        _pX = floor(_pX/GRID_TAM)*GRID_TAM;
        _pY = floor(_pY/GRID_TAM)*GRID_TAM;
        
        if(!position_meeting(_pX, _pY, [obj_head, obj_body, obj_comida])) {
            _valido = false;
        }
    }
    
    pos_comida = [_pX/GRID_TAM, _pY/GRID_TAM];
    instance_create_layer(_pX, _pY, "Instances", obj_comida);
        
}

// MOVIMENTAÇÃO DA IA
pos_comida = [];
if(global.modo_jogo) {
    global.grid_map = att_grid_map();
    fila = -1;
    if(ds_exists(fila, ds_type_queue)) {
        ds_queue_destroy(fila);
        fila = ds_queue_create();
    } else {
        fila = ds_queue_create();
    } 
}

// Final
criar_comida();
