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
  float comingRabbits = 0.3;
  
  //Füchse und Geburtenrate foxesWantEat
  float foxes;
  float comingFoxes = 0.5;
  
  //Sterbevariablen
  //Jedes Jahr wird x Hase pro Fuchs gegessen.
  float eatenRabbitsPerFox = 1;
  
  //Berechnung bis zum Jahr x
  float years = 10;
  
  float n = 10;

// ******* Calculation Variablen ******

//Populationssiumlation
public void population(){
  
  
  for(float i = 0; i < years; i++){
  
    
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
    
    float foxesCanCatch = (foxes / n) * (rabbits / n);
    
    float foxesCanEat;
    
    if(foxesWantEat < rabbits){
      
      foxesCanEat = foxesWantEat;
      
      rabbits = rabbits - foxesCanEat;
      
      
    }else{
    
      float foxesDie = (foxesWantEat / eatenRabbitsPerFox) - rabbits;
      
      foxes = foxes - foxesDie;
      foxesCanEat = foxes;
      
      
      rabbits = rabbits - foxesCanEat;
      
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
    line(i * 5 , windowHeight , i * 5 , rabbits);
    
    
    //Graph für die Füchse
    stroke(50,255,0);
    strokeWeight(1);
    line(i * 5 + 1 , 0 , i * 5 + 1, foxes);
    
    
    //Konsolenausgabe
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
    println("Erwischt: " + foxesCanEat);
    println("Sie hätten -> " + foxesCanCatch + " <- erwischen können.");
    println("Endstand: Hasen: " + rabbits + " | Füchse: " + foxes);
    println("         ");
    println("---------");
    println("         ");
     
  }
  
}

void draw(){

  //Anfangszahlen im Jahr 0 bevor die Geburtsphase anfängt
  
  rabbits = 100;
  foxes = 10;
  
  background(50,50,50);
  
  //Populationssimulation wird gestartet
  population();
  

}