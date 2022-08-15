import java.awt.Rectangle;

class Block extends Rectangle { // x, y, width and height are inheritted from Rectangle Class
	protected color c; // block color

	Block() {}; // constructor
	Block(color c, int x, int y, int w, int h){ // constructor
		setColor(c);
		setRect(x, y, w, h); // inheritted from Rectangle Class
	}

	public void setColor(color c){ this.c = c; }

	public void draw(){
		fill(c);
		rect(x, y, width, height); // width and height mean block size
	}
}

class Pad extends Block { // c, x, y, width and height are inheritted from Block Class
	Pad(){}; // constructor
	Pad(color c, int x, int y, int w, int h){ // constructor
		setColor(c); // inheritted from Block Class
		setRect(x, y, w, h); // method in Rectangle Class
	}

	// setColor and draw methods are inheritted from Block Class
	// setSize and setLocation methods are inheritted from Rectangle Class
	// getMinX() and getMaxX() are inheritted from Rectangle Class
	boolean collideLeftWall(){ return getMinX() < 0; }
	boolean collideRightWall(int w){ return getMaxX() > w; }

	public void move(int w){
		x = mouseX - width / 2;
		if(collideLeftWall()) x = 0;
		else if(collideRightWall(w)) x = w - width;
		draw();
	}
}

class Ball extends Pad {  // c, x, y, width and height are inheritted from Pad Class
	protected int vx, vy, maxSpeed;

	Ball() {}; // Constructor
	Ball(color c, int x, int y, int d, int speed) { // Constructor
		setColor(c); // inheritted from Block Class
		setRect(x, y, d, d); // inheritted from Rectangle Class
		setMaxSpeed(speed);
		setRandomVelocity();
	}

	public void setVelocity(int vx, int vy){ this.vx = vx; this.vy = vy; }
	public void setMaxSpeed(int s){ maxSpeed = s; }
	public void setRandomVelocity(){
		int m = ceil(sqrt(maxSpeed));
		do {
		    vx = int(random(-m, m));
			vy = int(random(-m, m));
		} while(vx == 0 || vy == 0);
	}

	protected boolean collideTopWall() { return getMinY() < 0; }
	protected boolean collideBottomWall(int h) { return getMaxY() > h; }

	public void move(int w, int h, Pad p){ // move method is overrided
		x += vx; y += vy;
		if(collideLeftWall() || collideRightWall(w)){
			vx *= -1;
			if(collideLeftWall()) x *= -1;
			else x = 2 * (w - width) - x;
		}

		if(collideTopWall()){
			vy *= -1;
			y *= -1;
		} else if(collideBottomWall(h)){
			setVelocity(0, 0);
			setRect(1000, 1000, width, height);
		} else if(intersects(p)){ // intersects is inheritted from Rectangle Class
			vy *= -1;
			y = 2 * (h - (int)(p.getHeight()) - height) - y;
		}
		draw();
	}

	public void reset(int x, int y){
		setRect(x, y, width, height);
		setRandomVelocity();
	}

	public void draw(){  // draw method is overrided
		fill(c);
		ellipseMode(CORNER);
		ellipse(x, y, width, height);
	}

	public int j;
}

class Star extends Ball{
	public int j;

	Star() {}; // Constructor
	Star(color c, int x, int y, int d, int speed) { // Constructor
		setColor(c); // inheritted from Block Class
		setRect(x, y, d, d); // inheritted from Rectangle Class
		setMaxSpeed(speed);
		setRandomVelocity();
	}

    public void draw(){
        beginShape();
        for (int i = 0; i < 5; ++i) {
            vertex(x + 30 * cos(radians(144 * i - 90 + j)), y + 30 * sin(radians(144 * i - 90 + j)));
        }
        endShape(CLOSE);
		j += 5;
    }
}

final int numBlocksCols = 5, numBlocksRows = 10;
final int numBlocks = numBlocksCols * numBlocksRows;
final int blockWidth = 30, blockHeight = 10, space = 2;
final int padWidth = 40, padHeight = 10;
final int ballD = 20, ballMaxSpeed = 50;
final color std_colors[] = {color(255, 0, 0) // red
  , color(255, 0, 255) // magenta
  , color(255, 255, 0) // yellow
  , color(0, 255, 255) // cyan
  , color(0, 255, 0) // green
};
final color padColor = color(200, 255, 200); // paleGreen
final color ballColor = color(255, 182, 193, 100); // lightPink
Block[][] blocks;
Pad pad;
Ball ball;
Star[] star;

void setup() {
	size(322, 400);
	noStroke();
	randomSeed(second());
	blocks = new Block[numBlocksCols][numBlocksRows];
	for(int j = 0; j < numBlocksCols; j++){
		for(int i = 0; i < numBlocksRows; i++){
			int x = space * (i + 1) + blockWidth * i;
			int y = space * (j + 1) + blockHeight * j;
			blocks[j][i] = new Block(std_colors[j], x, y, blockWidth, blockHeight);
		}
	}
	pad = new Pad(padColor, width / 2, height - padHeight, padWidth, padHeight);
	ball = new Ball(ballColor, width / 2, height / 4, ballD, ballMaxSpeed);
	star = new Star[100];
    for(int k = 0; k < 100; k++){
        star[k] = new Star(ballColor, width / 2, height / 4, ballD, ballMaxSpeed);
	}
	frameRate(30);
}

void draw() {
	background(255);
	for(int i = 0; i < numBlocks; i++)
		blocks[i / numBlocksRows][i % numBlocksRows].draw();

	pad.move(width);
	ball.move(width, height, pad);
    for(int k = 0; k < 100; k++){
        star[k].move(width, height, pad);
	}
}

void mouseClicked(){ ball.reset(width / 2, height / 4); }

