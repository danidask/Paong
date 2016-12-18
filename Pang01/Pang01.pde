ArrayList<Burbuja> burbujas = new ArrayList<Burbuja>();
Burbuja burbujaactual;
Arpon arpon;

void setup() {
  size(640, 480);
  frameRate(30);
  burbujas.add(new Burbuja(200, height-400, false));
  burbujas.add(new Burbuja(300, height-400, true));
}

void draw() {
  background(255);
  for (int i = 0; i < burbujas.size(); i++) {
    burbujaactual = burbujas.get(i);
    burbujaactual.mover();
    burbujaactual.mostrar();
  }
  if (arpon != null){
    arpon.mover();
    arpon.mostrar();
    comprobararpon();
  }
  
  
  
  
  textSize(28);
  text("velocidad: " + str(burbujaactual.velocidad), 20, 30);   
  text("aceleracion: " + str(burbujaactual.aceleracion), 20, 70);
  text("altura: " + str(burbujaactual.y), 20, 100);
}

void mousePressed() {
  arpon = new Arpon(mouseX);
}

void keyPressed() {
}

void comprobararpon(){
  if (arpon.y < 0) arpon = null;
  
  
}