size(300, 180);
background(#D21034);
noStroke();

fill(255, 255, 255);
rect(0, 0, 75, 180);

for (int i = 0; i < 5; ++i) {
    triangle(75, 36*i, 120, 18 + 36*i, 75, 36 + 36*i);
}
