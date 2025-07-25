
spd = 0.4;
moveTick = spd * GAME_SPEED;
dir = 0; // Cima = 0, Diretira = 1, Baixo = 2 e Esquerda = 3 
dirTemp = dir;

tamCorpo = 15;

jogo = true;

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
    
    instance_create_layer(_pX, _pY, "Instances", obj_comida);
        
}

criar_comida();
