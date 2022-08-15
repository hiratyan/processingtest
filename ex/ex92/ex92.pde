void setup(){
	size(400, 800);
	background(255);
	smooth();
	noStroke();
	fill(255, 0, 0);
}

void draw(){
	background(255);
	if (mouseX > 350) {
		rect(350, 780, 50, 20);
	}
	rect(mouseX, 780, 50, 20);
}