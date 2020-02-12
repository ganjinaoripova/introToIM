/*
  Blink

  Turns an LED on for one second, then off for one second, repeatedly.

  Most Arduinos have an on-board LED you can control. On the UNO, MEGA and ZERO
  it is attached to digital pin 13, on MKR1000 on pin 6. LED_BUILTIN is set to
  the correct LED pin independent of which board is used.
  If you want to know what pin the on-board LED is connected to on your Arduino
  model, check the Technical Specs of your board at:
  https://www.arduino.cc/en/Main/Products

  modified 8 May 2014
  by Scott Fitzgerald
  modified 2 Sep 2016
  by Arturo Guadalupi
  modified 8 Sep 2016
  by Colby Newman

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/Blink
*/
// First Part Global Variables: What is the difference between a global and local variable

int buttonState = 0;
int pResistor = A0;
int pRPin = 9;
int ResistorValue;

// the setup function runs once when you press reset or power the board
void setup() {
  // initialize digital pin LED_BUILTIN as an output.  ...... input - independent/output - dependent   .... analog - range(1-...)/digital-true and false
  pinMode(13, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(pRPin, OUTPUT);
  pinMode(2, INPUT);
  pinMode(pResistor, INPUT);
  Serial.begin(9600); //This line is to print the values

}

// the loop function runs over and over again forever
void loop() {
  ResistorValue = analogRead(pResistor);
  buttonState = digitalRead(2);
  //Serial.println(buttonState);
  if (buttonState == HIGH) {
    digitalWrite(12, HIGH);
    digitalWrite(13, LOW);
    delay(100);
    digitalWrite(12, LOW);
    digitalWrite(13, HIGH);   // digital write - telling arduino to do smth, as an example turn on pin 12
    delay(100);
  }
  else {
    digitalWrite(12, LOW);
    digitalWrite(13, LOW);
  }

  //////////////PhotoResistor
  Serial.println(ResistorValue);
  if (ResistorValue > 500) {
    digitalWrite(pRPin, LOW);
  }
  else {
    digitalWrite(pRPin, HIGH);
  }
}
