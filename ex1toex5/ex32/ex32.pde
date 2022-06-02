size(400, 100);
background(255);
smooth();
noStroke();
fill(152, 251, 152);

beginShape();
    vertex(50 + 50 * cos(radians(-90 + 72 * 0)), 50 + 50 * sin(radians(-90 + 72 * 0)));
    vertex(50 + 50 * cos(radians(-90 + 72 * 1)), 50 + 50 * sin(radians(-90 + 72 * 1)));
    vertex(50 + 50 * cos(radians(-90 + 72 * 2)), 50 + 50 * sin(radians(-90 + 72 * 2)));
    vertex(50 + 50 * cos(radians(-90 + 72 * 3)), 50 + 50 * sin(radians(-90 + 72 * 3)));
    vertex(50 + 50 * cos(radians(-90 + 72 * 4)), 50 + 50 * sin(radians(-90 + 72 * 4)));
endShape();