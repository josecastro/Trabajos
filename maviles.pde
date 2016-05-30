//Mauricio Avilés
//Basado en el uso de curvas Bezier de Tomás de Camino
//Usa Perlin noise para ir cambiando colores y formas
//Con el clic del mouse cambian las formas aleatoriamente

float x1, y1, x2, y2;
float rd, gd, bd;

void setup() {
  fullScreen();
  background(0, 0, 0);
  x1 = random(500);
  y1 = random(500);
  x2 = random(500);
  y2 = random(500);
  rd = random(500);
  gd = random(500);
  bd = random(500);
  noStroke();
  mouseX = width / 2;
  mouseY = height / 2;
}

void draw() {
  fill(noise(x1) * 255, noise(y1) * 255, noise(x2) * 255, 2);
  rect(0, 0, width, height);
  fill(noise(rd) * 255, noise(gd) * 255, noise(bd) * 255, 90);
  if (mousePressed) {
    bezier(mouseX, mouseY, random(width), random(height), mouseX, mouseY, random(width), random(height));
  } else {
    bezier(mouseX, mouseY, noise(x1) * width, noise(y1) * height, mouseX, mouseY, noise(x2) * width, noise(y2) * height);
  }
  x1 += 0.01;
  y1 += 0.01;
  x2 += 0.01;
  y2 += 0.01;
  rd += 0.005;
  gd += 0.005;
  bd += 0.005;
}
