//dimensions of the boxes
int dim = 10;

void setup() {
  background(250, 250, 220);
  size(600, 545);
  fill(180, 150, 150, 100);
  stroke(0);

  //loop:  displays boxes row by row 
  for (int j=0; j<dim; j++) {  
    pushMatrix();
    int shift = j*54; //changes the position rows (boxes become closer)
    translate(0, shift);
    box();
    for (int i=0; i<dim; i++) {
      int shift1 = i+100; //changes the placement of boxes vertically
      translate(shift1, 0);
      box();
    }
    popMatrix();
  }
}

void box() {
  int locX =0; //location of the box
  int locY =0;
  int boxSize = 10;
  //outside box
  rect(locX, locY, boxSize, boxSize); //rectangle of the outside box
  //box 1
  int sizeX1 = int (random(20, 10));
  int sizeY1 = int(random(20, 10));
  if (sizeX1>=boxSize) { // making inner box smaller than the outside 
    sizeX1 = int (random(boxSize-20, boxSize-10));
  }
  if (sizeY1>=boxSize) { // same thing but with y size
    sizeY1 = int (random(boxSize-20, boxSize-10));
  }
  rect(locX+5, locY+5, sizeX1, sizeY1);


  //box2 - repetition of boxes but with smaller numbers
  int sizeX2 = int (random(40, 65));
  int sizeY2 = int(random(40, 65));
  if (sizeX2>=sizeX1) {
    sizeX2 = int (random(sizeX1-10, sizeX1-10));
  }
  if (sizeY2>=sizeY1) {
    sizeY2 = int (random(sizeY1-10, sizeY1-10));
  }
  rect(locX+10, locY+10, sizeX2, sizeY2);


  //box3
  int sizeX3 = int (random(40, 15));
  int sizeY3 = int(random(40, 15));
  if (sizeX3>=sizeX2) {
    sizeX3 = int (random(sizeX2-20, sizeX2-20));
  }
  if (sizeY3>=sizeY2) {
    sizeY3 = int (random(sizeY2-10, sizeY2-20));
  }
  rect(locX+10, locY+10, sizeX3, sizeY3);

  //box4
  int sizeX4 = int (random(35, 5));
  int sizeY4 = int(random(35, 5));
  if (sizeX4>=sizeX3) {
    sizeX4 = int (random(sizeX3-15, sizeX3-15));
  }
  if (sizeY4>=sizeY3) {
    sizeY3 = int (random(sizeY2-25, sizeY2-15));
  }
  rect(locX+15, locY+15, sizeX4, sizeY4);

  //box5
  int sizeX5 = int (random(55, 15));
  int sizeY5 = int(random(55, 15));
  if (sizeX5>=sizeX4) {
    sizeX5 = int (random(sizeX4-5, sizeX4-5));
  }
  if (sizeY5>=sizeY4) {
    sizeY4 = int (random(sizeY3-5, sizeY3-5));
  }
  rect(locX+10, locY+10, sizeX5, sizeY5);

  //box6
  int sizeX6 = int (random(55, 15));
  int sizeY6 = int(random(55, 15));
  if (sizeX6>=sizeX5) {
    sizeX6 = int (random(sizeX5-15, sizeX5-15));
  }
  if (sizeY6>=sizeY5) {
    sizeY5 = int (random(sizeY5-15, sizeY5-15));
  }
  rect(locX+30, locY+20, sizeX6, sizeY6);
}
