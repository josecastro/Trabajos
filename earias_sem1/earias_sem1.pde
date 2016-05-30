//Tomas de Camino Beck
// alterado por Esteban Arias M.

void setup() {
  size(600, 600);
  smooth(4);
}


void draw() {
  //define background color
  
  background(255);
  stroke(0, 100);

  //line weight and color
  //strokeWeight(5);
  int sw = frameCount % 10;
  strokeWeight(sw);

  //Input from the mouse
  //map to real values
  float l=map(mouseX, 0, width, 1, 200); //number of lines
  float s =map(mouseY, 0, height, 10, 250);//length of lines


  float a=0; //angle between lines
  //translate(width/2, height/2);//move coordinate system
  translate(mouseX, mouseY);//move coordinate system
  for (int i=0; i<l; i++) {
    //pushMatrix();
    rotate(a); //rotate line by a degress
    line(0, 0, s, 0);
    //stroke(i, s, 10);
    point(i, s);
    //stroke(random(255),random(255),random(255),10);
    //popMatrix();
    a+=TWO_PI/l;//caculate angle for new line
  }

}