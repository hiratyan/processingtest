String s = new String("Welcome to Programming and Exercises Class!!");
int k;
void setup(){
  size(600, 600);
  textFont(createFont("Harrington", 24));
  fill(100, 100, 100);
  frameRate(10);
  k = 0;
}

void draw(){
  background(255);
  int offset = 0;
  text(s, (width - textWidth(s)) / 2, 20);
  for (int i = 0; i < s.length(); ++i) {
    text(s.charAt(i), (width - textWidth(s)) / 2 + offset, k++ - (50 * i));
    offset += textWidth(s.charAt(i));
  }
}