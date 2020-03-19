PShape s;
PShape t;

void setup() {
background(color(200,247,100));
size(800,800);
}

void draw() {

  //hair
  noStroke();
  fill(52, 25, 70);
  rect(252, 300, 296, 300);

  //ears
  noStroke();
  fill(255, 212, 173);
  ellipse(250, height/2, 55, 70);
  ellipse(550, height/2, 55, 70);

  //shirt
  fill(800, 10, 5);
  arc(400, 700, 296, 300, radians(180), radians(360));

  //neck
  fill(255, 212, 173);
  rect(372, 520, 60, 70);
  arc(402, 583, 61, 55, radians(0), radians(180), CHORD);

  //face
  fill(255, 219, 178);
  //ellipse
  rect(260, 260, 280, 290, 0, 0, 150, 150);

  //nose
  stroke(240, 172, 117);
  arc(400, 450, 30, 45, radians(220), radians(320));

  //mouth
  fill(243, 125, 117);
  stroke(0);
  strokeWeight(2);
  arc(400, 490, 65, 55, radians(0), radians(180), CHORD);
  noStroke();
  fill(255);
  rect(370, 492, 60, 8, 0, 0, 5, 5);

  //eyebrow
  noFill();
  stroke(0);
  strokeWeight(5);
  arc(470, 355, 85, 40, radians(220), radians(320));
  arc(329, 355, 85, 40, radians(220), radians(320));

  //fringe
  noStroke();
  fill(52, 25, 70);
  arc(400, 300, 296, 290, radians(180), radians(360));

  //eyes
  fill(0);
  ellipse(330, 395, 30, 35);
  ellipse(470, 395, 30, 35);
}
