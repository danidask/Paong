class Bubble {
  float x;
  float y;
  boolean dirX;
  boolean dirY;
  int radious;
  float speed;
  float acceleration = 0;
  int maxspeed;
  float horizontalspeed = 1;
  int bbsize;
  color bbcolor = color (0, 255, 0);

  Bubble(float startX, float startY, boolean startdirX, int startsize, boolean frombreaking) {
    bbsize = startsize;
    x = startX;
    y = startY;
    dirX = startdirX;
    dirY = false;
    if (frombreaking) speed = 3;
    else speed = 0;
    radious = 8 * startsize;
    maxspeed = ((4 * startsize) /3) + 6;
  }

  void move() {
    speedchange();
    if (dirX) x+=horizontalspeed;
    else x-=horizontalspeed;
    if (dirY) y += speed;
    else y-=speed;
    checkboundaries();
  }

  void show() {
    fill(bbcolor);
    strokeWeight(0);
    ellipseMode(RADIUS);
    ellipse(x, y, radious, radious);
  }
  
  void speedchange() {
    acceleration += 0.01;
    if (dirY && speed < maxspeed) {  
      speed += acceleration;
    }
    else if (!dirY) {  
      speed -= acceleration;
    }
    if (speed < 0) {
      speed = 0;
      acceleration = 0;
      dirY=true;
    }
  }

  void checkboundaries() {
    if (!dirX && x < radious) dirX = true;
    else if (dirX && x > width - radious) dirX = false;
    if (dirY && y > height - radious) {
      dirY = false;
      acceleration = 0;
    }
  }
}
