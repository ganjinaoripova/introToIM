class Bullet {

  PVector loc;
  float vel;
  boolean isMine; 
  boolean isDead;


  Bullet() {
    loc = new PVector(myself.loc.x, myself.loc.y);
    vel = -10;
    isMine = true; // User bullet
  }

  Bullet(Enemy enemy) {
    loc = new PVector(enemy.loc.x, enemy.loc.y);
    vel = 5;
    isMine = false; // enemy of bullet
  }

  void display() {
    if (isMine) { // This just changes the color
      stroke(0, 255, 0);
    } else {
      stroke(255, 0, 0);
    }
    fill(255, 0, 0);
    rect(loc.x, loc.y, 3, 6);
  }

  void update() {
    loc.y += vel;
    if ((vel > 0 && loc.y > height) || (vel < 0 && loc.y < 0)) {
      isDead = true;
    }
  }
}
