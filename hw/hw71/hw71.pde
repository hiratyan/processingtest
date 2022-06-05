void setup(){
	size(100, 100);
	smooth();
	noStroke();
    background(255);
	fill(152, 251, 152);
	frameRate(150);
}

int r1 = 50, r2 = 20, r, j;

void draw(){
    background(255);
    beginShape();
    for(int i = 0; i < 10; i++){
        if((i % 2) == 0) r = r1;
        else r = r2;
        float theta = i * TWO_PI / 10 - HALF_PI + radians(j);
        float x = r * cos(theta) + width / 2;
        float y = r * sin(theta) + height / 2;
        vertex(x, y);
    }
    endShape();
    j += 1; 
}