//Rogelio Gonzalez

ArrayList<PVector> pincel = new ArrayList<PVector>();
PFont font;
int posX=0, posY=100;

void setup() {
  size(700, 700);
  mouseX=width/2;
  mouseY=height/2;
  for (int i=0;i<7;i++) {
    pincel.add(new PVector(mouseX, mouseY, 0));
  }
  background(255);
  smooth(10);
}

void draw() {
  frameRate(12);
  fill(random(255), random(255), random(255), 100);
  strokeWeight(1);
 //Usage of Shape
  
  beginShape();
  vertex(pincel.get(0).x, pincel.get(0).y);
  bezierVertex(pincel.get(1).x, pincel.get(1).y, 
  pincel.get(2).x, pincel.get(2).y, 
  pincel.get(3).x, pincel.get(3).y);
  bezierVertex(pincel.get(4).x, pincel.get(4).y, 
  pincel.get(5).x, pincel.get(5).y, 
  pincel.get(6).x, pincel.get(6).y);
  endShape();
  
  pincel.remove(0);
  pincel.add(new PVector(mouseX, mouseY, 0));
  
 if(mousePressed){
   font = createFont("Times", 32, true);
   textFont(font, 32);
   int s= 1+int(random(324));
   text("TEC", posX, posY);
    posX+=s/4;
    if(posX>width) {
      posX=0;
      posY=(posY+60)%height;
    }
 }
 
 if (keyPressed){
   
   switch(keyCode) {
  case UP: 
    fill(random(255),random(255),random(255),random(20));
    ellipse(mouseX-(random(10,70)),mouseY-(random(100)),100,100);  // Does not execute
    break;
  case DOWN: 
   fill(random(255),random(255),random(255),random(20));
   quad(pmouseX,pmouseY,mouseX,mouseY-100,mouseX,mouseY,pmouseX+50,pmouseY+50);
    break;
  default:
    break;
}
   
   
 }
  
  
}