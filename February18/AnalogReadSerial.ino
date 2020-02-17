/*
  AnalogReadSerial

  Reads an analog input on A3, prints the result to the Serial Monitor.
  Graphical representation is available using Serial Plotter (Tools > Serial Plotter menu).
  Attach the center pin of a potentiometer to pin A0, and the outside pins to +5V and ground.

  This example code is in the public domain.

  http://www.arduino.cc/en/Tutorial/AnalogReadSerial
*/

int pResistor = A0;
int pRPin = 9;
int ResistorValue;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  pinMode (A3, INPUT);
  pinMode (6, OUTPUT);
  pinMode (13, OUTPUT);
  pinMode (pRPin, OUTPUT);
  pinMode (pResistor, INPUT);
  Serial.begin(9600);
}

// the loop routine runs over and over again forever:
void loop() {
  ResistorValue = analogRead(pResistor);

  // read the input on analog pin 0:
  int sensorValue = analogRead(A3);

  // smallest number is 50
  // biggest number is 1006

  int mappedValue;

  mappedValue = map (sensorValue, 50, 1006, 0, 255);
  mappedValue = constrain(mappedValue, 0, 255);
  Serial.print("raw value = ");
  Serial.print(sensorValue);
  Serial.print(" mapped value = ");
  Serial.println(mappedValue);

  analogWrite (6, mappedValue); // only values from 0 - 255

  //Do a little blink
  digitalWrite (13, HIGH);
  delay (mappedValue * 10);
  digitalWrite (13, LOW);
  delay (mappedValue * 10);


  delay(1);        // delay in between reads for stability

   //////////////PhotoResistor
  Serial.println(ResistorValue);
  if (ResistorValue > 500) {
    digitalWrite(pRPin, LOW);
  }
  else {
    digitalWrite(pRPin, HIGH);
  }
}
