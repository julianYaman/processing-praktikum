void setup(){

  size (1280,720);
  
  //Konsolenausgaben
  println("Zweiter Sketch wird gestartet...");
  println("   ");
  println("   ");
  println("   ");
  println("   ");
  println("************************");
  println("*#######*------*#######*");
  println("*##* Zweiter Sketch *##*");
  println("*##*   gestartet    *##*");
  println("*#######*------*#######*");
  println("************************");
  
}

//Fensterbreite
float windowWidth = 1280;
float windowHeight = 720;

//Halbwerte
float halfWidth = windowWidth / 2;
float halfHeight = windowHeight / 2;

// Nullpunkt-Achsenwerte
float zeroPoint_x = 100; 
float zeroPoint_y = 650;

//Linienwerter
float lineEnd = windowWidth - zeroPoint_x;
float lineStart = -zeroPoint_x;

//Bug fixed. 
public void parabel(){
  
    strokeWeight(2);
    stroke(255,50,0);
    
    float x; //<>//
    float y; //<>//
 //<>//
    for(float i = lineStart; i < zeroPoint_y; i++){  //<>//
      
      x = i;
      //### Editing float ###
      y = pow(x, 2) * -0.01;
      
      //y-Position von x - 1
      float previousYpos = pow(x-1, 2) * -0.01;
      
      float xPos1 = x + zeroPoint_x - 1; 
      float yPos1 = previousYpos + zeroPoint_y;  //<>//
      float xPos2 = x + zeroPoint_x;  
      float yPos2 = y + zeroPoint_y;  
      
      line(xPos1,yPos1,xPos2,yPos2);
      
      
    }

}
 //<>//
public void linie2() {
    strokeWeight(2);
    stroke(100, 90, 3); //<>//
    float prev_x = lineStart; 
    float prev_y = 0; 
    float x;
    float y;
    
    
    for(float i = lineStart; i < lineEnd; i++) {
      x = i;
      //##############################
      y = -x;
      //##############################
      prev_x = x;
      prev_y = y;
      
      float xPos1 = prev_x + zeroPoint_x;
      float yPos1 = prev_y + zeroPoint_y;
      float xPos2 = x + zeroPoint_x;
      float yPos2 = y + zeroPoint_y;
      
      line(xPos1,yPos1,xPos2,yPos2);
      
    }
}


public void linie4() {
    strokeWeight(2);
    stroke(200, 90, 3);
    float prev_x = 0; 
    float prev_y = 0; 
    float x;
    float y;

    
    for(float i = lineStart; i < lineEnd; i++) {
      x = i;
      //##############################
      y = x;
      //##############################
      prev_x = x;
      prev_y = y;
      
      float xPos1 = prev_x + zeroPoint_x;
      float yPos1 = prev_y + zeroPoint_y;
      float xPos2 = x + zeroPoint_x;
      float yPos2 = y + zeroPoint_y;
      
      line(xPos1,yPos1,xPos2,yPos2);
      
    }
}

// X-Achse
public void xLinie() {
    strokeWeight(3);
    stroke(200, 250, 3);
    float prev_x = 0; 
    float prev_y = 0; 
    float x;
    float y;
    
    textSize(23);
    text("x", zeroPoint_x * 1.95, zeroPoint_y - 10); 
    
    for(float i = lineStart; i < lineEnd; i++) {
      x = i;
      //##############################
      y = 0;      
      //##############################
      prev_x = x;
      prev_y = y;
      
      float xPos1 = prev_x + zeroPoint_x;
      float yPos1 = prev_y + zeroPoint_y;
      float xPos2 = x + zeroPoint_x;
      float yPos2 = y + zeroPoint_y;
      
      line(xPos1,yPos1,xPos2,yPos2);
      
    }
}

// Y-Achse
public void yLinie() {
    strokeWeight(3);
    stroke(200, 250, 3);
    float prev_y = 0; 
    float x;
    float y;
    
    textSize(23);
    text("y", zeroPoint_x + 10, zeroPoint_y * .03); 
    
    for(float i = lineStart; i < lineEnd; i++) {
      x = halfWidth;
      //##############################
      y = i;      
      //##############################
      prev_y = y;
      
      float yPos1 = prev_y + zeroPoint_y;
      float yPos2 = y + lineStart;
      
      line(x, yPos1, x, yPos2);
      
    }
}

//Nullpunkt
public void draw_zeroPoint(){
    strokeWeight(10);
    stroke(240, 90, 3);
  
    float x;
    float y;
    
   
    x = zeroPoint_x;
    //##############################
    y = zeroPoint_y;      
    //##############################
      
    line(x, y, x, y);
    textSize(24);
    text("Nullpunkt", x + 10, y + 30); 

  
}



void draw() {
  background(44, 62, 80);
  
  parabel();
  
  //Lineare Gleichungsmethoden werden aufgerufen
  linie2();
  linie4();
  
  //X-Achse - Methode
  xLinie();
  //Y-Achse - Methode
  yLinie();
  
  //Nullpunkt anzeigen
  draw_zeroPoint();
  

  
  
}