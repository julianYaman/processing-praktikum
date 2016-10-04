void setup(){
  
  //Window Setup
  size(1280,720);
  
}


//Window Size var
float windowHeight = 720;
float windowWidth = 1280;

// ******* Calculation Variablen ******

  //Hasen und Geburtenrate
  float rabbits;
  float comingRabbits = 0.2;
  
  //Füchse und Geburtenrate 
  float foxes;
  float comingFoxes = 0.18;
  
  //Sterbevariablen
  //Jedes Jahr wird x Hase pro Fuchs gegessen.
  float eatenRabbitsPerFox;

// ******* Calculation Variablen ******

//Populationssiumlation
public void population(){

  // i = Jahr
  for(float i = 0; i < 100; i++){
    
    
    //Geborene Hasen und Füchse je nach Geburtenrate
    float childRabbits = rabbits / 2.0 * comingRabbits;
    float childFoxes = foxes / 2.0 * comingFoxes;
    
    //Gesamtzahl aller Hasen und Füchse nach einer Geburtsphase
    rabbits = childRabbits + rabbits; //<>//
    foxes = childFoxes + foxes; //<>//
    
    //Hasenbestand: Hasen - Gegessene Hasen z.B.(2 Füchse * 3 Hasen) = 6 Gegessene Hasen
    //1 Fuchs isst 3 Hasen. (eatenRabbits) Line 27
    
    
    //Anzahl der Hasen die die Füchse essen wollen
    float wishEatRabbits = foxes * eatenRabbitsPerFox;
    
    
    //Anzahl an Hasen die man essen kann und Anzahl der Hasen die nicht gegessen werden könenn.
    float rabbitsCanBeEaten = rabbits;
    float rabbitsWhoCannotBeEatenByFoxes = wishEatRabbits - rabbitsCanBeEaten;
    
    
    //Variablen, wieviele Füchse nicht essen können und wieviele tatsächlich essen können.
    float foxesWhoCannotEatRabbits = rabbitsWhoCannotBeEatenByFoxes / eatenRabbitsPerFox;
    float foxesCanEat = foxes - foxesWhoCannotEatRabbits;
    
    
    //Abfrage ob Fuchsanzahl die essen kann größer ist als die aktuelle Fuchsanzahl
    if(foxesCanEat <= foxes){
      
      //Fuchsanzahl wird mit der Anzahl der Füchse die nicht essen könne subtrahiert.
      foxes = foxes - foxesWhoCannotEatRabbits;
      
      //Hasenanzahl minus die Anzahl an Hasen die von den Füchsen, welche essen können, gegessen werden.
      rabbits = rabbits - (foxesCanEat * 3);
    }
    

    
    //Graph für die Hasen
    stroke(50,200,255);
    strokeWeight(2);
    line(i * 13 ,0,i * 13,rabbits);
    
    
    //Graph für die Füchse
    stroke(50,255,0);
    strokeWeight(2);
    line(i * 12.5 ,0,i * 12.5,foxes);
    
    
    //Konsolenausgabe
    if(2016 + round(i) == 2016){
      println("        ");
      println("|##########################|");
      println("|~~ For-Schleife beginnt ~~|");
      println("|##########################|");
      println("         ");
      println("         ");
      println("> Jahr: " + round(2016 + i));
      println("Hasen: " + round(rabbits) + " | Füchse: " + round(foxes));
      println("Wunsch: " + round(wishEatRabbits) + " | Tatsächliche Bedarfszahl: " + round(foxesCanEat * 3));
      println("         ");
    }else{
      println("> Jahr: " + round(2016 + i));
      println("Hasen: " + round(rabbits) + " | Füchse: " + round(foxes));
      println("Wunsch: " + round(wishEatRabbits) + " | Tatsächliche Bedarfszahl: " + round(foxesCanEat * 3) + " -- " + foxesCanEat);
      println("         ");    
    }
     
  }
  
}

void draw(){

  //Anfangszahlen im Jahr 0 bevor die Geburtsphase anfängt
  
  rabbits = 8;
  foxes = 2;
  eatenRabbitsPerFox = 3;
  
  background(50,50,50);
  
  //Populationssimulation wird gestartet
  population();
  

}