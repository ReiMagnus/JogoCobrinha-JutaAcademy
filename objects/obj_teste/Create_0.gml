
/*
listNodes = ds_stack_create()

//ds_stack_push(listNodes, create_node(pointer_null, [0,0], 0))

node01 = create_node(pointer_null, [0,0], 0);
node02 = create_node(node01, [0,1], node01[2]+1);
node03 = create_node(node02, [0,2], node02[2]+1);

show_debug_message(global.grid_map)
*/

//inicio = [7,4];
//fim    = [5,1];

fila = -1;
if(ds_exists(fila, ds_type_queue)) {
    ds_queue_destroy(fila);
    fila = ds_queue_create();
} else {
    fila = ds_queue_create();
}

show_debug_message(string("TAM W {0} TAM H {1}", LARGURA_GUI/GRID_TAM, ALTURA_GUI/GRID_TAM))

caminho = move_profundidade([7,4], [5,1]);
proximos_movimentos(fila, caminho, 0);
show_debug_message(string("Caminho 1 {1}->{2} | {0}", caminho, [7,4], [5,1]))
show_debug_message(string("FILA SIZE: {0}\n", ds_queue_size(fila)))

caminho = move_profundidade([5,1], [5,7]);
proximos_movimentos(fila, caminho, 0);
show_debug_message(string("Caminho 2 {1}->{2} | {0}", caminho, [5,1], [5,7]))
show_debug_message(string("FILA SIZE: {0}\n", ds_queue_size(fila)))

/*
show_debug_message("-----------------")
show_debug_message((caminho));

fila = -1;
if(ds_exists(fila, ds_type_queue)) {
    ds_queue_destroy(fila);
    fila = ds_queue_create();
} else {
    fila = ds_queue_create();
}

proximos_movimentos(fila, caminho, 0);
