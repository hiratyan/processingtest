size(360, 240);
background(255);
noStroke();
smooth();

fill(0, 51, 160);
rect(0, 0, 120, 120);

fill(200, 16, 64);
rect(0, 120, 360, 120);

fill(255,255,255);
beginShape();
    for (int i = 0; i < 5; i++) {
        vertex(30 * cos(radians(144*i - 90)) + 60, 30 * sin(radians(144*i - 90)) + 60);
    }
endShape();
