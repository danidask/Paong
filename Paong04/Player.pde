class Player {
  float x;
  float y;
  float speed = 4;
  int plsize;

  Player(float startX) {
    plsize = 40;
    x = startX;
    y = height - plsize;
  }
  void show() {
    rectMode(CENTER); 
    fill(204, 102, 0);
    strokeWeight(0);
    rect(x, y, plsize, plsize*2);
    stroke(0);
    strokeWeight(1);
    ellipse(x, y-(plsize/2), plsize/3, plsize/3); //real hittable area
  }
  void move(int dirX) {
    if (dirX>0 && x < width-(plsize/2)) x += speed;
    else if (dirX<0 && x > plsize/2) x -= speed;   
  }
}
