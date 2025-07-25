#macro GAME_SPEED game_get_speed(gamespeed_fps)
#macro GRID_TAM 40 

function draw_grid_gui(width_gui, height_gui, grid_tam) {
    for(var i = 0; i < width_gui; i+=grid_tam)  {draw_line(i, 0, i, height_gui);}
    for(var j = 0; j < height_gui; j+=grid_tam) {draw_line(0, j, width_gui, j);}
}
