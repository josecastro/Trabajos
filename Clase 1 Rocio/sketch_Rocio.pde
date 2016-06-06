//Rocío Quiros

void setup() {
  size(600, 600);
  background(255);
}

void draw() {
  
  noFill();
  //bezier(mouseX,mouseY, random(500),random(500),random(550),random(500),random(500),random(500));
  fill(250,150,100,100);
  strokeWeight(5);
  stroke(0, 150);
  //frameRate(2);
  drawCircles(random(width), random(height), 5,(int)random(15,45));
  drawfigura2(mouseX, mouseY, 2,(int)random(15,45),(int)random(50,70));
  drawfigura(random(width), random(height), 3,(int)random(15,45),(int)random(50,70));
  
}
//Realiza una convinación de triangulos que se crean de manera Random
void drawCircles(float x, float y, int n,int b) {
  //noStroke(); 
  fill(250,150,100,100);
  for (int i=n;i>0;i--) {
    ellipse(x, y-(i%2*n/2), b*i, b*i);
  }
}

//Realiza una convinación de triangulos que se crean de manera Random
void drawfigura(float x, float y, int n,int b, int c) {
  frameRate(1);
  fill(100,150,100,100);
  noStroke(); 
  for (int i=n;i>0;i--) {
    triangle(x, y-(i%2*n/2), b*i, b*i,n*i,c);
  }}
  
    //Realiza la creación de líneas en donde lo indique el mouse
  void drawfigura2(float x, float y, int n,int b, int c) {
  fill(250,150,100,50);
  frameRate(5);
  for (int i=n;i>0;i--) {
    line(x, y, n+b,c);
  }
  }
  

 