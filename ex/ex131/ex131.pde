String s = new String("Welcome to Programming and Exercises Class!!");
void setup(){
  size(600, 100);
  textFont(createFont("Harrington", 24));
  colorMode(HSB);
}
int i= 0;
void draw(){
	background(255);
	fill(i, 255, 255);
    text(s, (width - textWidth(s)) / 2, height / 2);
	i++;
	if(i == 255) {
		i = 0;
	}
}