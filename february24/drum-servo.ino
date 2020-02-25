#include <Servo.h>
Servo servoL;
Servo servoR;

int srvoR = 5;
int srvoL = 6;
int LED = 13;

//musical things
int bpm = 90; //beats per minute
int timeSig = 4; //(beats per measure)
int Tbeat = 60000 / bpm; //time per beat in milliseconds is one minute divided by beats per minute
int beat = 1; //start the fist measure with the first beat
int measure = 1; //start with the first measure
//servo control
int travel = 17; //in degrees, how far does the servo need to turn
int Tservo = 130; //time allowed for servo to reach position before further instruction in milliseconds

void setup() {
  pinMode(5, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(13, OUTPUT);
  //setup the servos at set at zero
  servoL.attach(srvoL);
  servoR.attach(srvoR);
  servoL.write(0);
  servoR.write(0);
}

void beatTEST() {
  servoR.write(travel);
  servoL.write(travel);
  delay(60000 / bpm);
  servoR.write(0);
  servoL.write(0);
  delay(60000 / bpm);
}

void quarterBeatL() {
  servoL.write(travel);
  delay(Tservo);
  servoL.write(0);
  delay((60000 / bpm) - Tservo);
}

void quarterBeatR() {
  servoR.write(travel);
  delay(Tservo);
  servoR.write(0);
  delay((60000 / bpm) - Tservo);
}

void eighthBeatL() {
  servoL.write(travel);
  delay(Tservo);
  servoL.write(0);
  delay((30000 / bpm) - Tservo);
}

void eighthBeatR() {
  servoR.write(travel);
  delay(Tservo);
  servoR.write(0);
  delay((30000 / bpm) - Tservo);
}

void loop() {
  if (measure == 1) {
    quarterBeatR();
    quarterBeatL();
    quarterBeatR();
    quarterBeatL();
    measure = 2;
  }
  if (measure == 2) {
    eighthBeatR();
    eighthBeatL();
    eighthBeatR();
    eighthBeatL();
    eighthBeatR();
    eighthBeatL();
    eighthBeatR();
    eighthBeatL();
    measure = 1;
  }
}
