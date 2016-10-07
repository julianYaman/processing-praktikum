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
  float comingRabbits = 0.25;
  
  //Füchse und Geburtenrate foxesWantEat
  float foxes;
  float comingFoxes = 0.2;
  
  //Sterbevariablen
  //Jedes Jahr wird x Hase pro Fuchs gegessen.
  float eatenRabbitsPerFox = 2;
  
  //Berechnung bis zum Jahr x
  float years = 500;
  
  float n = 202.5;
  
  float timeInterval = 10;
  float graphFac = 1;

// ******* Calculation Variablen ******

//Populationssiumlation
public void population(){
  
  
  for(float i = 0; i < years; i= i + timeInterval){
  
    
    //Calculation
    
    //Wunschvorstellung der Füchse, wieviele Hasen sie essen wollen
    
    
    float rabbitsAtBeginning = rabbits;
    float foxesAtBeginning = foxes;
    
    //Soviele Hasen / Füchse werden geboren
    float bornRabbits = (rabbits / 2) * comingRabbits;
    float bornFoxes = (foxes / 2) * comingFoxes;
    
    //Geborene Hasen und Füchse werden dazuaddiert.
    foxes = foxes + bornFoxes;
    rabbits = rabbits + bornRabbits;
    
    float foxesWantEat = foxes * eatenRabbitsPerFox;
    
    float foxesCanCatch = n / foxes * rabbits;
   
    float foxesCanEat = min(rabbits, min(foxesWantEat, foxesCanCatch));
    
    rabbits = rabbits - foxesCanEat;
    float foxesSaturated = foxesCanEat / eatenRabbitsPerFox;
    
    
    if (foxesSaturated < foxes){
      foxes = foxesSaturated;
    }else{
      println("Hey!!!");      
    }
    
    //Um negative Rechnungen zu vermeiden
    if(foxes < 0){
      foxes = 0;
    }
    if(rabbits < 0){
      rabbits = 0;
    }
    
    


    
 //<>//

    
    //Graph für die Hasen
    stroke(50,200,255);
    strokeWeight(1);
    line(i * graphFac , windowHeight , i * graphFac , windowHeight-rabbits);
    
    
    //Graph für die Füchse
    stroke(50,255,0);
    strokeWeight(1);
    line(i * graphFac + 1 , windowHeight , i * graphFac + 1, windowHeight-foxes);
    
    
    ////Konsolenausgabe
    if(2016 + round(i) == 2016){
      println("        ");
      println("|##########################|");
      println("|~~ For-Schleife beginnt ~~|");
      println("|##########################|");
      println("         ");
      println("         ");
    }
    
    println("> Jahr: " + round(2016 + i));
    println("Anzahl an Hasen am Anfang des Jahres: " + rabbitsAtBeginning);
    println("Anzahl an Füchse am Anfang des Jahres: " + foxesAtBeginning);
    println("Geborene Hasen: " + bornRabbits + " (" + (bornRabbits + rabbitsAtBeginning) + ") | Geborene Füchse: " + bornFoxes + " (" + (bornFoxes + foxesAtBeginning) + ")");
    println("         ");
    println("Sie hätten -> " + foxesCanCatch + " <- erwischen können.");
    println("Gefuttert: " + foxesCanEat);   
    println("Endstand: Hasen: " + rabbits + " | Füchse: " + foxes);
    println("         ");
    println("---------");
    println("         ");
     
  }
  
}

void draw(){

  //Anfangszahlen im Jahr 0 bevor die Geburtsphase anfängt
  
  rabbits = 1000;
  foxes = 5;
  
  background(50,50,50);
  
  //Populationssimulation wird gestartet
  population();
  
  stroke(250,0,0);
  fill(50, 55, 100);
  rect(windowWidth - 150, 0, 150, 55, 0, 0, 0, 18);
  
  fill(255);
  textSize(16);
  text("Jahre: " + years, windowWidth - 140, 23); 
  text("Abstand: " + timeInterval, windowWidth - 140, 43); 
  

}