float[] x, y, d, vx;
int ballNum = 5;

void setup(){
	size(400, 400);
	smooth();
	noStroke();
	fill(200, 255, 200);
	frameRate(30);
	d = new float[ballNum];
	x = new float[ballNum];
	y = new float[ballNum];
	vx = new float[ballNum];
	for(int i = 0; i < ballNum; i++){
        d[i] = 10 + 10 * i;
		y[i] = 50 + 50 * i;
		vx[i] = 1 + i;
	}
}

void draw(){
	background(255);
    for (int i = 0; i < ballNum; ++i) {
    	ellipse(x[i], y[i], d[i], d[i]); 
	    x[i] += vx[i];
	    if(x[i] < 0 || x[i] + d[i] > width){
		    vx[i] *= -1; 
		    if(x[i] < 0) x[i] *= -1; 
		    else if(x[i] + d[i] > width) x[i] = 2 * (width - d[i]) - x[i]; 
	    }
    }
}
