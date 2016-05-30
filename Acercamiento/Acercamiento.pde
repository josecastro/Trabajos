//Allan Rodríguez
void setup() {
  size(600, 600);
  smooth(8);
  shapeMode(CORNER);
}

void draw() {
  //define background color
  background(255);

  //line weight and color
  strokeWeight(10);

  //Input from the mouse
  //map to real values
  float l=map(mouseX, 0, width, 1, 200); //numre of lines
  float s =map(mouseY, 0, height, 10, 300);//length of lines

  float a=0; //angle between lines
  translate(mouseX, mouseX);//move coordinate system
  for (int i=0; i<l; i++) {
    int modulo =i % 3; 
    switch(modulo){
      case 0:
        stroke(#39A590, 100);
        break;
       case 1:
        stroke(#AD55A7, 100);
        break;
      case 2:
        stroke(#3B34A7, 100);
        break;
    }
    pushMatrix();//guarda la posicion actual de las coordenadas x y y
    rotate(a); //rotate line by a degress
    line(0, 0, s, 0);
    popMatrix();//saca la posicion actual de las coordenadas x y y
    a+=TWO_PI/l;//caculate angle for new line
  }
}