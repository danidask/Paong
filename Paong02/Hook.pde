class Hook {
  float x;
  float y;
  float startY;
  float speed = 10;

  Hook(float startX) {
    x = startX;
    startY = height - 10;
    y = startY;
  }

  void show() {
    stroke(150);
    strokeWeight(4);
    line(x, startY, x, y);
  }

  void move() {
    y -= speed;
  }
}