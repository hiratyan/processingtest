int d = 20, x, y, vx, vy;
void setup() {
   size(400, 400);
   smooth();
   noStroke();
   fill(200, 255, 200);
   ellipseMode(CORNER);
   frameRate(30); 
   randomSeed(second());
   initValues();
}

void initValues(){
   x = int(random(width - d));
   y = int(random(height - d));
   do{
        vx = int(random(-5,5));
        vy = int(random(-5,5));
   }
   while (vx == 0 && vy == 0) ;
}

void draw() {
    background(255);
    ellipse(x,y,d,d);
    x += vx;
    y += vy;
    if((x > width) || (y > height) || (x < 0) || (y < 0)){
            initValues();
    };
}
