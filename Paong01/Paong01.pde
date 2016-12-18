//Phase 1
//Create bubbles and make them bounce
//Created by Daniel Alvarez (DasK)

ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
Bubble actualbubble;

void setup() {
  size(640, 480);
  frameRate(30);
  bubbles.add(new Bubble(200, height-400, false));
  bubbles.add(new Bubble(300, height-400, true));
}

void draw() {
  background(255);
  for (int i = 0; i < bubbles.size(); i++) {
    actualbubble = bubbles.get(i);
    actualbubble.move();
    actualbubble.show();
  }

  //for debug
  textSize(18);
  text("velocidad: " + str(actualbubble.speed), 20, 30);   
  text("acceleration: " + str(actualbubble.acceleration), 20, 60);
  text("altura: " + str(actualbubble.y), 20, 90);
}