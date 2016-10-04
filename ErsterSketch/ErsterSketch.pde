void setup() {
  size(1280, 720);


  println("Erster Sketch");

}

void draw() {
  background(44, 62, 80);
  
  // Konstanten
  float windowWidth = 1280;
  float windowHeight = 720;
  float translateY = 372;
  float curveHeight = 180;
  float inc = TWO_PI/150.0;
  float prev_x = 0, prev_y = translateY, x, y;
  
  
  
  
  //x-Achse (Nulllinie)
  strokeWeight(3);
  stroke(52, 152, 219);
  line(0, translateY, windowWidth, translateY);
  
  
  
  
 
  
  // Horizontale Linien
  strokeWeight(1);
  for(float i = -5; i < 10; i = i + 1){
    stroke(41, 128, 185);
    float hY = i * curveHeight / 2 + translateY;
    line(0, hY, windowWidth, hY); //<>//
  }
  
  
  
  // line(0, translateY - curveHeight / 2, windowWidth, translateY - curveHeight / 2);
  
  
  //Horizontale Matheheftlinien
  for(float i = 0; i < windowHeight; i = i + 10){
    stroke(236, 240, 241, 30);
    float hmY = i * windowHeight / 3 + translateY;
    line(0, hmY, windowWidth, hmY);
  }
  
  //Vertikale Matheheftlinien
  for(float i = 0; i < windowWidth; i = i + 10){
    stroke(236, 240, 241, 30);
    line(i, 0, i, windowHeight);

  }
  
  //Sinus-Kurve
  strokeWeight(2);
  stroke(223, 90, 73);
  for(int i = 0; i < windowWidth; i++) {
    x = i;
    y = translateY + sin(i*inc) * curveHeight / 2;
    line(prev_x, prev_y, x, y);
    prev_x = x;
    prev_y = y;
    
  }
   //<>//
  

  
    



}