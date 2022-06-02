size(3000, 300);
background(255);
stroke(0);

fill(#FFFF00);

for(int j = 0; j < 5; ++j){
    beginShape();
        for (int i = 0; i < 5; ++i) {
                vertex((j+1) * width/10 + 100 * cos(radians(144 * i - 90)), height/2 + 100 * sin(radians(144 * i - 90)));
        }
    endShape(CLOSE);
}