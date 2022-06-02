size(200, 200);
background(255);
smooth();
noStroke();
fill(152, 251, 152);
int r = width / 2;
float x, y, theta = -HALF_PI, deltaTheta = TWO_PI / 8;
beginShape();
    for (int i = 0; i < 8; ++i) {
        x = r * cos(theta) + r; y = r * sin(theta) + r;
        vertex(x, y);
        theta += deltaTheta;    
    }
endShape();
