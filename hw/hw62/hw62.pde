void setup() {
    size(247, 130);
    background(#FFFFFF);
    noStroke();
    smooth();
    for (int i = 0; i < 7; ++i) {
        fill(#B22234);
        rect(0, height / 13 * 2 * i, width, height / 13);
    }
    fill(#3C3B6E);
    rect(0, 0, width * 2 / 5, height * 7 / 13);
    fill(#FFFFFF);
    for (int i = 0; i < 5; ++i) {
        for (int j = 0; j < 6; ++j) {
            fiveStar(width * 1 / 30 + width * 1 / 15 * j, height * 7 / 130 + height * 7 / 65 * i);
        }
    }
    for (int i = 0; i < 4; ++i) {
        for (int j = 0; j < 5; ++j) {
            fiveStar(width * 1 / 15 + width * 1 / 15 * j, height * 7 / 65 + height * 7 / 65 * i);
        }
    }
}

void fiveStar(float x, float y) {
    beginShape();
    for (int i = 0; i < 5; ++i) {
            vertex(x + height / 13 * 2 / 5 * cos(radians(144 * i - 90)), y + height / 13 * 2 / 5 * sin(radians(144 * i - 90)));
    }
    endShape(CLOSE);
}