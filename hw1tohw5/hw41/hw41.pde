size(270, 180);
background(#E21C1C);
noStroke();

float x = width / 2, y = height / 2;

fill(#FFFF00);
beginShape();
    for (int i = 0; i < 5; ++i) {
                vertex(x + 54 * cos(radians(144 * i - 90)), y + 54 * sin(radians(144 * i - 90)));
    }
endShape(CLOSE);