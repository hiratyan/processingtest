String screen = "start"; //ゲーム画面を指定する番号．
//"start" はスタート画面，1"game" はゲーム画面．"end" は終了画面．
int d = 20, x = 0, y = 600, vx = 10, vy = 10;
color c = color(255, 0, 0);
int time_base = 0; //ゲーム時間を初期化するための変数
int time_limit = 20; //ゲーム時間
int time_left; //ゲーム残り時間
int score = 0; //スコア
boolean point_life[][] = new boolean[7][7]; //的の生存確認
boolean point_speed_life[][] = new boolean[5][5]; //スピードアップ的の生存確認
// PinBallクラス．これは操作する弾についてのクラス．
PinBall[] pinball;
class PinBall {
	public color c; // color
	public int d; // diameter
	public int x, y;
	public int vx, vy;

	PinBall() {}; // constructor
	PinBall(color c, int d, int x, int y, int vx, int vy) {
        setColor(c);
        setBall(x, y, d);
        setSpeed(vx, vy);
	}

    public void setColor(color c){this.c = c;}
    public void setBall(int x,int y,int d){this.x = x; this.y = y; this.d = d;}
    public void setSpeed(int vx, int vy){this.vx = vx; this.vy = vy;}

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
//Pointクラス．これは操作する弾についてのクラス．
Point[] point;
class Point extends PinBall{
	Point() {}; // constructor
	Point(color c, int d, int x, int y, int vx, int vy) {
        setColor(c);
        setBall(x, y, d);
        setSpeed(vx, vy);
	}
}


void setup() {
    size(800, 1000);
    noStroke();
    smooth();
    textSize(100);
    textAlign(CENTER);
    textFont(createFont("Harrington", 48));
    fill(200, 255, 200);
    ellipseMode(CENTER);
    frameRate(30);
    pinball = new PinBall[1];
    point = new Point[2];
    pinball[0] = new PinBall(c, d, x, y, vx, vy); 
    point[0] = new Point(c, d, x, y, vx, vy); 
    point[1] = new Point(c, d, x, y, vx, vy);
}

void draw() {
    base();
    if(screen == "start"){
        start_screen();
    } else if(screen == "game"){
        game_screen();
    } else if(screen == "end"){
        end_screen();
    }
}

void base(){
    background(255);
}

void start_screen(){
    fill(0);
    text("Click to start GAME", width/2, height/2);
    time_base = millis();
    //的達の初期化
    for(int i = 0; i < 7;i++){
        for(int j = 0; j < 7;j++){
            point_life[i][j] = true;
        }
    }
    for(int i = 0; i < 5;i++){
        for(int j = 0; j < 5;j++){
            point_speed_life[i][j] = true;
        }
    }
}

void game_screen(){
    fill(255,0,0);
    rect(0, 55, width, 5);

    //時間に関するもの
    time_left = time_limit - (millis() - time_base) / 1000;
    text("COUNT DOWN:" + time_left, 200, 50);
    if (time_left == 0) {
        screen = "end";
    }
    
    //スコア
    text("SCORE:" + score, 700, 50);

    //弾とその反射
    pinball[0].draw();
    pinball[0].move();

    //的の当たり判定
    for(int i = 0; i < 7; i++){
        for (int j = 0; j < 7; ++j) {
            point_life[0][j] = false;
            point_life[i][0] = false;
            if(point_life[i][j]){
                fill(0, 0, 255);
                point[0].c = color(0, 0, 255);
                point[0].x = i * 150;
                point[0].y = j * 150;
                point[0].vy = 0;
                point[0].vx = 0;
                point[0].d = 10;
                point[0].draw();
            }
            if((pinball[0].x > i * 140 && pinball[0].x < i * 160) && (j * 140 < pinball[0].y && pinball[0].y < j * 160) && point_life[i][j]){
                point_life[i][j] = false;
                score++;
            }
        }
    }
    //スピードアップ的の当たり判定
    for(int i = 0; i < 5; i++){
        for (int j = 0; j < 5; ++j) {
            point_speed_life[0][j] = false;
            point_speed_life[i][0] = false;
            if(point_speed_life[i][j]){
                point[1].c = color(0, 255, 0);
                point[1].x = i * 250;
                point[1].y = j * 250;
                point[1].vy = 0;
                point[1].vx = 0;
                point[1].d = 10;
                point[1].draw();
            }
            if((pinball[0].x > i * 240 && pinball[0].x < i * 260) && (j * 240 < pinball[0].y && pinball[0].y < j * 260) && point_speed_life[i][j]){
                point_speed_life[i][j] = false;
                if (pinball[0].vx > 0) {
                    pinball[0].vx += 3;
                }
                if (pinball[0].vx < 0) {
                    pinball[0].vx -= 3;
                }
                if (pinball[0].vy > 0) {
                    pinball[0].vy += 3;
                }
                if (pinball[0].vy < 0) {
                    pinball[0].vy -= 3;
                }
                score++;
            }
        }
    }
    
}

void end_screen(){
    fill(0);
    text("End", width/2, height/3);
    text("Your Score:" + score, width/2, height/2);
}

void mousePressed(){
    if(screen == "start"){
        score = 0; //スコアの初期化
        pinball[0].vx = 10;//
        pinball[0].vy = 10;//速さの初期化
        screen = "game";
    } else if(screen == "game"){
        if(mouseButton == LEFT) {
            pinball[0].vx *= -1;
            pinball[0].vy *= 1;            
        }
        if(mouseButton == RIGHT){
            pinball[0].vx *= 1;
            pinball[0].vy *= -1;
        }

    } else if(screen == "end"){
        screen = "start";
    }
}
