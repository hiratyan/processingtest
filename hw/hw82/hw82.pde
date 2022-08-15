void setup() {
   size(1000, 200);
   smooth();
   noStroke();
   frameRate(30); 
}

float theata = 0,dtheata = 1, x = 100, dx = 5, d = 200, t = 0;
void draw() {
    background(255);
    fill(255, 255, 0);
    if (t == 0) {
        arc(x, 100, d, d, radians(theata), 2*PI - radians(theata));
    }else if (t == 1) {
        arc(x, 100, d, d, - PI + radians(theata), PI - radians(theata));
    }
    theata += dtheata;
    x += dx;
    if (theata > 30 || theata < 0) {
        dtheata *= -1;
    };
    if (x > width - d/2 || x < d/2){
        dx *= -1;
        if (t == 0) {
            t = 1;
        }else if (t == 1) {
            t = 0;
        }
    }
}