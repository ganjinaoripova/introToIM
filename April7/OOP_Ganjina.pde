//different boxes 
Box theBox1;
Box theBox2;
Box theBox3;
Box theBox4;
Box theBox5;
Box theBox6;
Box theBox7;

void setup() {
  size(600, 600);
  theBox1 = new Box(color(255, 0, 0), 200, 15, 2, 1); //parameters of boxes 
  theBox2 = new Box(color(0, 0, 255), 130, 50, 4, 2);
  theBox3 = new Box(color(30, 10, 200), 150, 10, 6, 3);
  theBox4 = new Box(color(30, 70, 220), 10, 50, 8, 4);
  theBox5 = new Box(color(80, 12, 200), 10, 50, 10, 5);
  theBox6 = new Box(color(10, 122, 100), 50, 10, 12, 6);
  theBox7 = new Box(color(69, 102, 10), 15, 50, 14, 7);
}

void draw() {
  background(10, 10, 20);
  theBox1.drive();
  theBox1.display();
  theBox2.drive();
  theBox2.display();
  theBox3.drive();
  theBox3.display();
  theBox4.drive();
  theBox4.display();
  theBox5.drive();
  theBox5.display();
  theBox6.drive();
  theBox6.display();
  theBox7.drive();
  theBox7.display();
}
//one class
class Box {
  color c;
  float xpos;
  float ypos;
  float xspeed;
  float yspeed;
  //Constructor
  Box(color tempC, float tempXpos, float tempYpos, float tempXspeed, float tempYspeed) { 
    c = tempC;
    xpos = tempXpos;
    ypos = tempYpos;
    xspeed = tempXspeed;
    yspeed = tempYspeed;
  }

  void display() {
    fill(c); //color
    ellipseMode(CENTER);
    ellipse(xpos, ypos, 20, 20);
  }

  void drive() {

    xpos = xpos + xspeed; //moving the box to the right
    if (xpos > width) {
      xpos = 20;
    }

    ypos = ypos + yspeed; //moving the box to the bottom
    if ( ypos > height) {
      ypos = 10;
    }//end of if statement 
  } //edn of void drive
} //end of the class
