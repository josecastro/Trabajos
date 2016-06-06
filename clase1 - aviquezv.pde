//Ejemplo en clase modificado por Andres Viquez 
void setup() {
  size(600, 600);
  smooth(8);
}

void draw() {
  background(255);
  stroke(0, 100);

  strokeWeight(10);

  float l=map(random(50) + 200, 0, width, 1, 200); // linea modificada
  float s =map(random(50) + 200, 0, height, 10, 300); // linea modificada

  float a=0; 
  translate(width/2, height/2);
  for (int i=0; i<l; i++) {
    pushMatrix();
    rotate(a); 
    line(0, 0, s, 0);
    line(100, 100, s, 100); //nueva linea
    line(150, 100, s, 150); //nueva linea
    popMatrix();
    a+=TWO_PI/l;
  }
}