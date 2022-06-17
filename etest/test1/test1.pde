/*void setup(){
	size(20, 400);
	noStroke();
	smooth();
	fill(200, 255, 200);
	ellipseMode(CORNER);
}

int d = 20;
float x = 0, y = 0, vy = 0, g = .2, k = .6;
void draw(){
	background(255);
	ellipse(x, y, d, d); // draw ball at time t
	y += vy + g / 2; // calculate y at time (t + 1)
	vy += g; // calculate vy at time (t + 1)
	if(y + d > height){ // if ball reaches the floor
		 vy *= -k;
		 y = 2 * (height - d) - y; // this formula is not accurate...
	}
}*/

/*void setup(){
	size(60, 400);
	noStroke();
	smooth();
	fill(200, 255, 200);
	ellipseMode(CORNER);
}

int d = 20;
float g = .2, k = .6;
float x1 = 0, y1 = 0, vy1 = 0;
float x2 = 20, y2 = 100, vy2 = 0;
float x3 = 40, y3 = 200, vy3 = 0;
void draw(){
	background(255);
	ellipse(x1, y1, d, d); // draw balls at time t
	ellipse(x2, y2, d, d);
	ellipse(x3, y3, d, d);
	y1 += vy1 + g / 2; y2 += vy2 + g / 2; y3 += vy3 + g / 2;  // y at time (t + 1)
	vy1 += g; vy2 += g; vy3 += g; // calculate vy at time (t + 1)
	if(y1 + d > height){ // if ball reaches the floor
		 vy1 *= -k;
		 y1 = 2 * (height - d) - y1;
	}
	if(y2 + d > height){
		 vy2 *= -k;
		 y2 = 2 * (height - d) - y2;
	}
	if(y3 + d > height){
		 vy3 *= -k;
		 y3 = 2 * (height - d) - y3;
	}
}*/

/*
int d = 20, ballNum = 3;
float g = .2, k = .6;
float[] x, y, vy;

void setup(){
	size(60, 400);
	noStroke();
	smooth();
	fill(200, 255, 200);
	ellipseMode(CORNER);
	x = new float[ballNum]; // memory allocation
	y = new float[ballNum];
	vy = new float[ballNum];
	for(int i = 0; i < ballNum; i++){
		x[i] = i * d;
		y[i] = i * 100;
		vy[i] = 0;
	}
}

void draw(){
	background(255);
	for(int i = 0; i < ballNum; i++){
    	ellipse(x[i], y[i], d, d);  // draw balls at time t
		y[i] += vy[i] + g / 2; // calculate y at time (t + 1)
		vy[i] += g; // calculate vy at time (t + 1)
		if(y[i] + d > height){ // if ball reaches the floor
			vy[i] *= -k;
			y[i] = 2 * (height - d) - y[i];
		}
	}
}
*/

/*mousePressed変数
void setup(){
	size(640, 480);
	background(255);
	smooth();
	noStroke();
	fill(255, 0, 0);
}

void draw(){
	if(mousePressed){
		if(mouseButton == LEFT) ellipse(mouseX, mouseY, 5, 5);
		else if(mouseButton == RIGHT) background(255);
	}
}
*/

/*	mousePressedメソッド
void setup(){
	size(640, 480);
	background(255);
	smooth();
	noStroke();
	fill(255, 0, 0);
}

void draw() {}

void mousePressed(){
	if(mouseButton == LEFT) ellipse(mouseX, mouseY, 5, 5);
	else if(mouseButton == RIGHT) background(255);
}
*/

/*mouseClickedメソッド
void setup(){
	size(640, 480);
	background(255);
	smooth();
	noStroke();
	fill(255, 0, 0);
}

void draw(){ }

void mouseClicked(){
	if(mouseButton == LEFT) ellipse(mouseX, mouseY, 5, 5);
	else if(mouseButton == RIGHT) background(255);
}
/*

/*mouseClick + 線描画
int npoints = 100, n = 0;
int[] x = new int[npoints], y = new int[npoints];

void setup(){
	size(640, 480);
	background(255);
	smooth();
}

void draw(){ }

void mouseClicked(){
	update(mouseX, mouseY);
}

void update(int p, int q){
	if(mouseButton == LEFT){
		if(n < npoints){
			x[n] = p; y[n] = q; // save (x, y) into array
			noStroke();
			fill(255, 0, 0);
			ellipse(x[n], y[n], 5, 5); // draw point (x[n], y[n])

			if(n != 0){ // draw line (x[n-1], y[n-1])-(x[n], y[n])
				stroke(0);
				line(x[n - 1], y[n - 1], x[n], y[n]);
			}
			n++;
		}
	}
	else if(mouseButton == RIGHT){
		n = 0;
		background(255);
	}
}
*/