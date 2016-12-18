class Bubble {
  float x;
  float y;
  boolean dirx;
  boolean diry;
  int diameter;
  float speed = 0;
  float acceleration = 0;
  int maxspeed = 8;
  float horizontalspeed = 1;

  Bubble(float startX, float startY, boolean startdirX) {
    x = startX;
    y = startY;
    dirx = startdirX;
    diry = true;
    diameter = 25;
  }

  void move() {
    speedchange();
    if (dirx) x+=horizontalspeed;
    else x-=horizontalspeed;
    if (diry) y += speed;
    else y-=speed;

    checkboundaries();
  }

  void show() {
    //stroke(0);
    fill(0, 255, 0);
    strokeWeight(0);
    //rectMode(CORNERS);
    ellipse(x, y, diameter, diameter);
  }
  

  void speedchange() {
    acceleration += 0.01;
    if (diry && speed < maxspeed) { // baja    
      speed += acceleration;
    }
    else if (!diry) { // baja  
      speed -= acceleration;
    }
    if (speed < 0) {
      speed = 0;
      acceleration = 0;
      diry=true;
    }
  }


  void checkboundaries() {
    if (!dirx && x < diameter/2) dirx = true;
    else if (dirx && x > width-(diameter/2)) dirx = false;
    if (diry && y > height-(diameter/2)) {
      diry = false;
      acceleration = 0;
    }
  }
}