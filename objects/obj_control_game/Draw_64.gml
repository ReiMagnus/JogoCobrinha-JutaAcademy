
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

draw_set_alpha(0.1);
draw_grid_gui(_wgui, _hgui, GRID_TAM);
draw_set_alpha(1);

//draw_text(20, 20, string("Estado: {0}", (obj_head.jogo) ? "Jogando" : "Derrota"));

//if(instance_exists(obj_comida)) {
    //draw_line(640/2, 360/2, obj_comida.x+GRID_TAM/2, obj_comida.y+GRID_TAM/2);
//}

var _map = global.grid_map;

for(var j = 0; j < array_length(_map[0]); j++) {
    for(var i = 0; i < array_length(_map); i++) {
        draw_text(i*GRID_TAM, j*GRID_TAM, _map[i, j]);
        
        
        //var _cor;
        //switch (_map[i,j]) {
            //case 0: _cor = c_white; break;
            //case 1: _cor = c_gray; break;
            //case 2: _cor = c_black; break;
        //}
        //draw_rectangle_color(i*GRID_TAM, j*GRID_TAM, i*GRID_TAM+GRID_TAM, j*GRID_TAM+GRID_TAM, _cor, _cor, _cor, _cor, false);
    }
}
