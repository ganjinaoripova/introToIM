/*
   'Car Parking System'

   By Ganjina Oripova
*/


//CAR BARRIER - using distance measuring sensor and servo motor to make automatic car barrier
#include<Servo.h>
Servo myservo;
//defines pin numbers
const int trigPin = 3;
const int echoPin = 5;
// defines variables
long tmeduration;
int distance;

//TRAFFIC LIGHT - using three differentt LED's to make a traffic light
const int red1 = 10;
const int yellow1 = 11;
const int green1 = 12;
int state;

//PHOTORESISTOR - using photoresistor to control light, turning off the light when the car parks and turning the lights on back when the car leaves
const int pResistor1 = A0;
const int pResistor2 = A1;
const int pRPin1 = 13;
const int pRPin2 = 8;
int ResistorValue1;
int ResistorValue2;

void setup() {
  //CAR BARRIER
  myservo.attach(9);
  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input
  //TRAFFIC LIGHT
  pinMode(red1, OUTPUT);
  pinMode(yellow1, OUTPUT);
  pinMode(green1, OUTPUT);
  //PHOTORESISTOR
  pinMode(pRPin1, OUTPUT);
  pinMode(pRPin2, OUTPUT);
  pinMode(pResistor1, INPUT);
  pinMode(pResistor2, INPUT);
  Serial.begin(9600); // Starts the serial communication

}

void loop() {

  //CAR BARRIER

  // Clears the trigPin
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  // Sets the trigPin on HIGH state for 10 micro seconds
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  tmeduration = pulseIn(echoPin, HIGH);  // Reads the echoPin, returns the sound wave travel time in microseconds
  distance = (0.034 * tmeduration) / 2;  // Calculating the distance

  if (distance <= 10) {   //measuriinig the distance - if the distance is smaller or equal to 10 - automatically open the barrier - using servo motor
    myservo.write(90);
  }
  else {
    myservo.write(0);
  }

  // Prints the distance on the Serial Monitor
  Serial.print("distance:");
  Serial.println(distance);

  delay(1);

  //TRAFFIC LIGHT
  changeLights();


  //PHOTORESISTOR
  ResistorValue1 = analogRead(pResistor1);
  ResistorValue2 = analogRead(pResistor2);

  Serial.println(ResistorValue1);
  //Serial.println(ResistorValue2);
  if (ResistorValue1 < 500)
  {
    digitalWrite(pRPin1, LOW);
  }
  else {
    digitalWrite(pRPin1, HIGH);
  }

  if ( ResistorValue2 < 500)
  {
    digitalWrite(pRPin2, LOW);
  }
  else {
    digitalWrite(pRPin2, HIGH);
  }


}


//TRAFFIC LIGHT
void changeLights() {   //adjusting light based on state

  if (millis() % 20000 < 5000) { //0-5000,20000-250000...
    state = 0;
  }
  else if (millis() % 20000 < 10000) { //5000-10000...
    state = 1;
  }
  else if (millis() % 20000 < 15000) { //10000-15000...
    state = 2;
  }
  else if (millis() % 20000 < 20000) { //15000-20000...
    state = 3;
  }

  if (state == 0) {
    // turn yellow on and opposite off
    digitalWrite(green1, LOW);
    digitalWrite(red1, LOW);
    digitalWrite(yellow1, HIGH);
  }
  else if (state == 1) {
    // turn yellow off, and opposite green and red
    digitalWrite(yellow1, LOW);
    digitalWrite(green1, LOW);
    digitalWrite(red1, HIGH);
  }
  else if (state == 2) {
    //turn yellow on and opposite off
    digitalWrite(yellow1, HIGH);
    digitalWrite(green1, LOW);
    digitalWrite(red1, LOW);
  }
  else if (state == 3) {
    //turn green on and opposite off
    digitalWrite(green1, HIGH);
    digitalWrite(yellow1, LOW);
    digitalWrite(red1, LOW);
  }

}
