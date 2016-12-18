class Burbuja {
  float x;
  float y;
  boolean dirx;
  boolean diry;
  int radio;
  float velocidad = 0;
  float aceleracion = 0;
  int velocidadmaxima = 8;
  float velocidadhorizontal = 1;

  Burbuja(float inicialX, float inicialY, boolean inicialdirX) {
    x = inicialX;
    y = inicialY;
    dirx = inicialdirX;
    diry = true; //al inicio siempre baja
    radio = 25;
  }

  void mover() {
    modificarvelocidad();
    if (dirx) x+=velocidadhorizontal;
    else x-=velocidadhorizontal;
    if (diry) y += velocidad;
    else y-=velocidad;

    comprobarlimites();
  }

  void mostrar() {
    //stroke(0);
    fill(0, 255, 0);
    strokeWeight(0);
    //rectMode(CORNERS);
    ellipse(x, y, radio, radio);
  }
  

  void modificarvelocidad() {
    aceleracion += 0.01;
    if (diry && velocidad < velocidadmaxima) { // baja    
      velocidad += aceleracion;
    }
    else if (!diry) { // baja  
      velocidad -= aceleracion;
    }
    if (velocidad < 0) {
      velocidad = 0;
      aceleracion = 0;
      diry=true;
    }
  }


  void comprobarlimites() {
    if (!dirx && x < radio/2) dirx = true;
    else if (dirx && x > width-(radio/2)) dirx = false;
    if (diry && y > height-(radio/2)) {
      diry = false;
      aceleracion = 0;
    }
  }
}