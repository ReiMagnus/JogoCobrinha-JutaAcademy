
draw_text(20, 20, string("FPS REAL: {0}", fps_real))
draw_text(20, 40, string("FPS: {0}", fps))

var _caminho = [];
array_copy(_caminho, 0, caminho, 0, array_length(caminho))

for(var j = 0; j < ALTURA_GUI/GRID_TAM; j++) {
    for(var i = 0; i < LARGURA_GUI/GRID_TAM; i++) {
        
        var _xx = 100+(30*i);
        var _yy = 80+(30*j);
        
        var _cor = c_white;
        
        // Não pensei em nenhuma forma de simplificar e reduzir o tempo de processamento disso SOCORRO
        for(var k = 0; k < array_length(_caminho); k++) {
            
            if(array_equals( [i,j] , _caminho[k])) {
                
                //if(array_equals( [i,j] , inicio)) {
                    //_cor = c_green;
                //} else if(array_equals( [i,j] , fim)) {
                    //_cor = c_red;
                //} else {
                    //_cor = c_gray;
                //}
                _cor = c_gray;
                
                array_delete(_caminho, k, 1);
                break;
            }
        }
        
        draw_rectangle_color(_xx-12, _yy-12, _xx+12, _yy+12, _cor, _cor, _cor, _cor, false);
        //draw_point(100+(30*i), 60+(30*j)
    }
}
