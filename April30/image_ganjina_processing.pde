/*
Author: Ganjina Oripova
 Class: Introduction to Interactive Media
 Tittle: Image assignment - combining flash light effect with pointilize
 
 Explanation: If the mouse is on the canvas but is not pressed -> pointilize
 If the mouse is on the canvas and is pressed -> then the flashlight 
 effects appears and makes the whole area black but not the mouse area
 
 Tricky part: The flashlight effect is working, however its not moving with the mouse, 
 so whenever the mouse is pressed -> flashlight light is working. I wanted the flashlight 
 to move with the mouse and only pointilize the part where the mouse is and make other 
 parts of the canvas black. However, now when the mouse is pressed,both of them are 
 working; flashlight and pointilize. And when you press the mouse multiple times
 flashlight dissappears and pointilize the whole canvas.
 
 Date: April 30, 2020
 */

PImage img;
int pointillize = 40;
boolean flash;

void setup() {
  size(728, 546);
  img = loadImage("avocado1.jpg");
}

void draw() {

  // Pick a random point
  int x = int(random(img.width));
  int y = int(random(img.height));
  int loc = x + y*img.width;

  // get the rgb components from the image
  loadPixels();

  float r = red(img.pixels[loc]);
  float g = green(img.pixels[loc]);
  float b = blue(img.pixels[loc]);
  noStroke();

  // use the color
  // from a pixel to draw a circle
  fill(r, g, b, 200);
  ellipse(x, y, pointillize, pointillize);
  checkmouse();
  if (flash == true) {
    flashlight();
  }
}

void checkmouse() {
  if (mousePressed)
    if (flash == true) {
      flash = false;
    } else {
      flash = true;
    }
}


void flashlight() {
  for (int x = 0; x < width; x++ ) {
    for (int y = 0; y < height; y++ ) {

      // Calculate the 1D pixel location
      int loc = x + y*img.width;

      // Get the R,G,B values from image
      float r = red  (pixels[loc]);
      float g = green(pixels[loc]);
      float b = blue (pixels[loc]);


      // Calculate an amount to change brightness
      // based on proximity to the mouse
      float distance = dist(x, y, mouseX, mouseY);

      // The closer the pixel is to the mouse, the lower the value of "distance"
      // We want closer pixels to be brighter, so we invert the value using map()
      float adjustBrightness = map(distance, 0, 150, 8, 0);
      r *= adjustBrightness;
      g *= adjustBrightness;
      b *= adjustBrightness;

      // Constrain RGB to between 0-255
      r = constrain(r, 0, 255);
      g = constrain(g, 0, 255);
      b = constrain(b, 0, 255);

      // Make a new color and set pixel in the window
      color c = color(r, g, b);
      pixels[loc] = c;
    }
  }
  updatePixels();
}
