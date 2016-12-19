// Phase 4
// Add player contolled by keys left, right and up
// ====================================
// Phase 3
// bubbles have diferent sizes
// hitting a bubble greater than 1, creates 2 smaller bubbles
// =====================================
// Phase 2
// Add a hook triggered by mouse click
// If hook meet some bubble, destroy it
// =====================================
// Phase 1
// Create bubbles and make them bounce
// =====================================
// Created by Daniel Alvarez (DasK)

ArrayList<Bubble> bubbles = new ArrayList<Bubble>();
Bubble actualbubble;
Hook hook;
Player player;
int playermoving = 0;

void setup() {
  size(640, 480);
  //frameRate(30);
  bubbles.add(new Bubble(100, height-400, false, 3, false));
  bubbles.add(new Bubble(200, height-400, false, 4, false));
  bubbles.add(new Bubble(width/2, height-400, false, 5, false));
  bubbles.add(new Bubble(width - 100, height-400, true, 4, false));
  bubbles.add(new Bubble(width - 200, height-400, true, 3, false));

  player = new Player(width/2);
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
  if (player != null) {
    if (playermoving!=0) player.move(playermoving);
    player.show();
    checkplayer();
  }
}

void checkhook() {
  if (hook.y < 0) { //if hits the top, destroy
    hook = null;
    return;
  }
  for (int i = bubbles.size() - 1; i >= 0; i--) { //backwards so we can remove items
    actualbubble = bubbles.get(i);
    if (abs(actualbubble.x - hook.x) < actualbubble.radious && actualbubble.y + actualbubble.radious > hook.y) {   
      hook = null;
      if (actualbubble.bbsize > 1) {
        bubbles.add(new Bubble(actualbubble.x + (actualbubble.radious/2), actualbubble.y, true, actualbubble.bbsize-1, true));
        bubbles.add(new Bubble(actualbubble.x - (actualbubble.radious/2), actualbubble.y, false, actualbubble.bbsize-1, true));   
        //frameRate(1); //for debug
      }
      bubbles.remove(i);
      return;
    }
  }
}

void checkplayer() {
  //check if some bubble hits the player
  for (int i = 0; i < bubbles.size(); i++) {
    actualbubble = bubbles.get(i);
    if (dist(actualbubble.x, actualbubble.y, player.x, player.y-(player.plsize/2)) < (player.plsize/3)+actualbubble.radious) {   
      frameRate(1); //for debug      
      player = null;
      actualbubble.bbcolor = color(255,10,100);
      return;
    }
  }
}

void keyPressed() {
  if (key == CODED && player != null) {
    switch(keyCode) {
    case UP: 
      hook = new Hook(player.x);
      break;
    case LEFT: 
      playermoving = -1;
      break;
    case RIGHT: 
      playermoving = 1;
      break;
    }
  }
}

void keyReleased() {
  if (keyCode == LEFT || keyCode == RIGHT) playermoving=0;
}
