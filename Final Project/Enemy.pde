class Enemy {

  PVector loc;
  float vel;
  float size;
  int coolingTime;
  boolean isDead;

  Enemy() { // This funcition is like the set up only run once when you create the object
    size = 25;
    loc = new PVector(random(size / 2, width - size / 2), -size / 2);
    vel = 3; // If you want to make enemies faster increase velocity (also modify bullets as they are not dependant)
    coolingTime = int(random(60)); // random int between 60 and 0
    isDead = false;
  }

  void display() {
    fill(200, 0, 255);
    stroke(0);
    rect(loc.x, loc.y, size, size); // displaying the square and loc.y is increasing vel pixels each frame
  }

  void update() {
    loc.y += vel; // each frame I am adding vel pixels to loc.y 
    if (loc.y > height) { 
      isDead = true; // The object kill itself when the location y is greater than height
    }
    coolingTime++; // you shoot every from random integer to 60 
    if (coolingTime >= 60) { // When cooling time reach 60 then shoots a bullet to myself
      eneBullets.add(new Bullet(this)); // You expand the array bullet one space and create a new bullet
      coolingTime = 0; // And cooling time go back
    }
    for (Bullet b : myBullets) { //same as myself 
      if ((loc.x - size / 2 <= b.loc.x && b.loc.x <= loc.x + size / 2)
        && (loc.y - size / 2 <= b.loc.y && b.loc.y <= loc.y + size / 2)) {
        isDead = true;
        b.isDead = true;
        score++;
        break;
      }
    }
  }
}
