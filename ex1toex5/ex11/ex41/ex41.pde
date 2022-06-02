size(300, 100);
background(255);
smooth();
stroke(154, 205, 50);
fill(152, 251, 152);

int d = 20;
int x = 310,y = 10;

for (int i = 0; i < 5; ++i) {
    x -= 20;
    ellipse(x, y, d, d);
}