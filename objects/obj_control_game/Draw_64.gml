
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

draw_set_font(fnt_debug);

// TELA DE INFORMAÇÕES ==========================
draw_set_alpha(0.75);

draw_set_halign(fa_right);
draw_set_valign(fa_middle);

draw_text(_wgui-10, 20, string("{0} FPS REAL", fps_real))
draw_text(_wgui-10, 40, string("{0} FPS", fps))

draw_set_halign(fa_left);

draw_text(10, 20, string("[SPACE] Jogo: {0}", (!global.jogo) ? "PAUSADO" : "JOGANDO"))
draw_text(10, 40, string("[1] Modo Controle: {0}", (!global.modo_jogo) ? "Manual" : "IA"));
draw_text(10, 60, string("[2] Crescer: {0}", (!global.crescer) ? "False" : "True"));

var _txt;
switch(global.modelo_ia) {
	case 0 : _txt = "Prof. por caminho"; break;
    case 1 : _txt = "Prof. por passo"; break;
    case 2 : _txt = "Ampli. por caminho"; break;
    case 3 : _txt = "Ampli. por passo"; break;
}

draw_text(10, 80, string("[3,4,5,6] Método: {0}", (global.modo_jogo == true) ? _txt : "----"));

draw_set_halign(-1);
draw_set_valign(-1);
draw_set_alpha(1);
// =============================================

// Desenho da GRID =============================
draw_set_alpha(0.2);
draw_grid_gui(_wgui, _hgui, GRID_TAM);
draw_set_alpha(1);
// =============================================

if(instance_exists(obj_comida)) {
    draw_line(640/2, 360/2, obj_comida.x+GRID_TAM/2, obj_comida.y+GRID_TAM/2);
}

var _map = global.grid_map;

for(var j = 0; j < array_length(_map[0]); j++) {
    for(var i = 0; i < array_length(_map); i++) {
        //draw_text(i*GRID_TAM, j*GRID_TAM, _map[i, j]); // Valor do tile na grid
        
        //draw_text_transformed(i*GRID_TAM, j*GRID_TAM, string("{0},{1}", i, j), 0.7, 0.7, 0); // Coordenada do tile no grid
        
        //var _cor;
        //switch (_map[i,j]) {
            //case 0: _cor = c_white; break;
            //case 1: _cor = c_gray; break;
            //case 2: _cor = c_black; break;
        //}
        //
        //draw_rectangle_color(i*GRID_TAM, j*GRID_TAM, i*GRID_TAM+GRID_TAM, j*GRID_TAM+GRID_TAM, _cor, _cor, _cor, _cor, false);
    }
}


draw_set_font(-1);