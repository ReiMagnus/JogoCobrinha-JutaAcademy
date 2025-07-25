numCorpo = -1;

function andar_corpo() {
    numCorpo--;
    if(numCorpo == 0) {
        instance_destroy(self);
    }
}