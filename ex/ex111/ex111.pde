Ball ball;
Pentagon pentagon;
Star star;

void setup(){
	size(400, 400);
	noStroke();
    smooth();
    ellipseMode(CORNER);
    randomSeed(second());
    int r = int(random(0, 250));
    int g = int(random(0, 250));
    int b = int(random(0, 250));
    color c = color(r,g,b);
	ball = new Ball(c, 0, 0, 100, 100);
    pentagon = new Pentagon(c, 175, 175, 100, 100);
    star = new Star(c, 300, 300, 100, 100);
}

void draw(){
    background(255);
    ball.drawball();
    pentagon.drawpentagon();
    star.drawstar();
}

class Ball {
	protected color c; // ball color
	protected int x, y, w, h; // position:(x, 0), size:(d, d)

	Ball() {}; // constructor
	Ball(color c, int x, int y, int w, int h){ // constructor
        setColor(c);
        setPosition(x, y);
        setSize(w, h);
	}

    public void setColor(color c){this.c = c;}
    public void setPosition(int x,int y){this.x = x; this.y = y;}
    public void setSize(int w, int h){this.w = w; this.h = h;}

    private void drawball(){
        fill(c);
        ellipse(x, y, w, h);
    }
}

class Pentagon extends Ball{
    Pentagon(){}
    Pentagon(color c, int x, int y, int w, int h){
        setColor(c);
        setPosition(x, y);
        setSize(w, h);
    }

    private void drawpentagon(){
        beginShape();
        for (int i = 0; i < 5; ++i) {
            vertex(x + w * cos(radians(72 * i - 90)), y + h * sin(radians(72 * i - 90)));
        }
        endShape(CLOSE);
    }
}

class Star extends Pentagon{
    Star(){}
    Star(color c, int x, int y, int w, int h){
        setColor(c);
        setPosition(x, y);
        setSize(w, h);
    }

    private void drawstar(){
        beginShape();
        for (int i = 0; i < 5; ++i) {
            vertex(x + w * cos(radians(144 * i - 90)), y + h * sin(radians(144 * i - 90)));
        }
        endShape(CLOSE);
    }
}