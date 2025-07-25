
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

draw_set_alpha(0.1);
draw_grid_gui(_wgui, _hgui, GRID_TAM);
draw_set_alpha(1);

draw_text(20, 20, string("Estado: {0}", (obj_head.jogo) ? "Jogando" : "Derrota"));

if(instance_exists(obj_comida)) {
    draw_line(640/2, 360/2, obj_comida.x+GRID_TAM/2, obj_comida.y+GRID_TAM/2);
}

