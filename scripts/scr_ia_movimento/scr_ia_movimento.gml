

//Variaveis globais
global.jogo      = false; // O jogo está começado?
global.modo_jogo = 0;     // false manual | true IA
global.crescer   = false; // Ao comer uma comida o corpo vai crescer?
global.modelo_ia = 0;     // 0 prof. passo | 1 prof. caminho | 2 ampli. passo | 3 ampli. caminho

//-----------------------------

global.grid_map = create_grid_map(LARGURA_GUI/GRID_TAM, ALTURA_GUI/GRID_TAM);

function create_grid_map(wTam, hTam){
    var _map = 0;
    
    for(var j = 0; j < hTam; j++) {
        for(var i = 0; i < wTam; i++) {
            _map[i, j] = 0;
        }
    }
    
    return _map;
}

function att_grid_map() {
    
    var _wTam = array_length(global.grid_map)
    var _hTam = array_length(global.grid_map[0])
    
    var _map;
    
    for(var j = 0; j < _hTam; j++) {
        for(var i = 0; i < _wTam; i++) {
            
            var _valor = 0;
            
            if(position_meeting(i*GRID_TAM, j*GRID_TAM, [obj_head, obj_body, obj_parede])) {
                _valor = 1;
            }
            _map[i, j] = _valor;
        }
    }
    return _map;
}

function create_node(_pai, _estado, _v1) constructor  {
    
    pai = _pai;
    estado = _estado;
    v1 = _v1;
    
}

function verificar_visitados(_novo, _visitados) {
    var _keys = ds_map_keys_to_array(_visitados);
    
    for(var i = 0; i < array_length(_keys); i++) {
        if(array_equals(_novo, _keys[i])) {
            return true;
        }
    }
    return false;
}

function sucessores_grid(st) {
    var _f = [];
    var xx, yy;
    xx = st[0];
    yy = st[1];
    
    try {
        // Direita
        if(yy+1 < ALTURA_GUI/GRID_TAM) {
            if(global.grid_map[xx][yy+1] == 0) {
                array_push(_f, [xx, yy+1]);
            }
        }
    } catch(_exception) {}
    
    try {
        // Esquerda
        if(yy-1 < ALTURA_GUI/GRID_TAM) {
            if(global.grid_map[xx][yy-1] == 0) {
                array_push(_f, [xx, yy-1]);
            }
        }
    } catch(_exception) {}
    
    try {
        // Abaixo
        if(xx+1 >= 0) {
            if(global.grid_map[xx+1][yy] == 0) {
                array_push(_f, [xx+1, yy]);
            }
        }
    } catch(_exception) {}
    
    try {
        // Acima
        if(xx-1 >= 0) {
            if(global.grid_map[xx-1][yy] == 0) {
                array_push(_f, [xx-1, yy]);
            }
        }
    } catch(_exception) {}
 
    return _f;
}

function exibirCaminho(filho) {
    var _node = filho;
    var _caminho = []
    
    while(_node != pointer_null) {
        array_push(_caminho, _node.estado)
        _node = _node.pai;
    }
    
    _caminho = array_reverse(_caminho);
    
    return _caminho;
}

function proximos_movimentos(_fila, _movimentos, _modo) {
    var _prox = [];
    array_copy(_prox, 0, _movimentos, 0, array_length(_movimentos));
    var _atual = array_shift(_prox);
    
    if(_modo == 1) { // Pega apenas o primeiro movimento 
        ds_queue_enqueue(_fila, get_direction(_atual, _prox[0]));
    } else { // Pega todos os proximos movimentos até o objetivo
        while(array_length(_prox) > 0) {
            
            ds_queue_enqueue(_fila, get_direction(_atual, _prox[0]));
            _atual = array_shift(_prox);
            
        }
    }
    
}

function get_direction(_atual, _prox) {
    
    var _vetor = [ (_prox[0]-_atual[0]), (_prox[1]-_atual[1]) ];
    
    // up    = 0
    // right = 1
    // down  = 2
    // left  = 3
    
    if(array_equals(_vetor,  [0,-1])) {return 0;} else // Acima
    if(array_equals(_vetor,  [1,0])) {return 1;} else // Direita
    if(array_equals(_vetor, [0,1])) {return 2;} else // Abaxio
    if(array_equals(_vetor, [-1,0])) {return 3;}      // Esquerda
    
}

// Métodos de busca ===================================================
function move_amplitude(inicio, fim) {
    
    if(array_equals(inicio, fim)) {
        return [inicio];
    }
    
    var _fila = ds_queue_create();
    
    var _raiz = new create_node(pointer_null, inicio, 0);
    ds_queue_enqueue(_fila, _raiz);
    
    var _visitado = ds_map_create()
    ds_map_add(_visitado, inicio, _raiz);
    
    while(!ds_queue_empty(_fila)) {
        var _atual = ds_queue_dequeue(_fila);
        
        var _filhos = sucessores_grid(_atual.estado);
        
        for(var i = 0; i < array_length(_filhos); i++) {
            var _novo = _filhos[i];
            
            if(!verificar_visitados(_novo, _visitado)) { 
                var _filho = new create_node(_atual, _novo, _atual.v1);
                ds_queue_enqueue(_fila, _filho);
                ds_map_add(_visitado, _novo, _filho)
                
                if(array_equals(_novo, fim)) {
                    return exibirCaminho(_filho);
                }
            }
        }
        
    }
    return pointer_null
}

function move_profundidade(inicio, fim) {
    
    if(array_equals(inicio, fim)) {
        return [inicio];
    }
    
    var _pilha = ds_stack_create();
    
    var _raiz = new create_node(pointer_null, inicio, 0);
    ds_stack_push(_pilha, _raiz);
    
    var _visitado = ds_map_create()
    ds_map_add(_visitado, inicio, _raiz);
    
    while(!ds_stack_empty(_pilha)) {
        var _atual = ds_stack_pop(_pilha);
        
        var _filhos = sucessores_grid(_atual.estado);
        
        for(var i = 0; i < array_length(_filhos); i++) {
            var _novo = _filhos[i];
            
            if(!verificar_visitados(_novo, _visitado)) { 
                var _filho = new create_node(_atual, _novo, _atual.v1);
                ds_stack_push(_pilha, _filho);
                ds_map_add(_visitado, _novo, _filho)
                
                if(array_equals(_novo, fim)) {
                    return exibirCaminho(_filho);
                }
            }
        }
        
    }
    return pointer_null
}

