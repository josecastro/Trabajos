/* Primer draft de la curva de hilbert 3D
   1. mapKey, primitiva para mapear un numero binario a un punto en una maya 3D
      que va en orden de los puntos de la curva Hilbert de orden n, con m puntos.
      obtenido de http://www.dcs.bbk.ac.uk/TriStarp/pubs/JL1_00.pdf
      
   2. setColor: utilitario para cambiar de color
   
   3. drawCylinder: dibuja un cilindro con los extremos rendondeados.
 */

import processing.opengl.*;

long[] mapKey(long key[], long n, long m, long coord[])
{
  long ai;
  long rho_i;
  long Ji;
  long Oi;
  long Pi;
  long Jsum = 0;
  long Oi_bar;
  long Pi_bar = 0;
  long wi = 0;
  long mask = (1 << (m-1));

  int i;
  for (i = 0; i < n; ++i) { 
    coord[i] = 0;
  }

  for (i = 0; i < m; ++i)
  {
    // get the rho of the current iteration
    rho_i = key[i];

    // principal position calculation
    Ji = n;
    int j;
    for (j = 1; j < n; ++j)
      if ((rho_i >> j & 1) == (rho_i & 1))
        continue;
      else
        break;
    if (j != n)
      Ji -= j;

    Oi = rho_i ^ (rho_i / 2);

    if (rho_i < 3)
      Pi = 0;
    else
      if ((rho_i % 2) != 0)
        Pi = (rho_i-1) ^ ((rho_i-1)/2);
      else
        Pi = (rho_i-2) ^ ((rho_i-2)/2);

    wi = wi ^ Pi_bar;

    if (Jsum % n == 0)
    {
      Oi_bar = Oi;
      Pi_bar = Pi;
    } else
    {
      long temp1 = Oi >> (Jsum % n);
      long temp2 = Oi << (n - (Jsum % n));
      Oi_bar  = temp2 | temp1;
      Oi_bar &=((long)1 << n) - 1;

      temp1   = Pi >> (Jsum % n);
      temp2   = Pi << (n - (Jsum % n));
      Pi_bar  = temp1 | temp2;
      Pi_bar &=((long)1 << n) - 1;
    }
    Jsum += Ji - 1;
    ai = wi ^ Oi_bar;

    long maskt = 1 << (n-1);

    for (j = 0; j < n; ++j)
    {
      if ((ai & maskt) != 0)
        coord[j] |= mask;
      maskt >>= 1;
    }
    mask >>= 1;
  }
  return coord;
}

// utility function to put a color
// in open GL

void setColor(int index)
{
  switch (index) {
  case 1 : 
    fill(255, 0, 0); 
    break;
  case 2 : 
    fill(200, 0, 255); 
    break;
  case 3 : 
    fill(  0, 0, 255); 
    break;
  case 4 : 
    fill(  0, 0, 153); 
    break;
  case 5 : 
    fill(153, 153, 255); 
    break;
  case 6 : 
    fill(  0, 255, 255); 
    break;
  case 7 : 
    fill(128, 128, 128); 
    break;
  default: 
    fill(204, 204, 204); 
    break;
  }
}


// Draws a triangle using low-level OpenGL calls.

float x, y, z;

void setup() {
  size(640, 360, P3D);
  //background(0);
  //lights();
}

void draw() {
  background(0, 128, 255);
  lights();

  setColor(2);

  pushMatrix();    
  translate( 120, 120, 0 );
  rotateX( PI/6 );
  rotateY( radians( frameCount ) );
  rotateZ( radians( frameCount ) );
  drawCylinder( 20, 50, 100 );
  popMatrix();
}

void drawCylinder(int sides, float r, float h)
{
  float angle = 360 / sides;
  float halfHeight = h / 2;

  // draw top of the tube
  pushMatrix();
  translate(0,0,-halfHeight);
  sphere(r);
  popMatrix();

  // draw bottom of the tube
  pushMatrix();
  translate(0,0,halfHeight);
  sphere(r);
  popMatrix();

  // draw sides
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r;
    float y = sin( radians( i * angle ) ) * r;
    vertex( x, y, halfHeight);
    vertex( x, y, -halfHeight);
  }
  endShape(CLOSE);
}
