String s = new String("Welcome to Programming and Exercises Class!!");
void setup(){
  size(600, 600);
  textFont(createFont("Harrington", 24));
  colorMode(HSB, s.length() - 1);
}

void draw(){
  background(s.length() - 1);
  int offset = 0;
  for(int i = 0; i < s.length(); i++){
    fill(i, s.length() - 1, s.length() - 1);
    text(s.charAt(i), (width - textWidth(s)) / 2 + offset, height / 2 + i);
    offset += textWidth(s.charAt(i));
  }
}
  text(s.charAt(0), (width - textWidth(s)) / 2 + offset, k++ - 0);
  offset += textWidth(s.charAt(0));
  text(s.charAt(1), (width - textWidth(s)) / 2 + offset, k++ - 50);
  offset += textWidth(s.charAt(1));
  text(s.charAt(2), (width - textWidth(s)) / 2 + offset, k++ - 100);