Rotater[] rotaters;

void setup() {
  size(640, 640);
  rotaters = new Rotater[350];
  for (int i=0; i< rotaters.length; i++) {
    float x = random(width);
    float y = random(height);
    float lineDistance = random(20, 70);
    //initiate with i for index
    rotaters[i]= new Rotater(x, y, i, lineDistance);
  }
}

void draw() {
  background(20, 10, 40);

  for (Rotater r : rotaters) {
    r.rotate();
    r.distance(rotaters);
  }
}

class Rotater {
  float centerX, centerY, x, y, angle, radius, speed, lineDistance, acceleration, direction;
  int index;

  Rotater(float _x, float _y, int i, float ld) {
    centerX= _x;
    centerY=_y;
    x = y = angle = 0;
    radius=random(100, 5);
    speed = 0;
    index = i;
    lineDistance = ld;
    acceleration=0;
    //all of the rotaters now have the direction of -1
    direction=-1;
  }

  void rotate() {
    //get cartesian coords from polar angle
    //add to center point of rotater to rotate around the actual spot
    x = cos(angle)*radius+centerX;
    y = sin(angle)*radius+centerY;
    //same as normal: vel+=acc
    speed+=acceleration;
    //angle is our pos now, mult by our direction
    angle+=speed*direction;
    //dampen it a little
    speed*=0.98;
    acceleration=0;
    fill (25, 70, 100); // ecircle color 
    ellipse(x, y, 20, 20); //adds small circle shapes
  }

  void distance(Rotater[] rotaters) {
    //check the mouse, if close enough add some acceleration
    checkMouse();
    //check distance with all rotaters, if close enough draw line
    for (Rotater r : rotaters) {
      if (r.index != index) {
        if (dist(x, y, r.x, r.y)<lineDistance) {

          if (dist(mouseX, mouseY, x, y)<160) {
            stroke(200, 100, 250); //strokes that are close <160 -> make the stroke color purple
          } else { //strokes that are not close <160
            stroke(100, 250, 200); //make the stroke light green
          }
          line(x, y, r.x, r.y);
        }
      }
    }
  }

  void checkMouse() {
    //if mouse is *FAR* enough give some acceleration
    if (dist(mouseX, mouseY, x, y)>200 && mouseX!=pmouseX && mouseY!=pmouseY) {
      acceleration=.002;
    }
  }
}
