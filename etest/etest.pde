size(300, 100);
background(255);
smooth();
noStroke();
fill(152, 251, 152);

beginShape();
    for (int i = 0; i < 6; ++i) {
        vertex(50 * cos(radians(-90 + 60 * i)) + 50, 50 * sin(radians(-90 + 60 * i)) + 50);
    }
endShape();


