void setup() {
   size(300, 500);
   smooth();
   noStroke();
   fill(200, 255, 200);
   ellipseMode(CORNER);
   randomSeed(second());
   frameRate(30); 
}

int d = 20, x = int(random(width - d)), y = int(random(height -d)), vx = 10, vy = 10;
void draw() {
    background(255);
    ellipse(x, y, d, d);
    x += vx;
    y += vy;
    if (x < 0 || x + d > width) {
        vx *= -1;
        if (x < 0) {
            x *= -1;
        }else if (x + d > width) {
            x = 2 * (width - d) - x;
        }
    }
    if (y < 0 || y + d > height) {
        vy *= -1;
        if (y < 0) {
            y *= -1;
        }else if (y + d > height) {
            y = 2 * (height - d) - y;
        }
    }
}
