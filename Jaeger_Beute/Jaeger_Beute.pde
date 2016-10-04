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
  
  //Füchse und Geburtenrate 
  float foxes;
  float comingFoxes = 0.15;
  
  //Sterbevariablen
  //Jedes Jahr wird x Hase pro Fuchs gegessen.
  float eatenRabbitsPerFox = 3;
  
  //Berechnung bis zum Jahr x
  float years = 100;

// ******* Calculation Variablen ******

//Populationssiumlation
public void population(){
  
  
  for(float i = 0; i < years; i++){
  
    //Geborene Hasen und Füchse
    //Berechnung: Hälfe aller Hasen und Füchse ist Weiblich und bekommt das x-fache (coming..)
    //Bislang aber konstante Geburten, nicht abhängig ob viel/e oder wenig/e Beute / Räuber vorhanden sind. 
    float bornRabbits = (rabbits / 2.0) * comingRabbits;
    float bornFoxes = (foxes / 2.0) * comingFoxes;
    
    //Gesamtzahl nach den Geburten der Hasen und Füchse
    rabbits = bornRabbits + rabbits;
    foxes = bornFoxes + foxes;
    
    
    //Beute - Berechnung
    
    //Jeder Fuchs ist x Hasen pro Durchlauf
    //Dies ist der Wunschbedarf der Füchse
    float wishAmountOfRabbits = round(foxes) * eatenRabbitsPerFox;
    
    
    //Abfrage ob genug Hasen vorhanden sind um gegessen zu werden
    if(rabbits >= wishAmountOfRabbits){
      
      rabbits = round(rabbits) - wishAmountOfRabbits;
      
    }else{
      
    
      //Berechnung wird durchgeführt um zu schauen, wieviele
      //Füchse nicht esswen können. Diese Füchse werden demzufolge sterben.
      float foxesCanEat = round(rabbits) / 3;
      float foxesDieNoFood = round(foxes) - foxesCanEat;
      
      //x Füchse sterben da sie nicht essen können. Diese werden 
      //von den Füchsen subtrahiert.
      foxes = round(foxes) - foxesDieNoFood;
      
      //Hasen werden trotzdem gegessen, je nach Anzahl die sie überhaupt essen können
      rabbits = round(rabbits) - (foxesCanEat * 3);
      
      
    }
    
    
    //Füchse und Hasen können nicht mehr -1 werden und somit 
    //sind keine negativen Rechnungen mehr möglich.
    if(foxes <= 0){
      foxes = 0;
    }    
    if(rabbits <= 0){
      rabbits = 0;
    }
       //<>// //<>//

    
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
      println("Hasen: " + rabbits + " | Füchse: " + foxes);
      println("Wunsch: " + round(wishAmountOfRabbits) + " | Tatsächliche Bedarfszahl: " + round(foxes * 3));
      println("         ");
    }else{
      println("> Jahr: " + round(2016 + i));
      println("Hasen: " + rabbits + " | Füchse: " + foxes);
      println("Wunsch: " + round(wishAmountOfRabbits) + " | Tatsächliche Bedarfszahl: " + round(foxes * 3));
      println("         ");    
    }
     
  }
  
}

void draw(){

  //Anfangszahlen im Jahr 0 bevor die Geburtsphase anfängt
  
  rabbits = 25;
  foxes = 2;
  
  background(50,50,50);
  
  //Populationssimulation wird gestartet
  population();
  

}