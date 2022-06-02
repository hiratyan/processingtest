size(1000, 1000);
background(255);
colorMode(HSB, 25);
noStroke();

/*
for (int i = 0; i < 25; ++i) {
    for (int j = 0; j < 25; ++j) {
        fill(i, j, 100);
        ellipse(25*(i + 1), 25*(j + 1), 20, 20);
    }
}
*/


int l=25, x=0, y=0;
while (y <= l) {
    x = 0;
    while (x <= l) {
        fill(y, x, 100);
        ellipse(25*(y + 1), 25*(x + 1), 20, 20); 
        x += 1;       
    }
    y += 1;
}