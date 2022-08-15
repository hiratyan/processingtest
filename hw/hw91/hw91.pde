float[] d, x, y, vx, vy;
int[] r, g, b;
int ballNum = 100;

void setup() {
   size(500, 500);
   smooth();
   noStroke();
   ellipseMode(CORNER);
   frameRate(30); 
   d = new float[ballNum];
   x = new float[ballNum];
   y = new float[ballNum];
   vx = new float[ballNum];
   vy = new float[ballNum];
   r = new int[ballNum];
   g = new int[ballNum];
   b = new int[ballNum];
   for(int i = 0; i < ballNum; i++){
       d[i] = random(1, 100);
	   x[i] = random(1, 500);
	   y[i] = random(1, 500);
	   vx[i] = random(1, 10);
	   vy[i] = random(1, 10);
	   r[i] = int(random(256));
	   g[i] = int(random(256));
	   b[i] = int(random(256));
   }
}

void draw() {
	background(255);
	for (int i = 0; i < ballNum; ++i) {
		fill(r[i], g[1], b[i]);
		ellipse(x[i], y[i], d[i], d[i]);
		x[i] += vx[i];
		y[i] += vy[i];
		if (x[i] < 0 || x[i] + d[i] > width) {
			vx[i] *= -1;
			if (x[i] < 0) {
				x[i] *= -1;
			}else if (x[i] + d[i] > width) {
				x[i] = 2 * (width - d[i]) - x[i];
			}
		}
		if (y[i] < 0 || y[i] + d[i] > height) {
			vy[i] *= -1;
			if (y[i] < 0) {
				y[i] *= -1;
			}else if (y[i] + d[i] > height) {
				y[i] = 2 * (height - d[i]) - y[i];
			}
		}
	}
}
