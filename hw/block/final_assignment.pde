int gseq;  //ゲームの流れ管理
int px = 280;
int py = 500;
int pw = 40;
int ph = 20;
int[] o1x = new int[2];
int o1y = 0;
int[] o1w = new int[2];
int o1h = 600;
int[] o2x = new int[24];
int[] o2y = new int[24];
int[] o2w = new int[24];
int[] o2h = new int[24];
int[] num = new int[24];
int mcnt;  //メッセージ用カウンタ
int time0 = 0; //基準時間
int time; 
int timescore;
int highscore = 0;
PImage title;

void setup(){
  size(600, 600);
  noStroke();
  gameInit();
  imgLoad();
}

void draw(){
  background(0);
  if(gseq == 0){                  //gseqが0：タイトル画面
    gameTitle();
  } else if(gseq == 1){           //gseqが1：スタート画面
    gameStart();
  } else if(gseq == 2){           //gseqが2：ゲームプレイ
    gamePlay();
  } else {                        //gseqが3：ゲームオーバー
    gameOver();
  }
}

void gameInit(){
  if(gseq == 3){  //ゲームオーバ時はスタート画面に
    gseq = 1;
  } else {        //プログラム実行時タイトル画面に
    gseq = 0;
  }
  for(int i = 0; i < 2; i++){
    obj1Init(i);
  }
  for(int i = 0; i < 24; i++){
    obj2Init(i);
  }
  mcnt = 0;
  timescore = 0;
}

void obj1Init(int no){
  o1w[no] = 20;                        //o1w[0]：左の壁の幅、o1w[1]：右の壁の幅
  o1x[no] = no * (width - o1w[no]);    //o1x[0]：左の壁のx座標、o1x[1]：右の壁のx座標
}

void obj2Init(int no){
  o2w[no] = int(random(10,40));
  o2h[no] = int(random(10,70));
  if(time < 30){
    o2w[no] = int(random(30,100));
    o2h[no] = int(random(30,70));
  }
  num[no] = int(random(3));
  if(num[no] == 0){
    o2x[no] = o1w[0];                 //左の壁に接するようなブロック
  } else if(num[no] == 1){
    o2x[no] = o1x[1] - o2w[no];       //右の壁に接するようなブロック
  } else {
    o2x[no] = int(random(240,320));   //どちらの壁にも接しないブロック
    if(time < 30){
      o2x[no] = int(random(200,300));
    }
  } 
  if((no%24) == 0 || (no%24) == 1 || (no%24) == 2){      //noは0から23なので24で割ると余りは0から23
    o2y[no] = -o2h[no];
  } else if((no%24) == 3 || (no%24) == 4 || (no%24) == 5){
    o2y[no] =  -o2h[no] - int(random(80,600));
  } else if((no%24) == 6 || (no%24) == 7 || (no%24) == 8){
    o2y[no] =  -o2h[no] - int(random(160,600));
  } else if((no%24) == 9 || (no%24) == 10 || (no%24) == 11){
    o2y[no] =  -o2h[no] - int(random(240,600));
  } else if((no%24) == 12 || (no%24) == 13 || (no%24) == 14){
    o2y[no] =  -o2h[no] - int(random(320,600));
  } else if((no%24) == 15 || (no%24) == 16 || (no%24) == 17){
    o2y[no] =  -o2h[no] - int(random(400,600));
  } else if((no%24) == 18 || (no%24) == 19 || (no%24) == 20){
    o2y[no] =  -o2h[no] - int(random(480,600));
  } else {
    o2y[no] =  -o2h[no] - int(random(560,600));
  }
}

void gameTitle(){
  image(title, 0, 0, 600, 600); 
  mcnt++;
  if((mcnt%60) < 50){
    textSize(30);
    textAlign(CENTER);
    fill(200, 250, 150);
    text("Click to view the start screen", width/2, 380);
  }
  textSize(25);
  fill(255);
  text("Press any key to exit", width/2, 590);
}

void gameStart(){
  playerDisp();
  playerMove();
  obj1Disp();
  timeDisp();
  mcnt++;
  if((mcnt%60) < 40){
    textSize(30);
    textAlign(CENTER);
    fill(20, 100, 100);
    text("Click to start", width/2, 570);
  }
}

void gamePlay(){
  playerDisp();
  playerMove();
  obj1Disp();
  obj1Move();
  obj2Disp();
  obj2Move();
  hitcheck();
  timeDisp();
}

