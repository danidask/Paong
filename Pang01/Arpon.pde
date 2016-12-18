class Arpon {
  float x;
  float y;
  float yinicial;
  float velocidad = 10;

  Arpon(float inicialX) {
    x = inicialX;
    yinicial = height-10;
    y = yinicial;
  }


  void mover() {
    y -= velocidad;
  }

  void mostrar() {
    //stroke(0);
    fill(0, 255, 0);
    strokeWeight(4);
    //rectMode(CORNERS);
    line(x, yinicial, x, y);
  }
}