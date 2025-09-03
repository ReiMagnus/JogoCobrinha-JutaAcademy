
global.grid_map = create_grid_map(640/GRID_TAM, 360/GRID_TAM);

function create_grid_map(wTam, hTam){
    var _map = 0;
    
    for(var j = 0; j < hTam; j++) {
        for(var i = 0; i < wTam; i++) {
            _map[i, j] = 0;
        }
    }
    
    show_debug_message(string("Matriz de {0}x{1} criada", wTam, hTam))
    
    return _map;
}

function att_grid_map() {
    
    var _wTam = array_length(global.grid_map)
    var _hTam = array_length(global.grid_map[0])
    
    var _map;
    
    for(var j = 0; j < _hTam; j++) {
        for(var i = 0; i < _wTam; i++) {
            
            var _valor = 0;
            
            if(position_meeting(i*GRID_TAM, j*GRID_TAM, [obj_head, obj_body])) {
                _valor = 2;
            } else if(position_meeting(i*GRID_TAM, j*GRID_TAM, obj_comida)) {
                _valor = 1;
            }
            _map[i, j] = _valor;
        }
    }
    //show_debug_message("GRID MAP atualizado");
    return _map;
}