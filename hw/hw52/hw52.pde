size(300, 300);
background(255);
colorMode(HSB, 100);

float x1,x2,y1,y2 ;
for (int i = 0; i < 100; ++i) {
    stroke(i, 100, 100);
    x1 = 150 + 30 * cos(radians(3.60 * i));
    y1 = 150 + 30 * sin(radians(3.60 * i));
    x2 = 150 + 100 * cos(radians(3.60 * i));
    y2 = 150 + 100 * sin(radians(3.60 * i));
    line(x1, y1, x2, y2);
}

