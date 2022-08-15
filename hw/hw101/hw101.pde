int ballNum = 100;
Ball[] ball; // declare a variable that refers a ball object array

void setup() {
	size(500, 500);
	noStroke();
	smooth();
	fill(200, 255, 200);
	ellipseMode(CORNER);
	randomSeed(second());
	ball = new Ball[ballNum]; // allocate memory to refer each Ball instance
	for(int i = 0; i < ball.length; i++){
		int r = int(random(256));
		int g = int(random(256));
		int b = int(random(256));
        int d = int(random(100));
        int x = int(random(0, 400));
        int y = int(random(0, 400));
        int vx = int(random(0, 10));
        int vy = int(random(0, 10));
		color c = color(r, g, b, 150);
		// generate each Ball object instance
		ball[i] = new Ball(c, d, x, y, vx, vy);
	}
}

void draw() {
	background(255);
	for(int i = 0; i < ball.length; i++) {
		ball[i].draw(); // draw ball at time t
		ball[i].move(); // calculate values at time (t + 1)
	}
}

class Ball {
	private color c; // color
	private int d; // diameter
	private float x, y; // position(x, y)
	private float vx, vy; // velocity:y, acceleration:g, restitution coefficient:k

	Ball() {}; // constructor
	Ball(color c, int d, int x, int y, int vx, int vy) { // constructor
    	this.c = c; this.d = d;
		this.x = x; this.y = y;
		this.vx = vx; this.vy = vy;
	}

	public void move(){
    x += vx;
    y += vy;
    if (x < 0 || x + d > width) {
        vx *= -1;
        if (x < 0) {
            x *= -1;
        }else if (x + d > width) {
            x = 2 * (width - d) - x;
        }
    }
    if (y < 0 || y + d > height) {
        vy *= -1;
        if (y < 0) {
            y *= -1;
        }else if (y + d > height) {
            y = 2 * (height - d) - y;
        }
    }
	}

	public void draw(){ // draw ball
		fill(c);
		ellipse(x, y, d, d);
	}
}
