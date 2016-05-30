// @author: Tomas de Camino Beck
// Editado por Gustavo Richmond
// Dinamic array use

int r = 0;
int clik = 0;
float coordx1 = 0;
float coordy1 = 0;
float coordx2 = 0;
float coordy2 = 0;
float coordx3 = 0;
float coordy3 = 0;
float coordx4 = 0;
float coordy4 = 0;

void setup() {
  size(1000, 1000);
}

void draw() {
  frameRate(20);
  background(#C9C7B5);
  r += 1;

  if (clik >= 1){
    fill(0, 0, 100, 100);
    noStroke();
    ellipse(coordx1, coordy1, 400*sin(PI*r/100), 400*sin(PI*r/100));
    noStroke();
    //noFill();
    }
  if (clik >= 2){
    fill(0, 100, 0, 100);
    stroke(100);
    ellipse(coordx2, coordy2, 400*sin(PI*r/100), 400*sin(PI*r/100));
    //noFill();
    }
  if (clik >= 3){
     stroke(255);
     fill(100, 0, 0, 100);
     ellipse(coordx3, coordy3, 400*sin(PI*r/100), 400*sin(PI*r/100));
    }
  if (clik >= 4){
    stroke(0);
    fill(100, 0, 100, 100);
    ellipse(coordx4, coordy4, 400*sin(PI*r/100), 400*sin(PI*r/100));
    //noFill();
    }
  }

void mouseClicked() {
  if (clik == 0){
    clik += 1;
    coordx1 = mouseX;
    coordy1 = mouseY;
    }
      else if (clik == 1){
    clik += 1;
    coordx2 = mouseX;
    coordy2 = mouseY;
    }
          else if (clik == 2){
    clik += 1;
    coordx3 = mouseX;
    coordy3 = mouseY;
    }
              else if (clik == 3){
    clik += 1;
    coordx4 = mouseX;
    coordy4 = mouseY;
    }
}