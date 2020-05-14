class Myself {

  PVector loc;
  float size;
  int coolingTime;
  boolean isDead;

  Myself() {
    size = 25;
    loc = new PVector(width / 2, height - size / 2 - 10); // Position when you start the game, This value will change
    coolingTime = 0; // To count frames between bullets
    isDead = false;
  }

  void display() {
    fill(0, 255, 0);
    rect(loc.x, loc.y, size, size);
  }

  void update() {
    //isDead = false; //This variable was only testing 
    float dmx = mouseX - loc.x;
    dmx = constrain(dmx, -10, 10);
    loc.x += dmx; // Getting the difference between mouse and myself location scaling it and adding the difference to myself loc
    coolingTime++; // You can shoot only every frames
    if (mousePressed && coolingTime >= 10) { // If mouse is pressed and cooling time is less then ten
      myBullets.add(new Bullet()); // Then add a bullet to the bullet array 
      coolingTime = 0;
    }
    for (Bullet b : eneBullets) { // It goes to all the current created bullets in the game
      if ((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
        && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)) { // Setting ranges of myself location
        lives--;
        b.isDead = true; // bullet disapperars

        if (lives == 0)
          isDead = true; // killing myself
        break;
      }
    }
    for (Enemy e : enemies) {
      if (abs(loc.x - e.loc.x) < size / 2 + e.size / 2 && abs(loc.y - e.loc.y) < size / 2 + e.size / 2) { // location of the box
        isDead = true; // kill myselft
        e.isDead = true; // enemy disappear
        break;
      }
    }
  }
}