void gameOver(){
  playerDisp();
  obj1Disp();
  obj2Disp();
  textAlign(CENTER);
  textSize(75);
  fill(255, 255, 0);
  text("GAME OVER", width/2, 300);
  mcnt++;
  if((mcnt%60) < 40){  //フレームレート:デフォルト60fps
    textSize(30);
    fill(255,170,200);
    text("Click to retry !", width/2, 500);
  }
  textSize(20);
  fill(255);
  text("Press any key to view the title screen", width/2, 590);
  scoreDisp();
}

void playerDisp(){
  fill(255);
  rect(px, py, pw, ph, 5);
}

void playerMove(){
  px = mouseX - (pw/2);
  if(gseq == 1){          //ゲーム開始時いきなりゲームオーバーにしないため
    if((px < o1x[0] + o1w[0]) || (px + pw > o1x[1])){
      px = 280;
    }
  } else if(gseq == 2){
    if(px < o1x[0] + o1w[0]){
      px = o1x[0] + o1w[0];
    } else if(px + pw > o1x[1]){
      px = o1x[1] - pw;
    }
  }
}

void obj1Disp(){
  fill(0, 255, 0);
  for(int i = 0; i < 2; i++){
    rect(o1x[i], o1y, o1w[i], o1h);
  }
}

void obj1Move(){
  if(time > 10 && time <= 20){
    o1w[0] += 1;
    o1w[1] += 1;
    o1x[1] -= 1;
    if(o1w[0] > 50 && o1w[1] > 50){
      o1w[0] = 50;
      o1w[1] = 50;
      o1x[1] = width - o1w[1];
    }
  }
  if(time > 20 && time <= 30){
    o1w[0] += 1;
    o1w[1] += 1;
    o1x[1] -= 1;
    if(o1w[0] > 100 && o1w[1] > 100){
      o1w[0] = 100;
      o1w[1] = 100;
      o1x[1] = width - o1w[1];
    }
  }
  if(time > 30 && time <= 40){
    o1w[0] += 1;
    o1w[1] += 1;
    o1x[1] -= 1;
    if(o1w[0] > 150 && o1w[1] > 150){
      o1w[0] = 150;
      o1w[1] = 150;
      o1x[1] = width - o1w[1];
    }
  }
  if(time > 40 && time <= 50){
    o1w[0] += 1;
    o1w[1] += 1;
    o1x[1] -= 1;
    if(o1w[0] > 200 && o1w[1] > 200){
      o1w[0] = 200;
      o1w[1] = 200;
      o1x[1] = width - o1w[1];
    }
  }
}

void obj2Disp(){
  fill(0, 255, 0);
  for(int i = 0; i < 24; i++){
    rect(o2x[i], o2y[i], o2w[i], o2h[i]);
  }
}

void obj2Move(){
  for(int i = 0; i < 24; i++){
    o2y[i] += 2;
    if(time > 60 && time <= 80){
      o2y[i] += 3;
    } else if(time > 80 && time <= 100){
      o2y[i] += 4;
    } else if(time > 100){
      o2y[i] += int(random(5,7));
    }
    if(o2y[i] > height){
      obj2Init(i);
    }
  }  
}

void hitcheck(){
  if((px <= o1x[0] + o1w[0]) || (px + pw >= o1x[1])){
    gseq = 3;
  }
  for(int i = 0; i < 24; i++){
    if((px < o2x[i]+o2w[i]) && ((px+pw) > o2x[i]) && (py < (o2y[i]+o2h[i])) && ((py+ph) > o2y[i])){
      gseq = 3;
    }
  }
}

void timeDisp(){
  textSize(24);
  textAlign(LEFT);
  fill(240, 100, 60);
  text("Time:" + time, 0, 25);
  if(gseq == 1){  //タイトル画面では時間は常に0
    time = 0;
  } else if(gseq == 2){  //ゲームプレイ状態
    time = millis()/1000 - time0;
  } else {
    timescore = time;
    if(timescore > highscore){
      highscore = timescore;
    }
  }
}

void scoreDisp(){
  fill(40, 190, 20);
  textSize(40);
  text("Time Score:" + timescore, width/2, 360); 
  fill(100, 160, 230);
  textSize(30);
  text("Best Record:" + highscore, width/2, 400);
}

void imgLoad(){
  title = loadImage("title.png");
}

void mousePressed(){
  if(gseq == 0){  //タイトル画面からスタート画面へ
    gseq = 1;
  } else if(gseq == 1){  //スタート画面からゲームプレイへ
    gseq = 2;
    time0 = millis()/1000;
  }
  if(gseq == 3){ 
    gameInit();
  }
}

void keyPressed(){
  if(gseq == 0){  // タイトル画面からゲーム終了（プログラム終了）へ
    exit();
  }
  if(gseq == 3){  //ゲームオーバー画面からタイトル画面へ
    gseq = 0;
    gameInit();
  }
}
