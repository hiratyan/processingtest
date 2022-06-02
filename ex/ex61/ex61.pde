void setup() {
    size(300, 300);
    background(255);
    noStroke();
    fill(144, 238, 144);
    smooth();
    fiveStar(70, 150, 150);
}

void fiveStar(int r, int x, int y) {
    beginShape();
    for (int i = 0; i < 5; ++i) {
            vertex(x + r * cos(radians(144 * i - 90)), y + r * sin(radians(144 * i - 90)));
    }
    endShape(CLOSE);
}
