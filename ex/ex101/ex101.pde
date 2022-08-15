final int numBalls = 10;
final int d = 30, vx = 3;
Ball[] ball;

void setup() {
	size(400, 30);
	noStroke();
    smooth();
    ellipseMode(CORNER);
	ball = new Ball[numBalls];
	ball[0] = new Ball(color(255, 0, 0), 0, d, vx);
}

void draw() {
	background(255);
	ball[0].draw();
    ball[0].move();
}

class Ball {
	private color c; // ball color
	private int x, d, vx; // position:(x, 0), size:(d, d)

	Ball() {}; // constructor
	Ball(color c, int x, int d, int vx){ // constructor
		this.c = c;
		this.x = x;
		this.d = d;
        this.vx = vx;
	}

    public void draw(){
        fill(c);
        ellipse(x, 0, d, d);
    }

	public void move(){
		//fill(c);
        //ellipse(x, 0, d, d);
        x += vx; // calculate the velocity at time (t + 1)
	    if(x < 0 || x + d > width){ // if the ball reaches the window edge
		vx *= -1; // the ball turns around
		if(x < 0) x *= -1; // left edge
		else if(x + d > width) x = 2 * (width - d) - x; // right edge
	    }
	}
}
