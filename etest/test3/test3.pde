String s = new String("Welcome to Programming and Exercises Class!!");
int x;
void setup(){
  size(600, 100);
  textFont(createFont("Harrington", 24));
  fill(255, 0, 255);
  x = width;
}

void draw(){
  background(255);
  text(s, x--, height / 2);
  if(x + textWidth(s) < 0) x = width;
}
