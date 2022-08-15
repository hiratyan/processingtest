void setup(){
	size(1000, 100);
	smooth();
	noStroke();
    background(255);
	fill(152, 251, 152);
	frameRate(150);
}

int r, j = 0;

void draw(){
    background(255);
    beginShape();
    for(int i = 0; i < 10; i++){
        if((i % 2) == 0) r = 50;
        else r = 20;
        float theta = i * TWO_PI / 10 - HALF_PI + radians(j);
        float x = r * cos(theta);
        float y = r * sin(theta) + height / 2;
        vertex(x, y);
    }
    endShape();
    j += 1; 
}