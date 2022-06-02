void setup() {
    size(800, 800);
    background(255);
    noStroke();
    fill(144, 238, 144);
    smooth();
    for (int i = 0; i < 8 ; ++i) {
        for (int j = 0; j < 8; ++j) {
            fiveStar(50 + 100 * i, 50 + 100 * j);
        }
    }
}

void fiveStar(int x, int y) {
    beginShape();
    for (int i = 0; i < 5; ++i) {
            vertex(x + 50 * cos(radians(144 * i - 90)), y + 50 * sin(radians(144 * i - 90)));
    }
    endShape(CLOSE);
}