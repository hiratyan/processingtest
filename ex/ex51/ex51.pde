size(300, 300);
background(255);
stroke(0);

fill(#FFFF00);
beginShape();
for (int i = 0; i < 5; ++i) {
        vertex(width/2 + 100 * cos(radians(144 * i - 90)), height/2 + 100 * sin(radians(144 * i - 90)));
}
endShape(CLOSE);