size(270, 180);
background(255);
noStroke();

int x = 50, y = 40;

fill(#a260bf);
beginShape();
for (int i = 0; i < 6; ++i) {
    vertex(x + x * cos(radians(-90 + 60 * i)), x + x * sin(radians(-90 + 60 * i)));
    vertex(x + y * cos(radians(-120 + 60 * (i + 1))), x + y * sin(radians(-120 + 60 * (i + 1))));
}
endShape();