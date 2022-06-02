void setup() {
    size(100, 100);
    background(255);
    noStroke();
    fill(144, 238, 144);
    smooth();
    nStar(5);//好きな数字を入れる
}

void nStar(int n) {
    beginShape();
    for (int i = 0; i < n; ++i) {
        vertex(50 + 50 * cos(- HALF_PI + TWO_PI/n * i), 50 + 50 * sin(- HALF_PI + TWO_PI/n * i));
        vertex(50 + 20 * cos(- HALF_PI - TWO_PI / (2 * n) + TWO_PI/n * (i + 1)), 50 + 20 * sin(- HALF_PI - TWO_PI/(2 * n) + TWO_PI/n * (i + 1)));
    }
    endShape();
}
