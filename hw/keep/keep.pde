String screen = "start"; //ゲーム画面を指定する番号．
//"start" はスタート画面，1"game" はゲーム画面．"end" は終了画面．
int d = 20, x = 0, y = 600, vx = 10, vy = 10;
int time_base = 0; //ゲーム時間を初期化するための変数
int time_limit = 20; //ゲーム時間
int time_left; //ゲーム残り時間
int score = 0; //スコア
boolean point[][] = new boolean[7][7]; //的の生存確認
boolean point_speed[][] = new boolean[5][5]; //スピードアップ的の生存確認

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
    randomSeed(second());
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
    for(int i = 0; i < 7;i++){
        for(int j = 0; j < 7;j++){
            point[i][j] = true;
        }
    }
    for(int i = 0; i < 5;i++){
        for(int j = 0; j < 5;j++){
            point_speed[i][j] = true;
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
    if (y < 0 || y + d > height) {
        vy *= -1;
        if (y < 0) {
            y *= -1;
        }else if (y + d > height) {
            y = 2 * (height - d) - y;
        }
    }

    //的
    for(int i = 0; i < 7; i++){
        for (int j = 0; j < 7; ++j) {
            point[0][j] = false;
            point[i][0] = false;
            if(point[i][j]){
                fill(0, 0, 255);
                ellipse(i * 150, j * 150, 10, 10);
            }
            if((x > i * 140 && x < i * 160) && (j * 140 < y && y < j * 160) && point[i][j]){
                point[i][j] = false;
                score++;
            }
        }
    }
    //スピードアップ的
    for(int i = 0; i < 5; i++){
        for (int j = 0; j < 5; ++j) {
            point_speed[0][j] = false;
            point_speed[i][0] = false;
            if(point_speed[i][j]){
                fill(0, 255, 0);
                ellipse(i * 250, j * 250, 10, 10);
            }
            if((x > i * 240 && x < i * 260) && (j * 240 < y && y < j * 260) && point_speed[i][j]){
                point_speed[i][j] = false;
                if (vx > 0) {
                    vx += 3;
                }
                if (vx < 0) {
                    vx -= 3;
                }
                if (vy > 0) {
                    vy += 3;
                }
                if (vy < 0) {
                    vy -= 3;
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
        vx = 10;//
        vy = 10;//速さの初期化
        screen = "game";
    } else if(screen == "game"){
        if(mouseButton == LEFT) {
            vx *= -1;
            vy *= 1;            
        }
        if(mouseButton == RIGHT){
            vx *= 1;
            vy *= -1;
        }

    } else if(screen == "end"){
        screen = "start";
    }
}
