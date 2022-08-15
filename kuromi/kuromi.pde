size(1000, 1000);
background(255);
smooth();

/*外枠*/

//楕円塗りつぶし
stroke(30, 30, 30);
strokeWeight(15);
fill(50, 50, 50);
ellipse(500, 650, 800, 650);
//顔面おしろい
fill(255);
stroke(255);
beginShape();
    vertex(350, 650);
    vertex(500, 710);
    vertex(650, 650);
    vertex(750, 900);
    vertex(250, 900);
endShape(CLOSE);
//眉毛
stroke(30, 30, 30);
line(350, 648, 500, 705);
line(650, 648, 500, 705);
//顎おしろい
fill(255);
stroke(255);
bezier(250, 900, 500, 1000, 500, 1000, 750, 900);
//頬の輪郭
fill(255);
stroke(30, 30, 30);
bezier(260, 910, 150, 750, 250, 675, 350, 645);
bezier(745, 905, 850, 750, 750, 675, 650, 645);
//耳
fill(50, 50, 50);
stroke(30, 30, 30);
beginShape();
    vertex(340, 350);
    vertex(360, 280);
    vertex(100, 100);
    vertex(120, 420);
    vertex(190, 440);
endShape();
beginShape();
    vertex(660, 350);
    vertex(640, 280);
    vertex(900, 100);
    vertex(880, 420);
    vertex(810, 440);
endShape();
//耳先端円
ellipse(90, 80, 60, 60);
ellipse(910, 80, 60, 60);
//改めて外枠
noFill();
ellipse(500, 650, 800, 650);

/*顔面*/

//鼻
fill(255, 112, 165);
stroke(20, 20, 20);
ellipse(500, 850, 55, 35);

//目
fill(30, 30, 30);
// stroke(255, 102, 0);
// line(40, 40, 20, 120);
// line(80, 60, 80, 120);
//line(350, 648, 500, 705);
//line(650, 648, 500, 705);
bezier(40, 40, 20, 120, 80, 120, 80, 60);
bezier(350, 755, 340, 870, 290, 840, 300, 735);

// まつげ
noFill();
strokeWeight(10);
line(30, 35, 40, 45);
bezier(350, 750, 310, 740, 290, 730, 280, 710);
line(30, 50, 40, 60);


