//Phase 3
//bubbles have diferent sizes
//hitting a bubble greater than 1, creates 2 smaller bubbles
//=====================================
//Phase 2
//Add a hook triggered by mouse click
//If hook meet some bubble, destroy it
//=====================================
//Phase 1
//Create bubbles and make them bounce
//=====================================
//Created by Daniel Alvarez (DasK)

ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
Bubble actualbubble;
Hook hook;

void setup() {
  size(640, 480);
  frameRate(30);
  bubbles.add(new Bubble(100, height-400, false, 3, true));
  bubbles.add(new Bubble(200, height-400, false, 4, true));
  bubbles.add(new Bubble(width/2, height-400, false, 5, true));
  bubbles.add(new Bubble(width - 100, height-400, true, 4, true));
  bubbles.add(new Bubble(width - 200, height-400, true, 3, true));
}

void draw() {
  background(255);
  for (int i = 0; i < bubbles.size(); i++) {
    actualbubble = bubbles.get(i);
    actualbubble.move();
    actualbubble.show();
  }
  if (hook != null) {
    hook.move();
    hook.show();
    checkhook();
  }
}

void mousePressed() {
  hook = new Hook(mouseX);
}

void checkhook() {
  if (hook.y < 0) { //if hits the top, destroy
    hook = null;
    return;
  }
  for (int i = bubbles.size() - 1; i >= 0; i--) {
    actualbubble = bubbles.get(i);
    if (abs(actualbubble.x - hook.x) < actualbubble.radious && actualbubble.y + actualbubble.radious > hook.y) {   
      hook = null;
      if (actualbubble.bbsize > 1) {
        bubbles.add(new Bubble(actualbubble.x + (actualbubble.radious/2), actualbubble.y, true, actualbubble.bbsize-1, false));
        bubbles.add(new Bubble(actualbubble.x - (actualbubble.radious/2), actualbubble.y, false, actualbubble.bbsize-1, false));   
        //frameRate(1); //for debug
      }
      bubbles.remove(i);
      return;
    }
  }
}