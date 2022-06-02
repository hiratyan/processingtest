size(216, 144);
background(239, 51, 64);
noStroke();
smooth();

fill(255, 255, 255);//左の白円
ellipse(45.5, 36, 53, 53);

fill(239, 51, 64);//右の赤円
ellipse(60, 36, 58, 58);

fill(255, 255, 255);//下の白い長方形
rect(0, 72, 216, 72);

fill(255,255,255);
for (int i = 0; i < 5; i++) {
    float x = 15.2 * cos(radians(144*i - 90)) + 60;
    float y = 15.2 * sin(radians(144*i - 90)) + 36;
    beginShape();
    for (int j = 0; j < 5; j++) {
        vertex(6.4 * cos(radians(144*j - 90)) + x, 6.4 * sin(radians(144*j - 90)) + y);
    }
    endShape(CLOSE);
}