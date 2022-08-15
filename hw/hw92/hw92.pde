final int IDLE=0; //開始前
final int GAME=1; //ゲーム中
final int OVER=2; //ゲームオーバー

int status=IDLE; //状態変数
boolean clicked=false; //マウスクリックを記録するフラグ
int cnt;

void setup() {
   size(300, 400);
   smooth();
   noStroke();
   fill(200, 255, 200);
   ellipseMode(CORNER);
   randomSeed(second());
   frameRate(30); 
}

int d = 20, x, y, vx = 10, vy = 10;
void draw() {
	switch(status) {
	case IDLE:
		x = int(random(width - d));
		y = int(random(height -d));
		background(255);
		if(mouseButton == LEFT){
			status = GAME;
		}
	break;

	case GAME:
		background(255);
		if (mouseX > 250) {
			rect(250, 380, 80, 20);
		}
		rect(mouseX, 380, 80, 20);

		ellipse(x, y, d, d);
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
		if (y < 0 || (mouseX < x && x < mouseX + 80 && y + d > height - 20) || y + d > height) {
			vy *= -1;
			if (y < 0) {
				y *= -1;
			}else if (mouseX < x && x < mouseX + 80 && y + d > height - 20) {
				y = 2 * (height - 20 - d) - y;
			}else if (y + d > height){
				status = IDLE;
				break;
			}
		}
		if(mouseButton == RIGHT){
			status = IDLE;
		}
        
		break;
	}
}
