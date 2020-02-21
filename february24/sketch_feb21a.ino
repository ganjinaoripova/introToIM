int trig = 10;
int echo = 11;
long duration;
long distance;
int force;



void setup() {
  pinMode(echo, INPUT);
  pinMode(trig, OUTPUT);
  Serial.begin(9600);

}

void loop() {
  digitalWrite(trig, LOW);
  delayMicroseconds(2);
  digitalWrite(trig, HIGH);
  delayMicroseconds(10);
  digitalWrite(trig, LOW);
  duration = pulseIn(echo, HIGH);
  distance = (duration /  2) * .0344;

  int notes[7] = {261, 294, 329, 349, 392, 440, 494};
  //               midC   D    E    F    G    A    B   C

  force = analogRead(A0);

  if (distance < 0 || distance > 50  || force < 100) {
    noTone(12);
  }
  else if (force > 100) {
    int sound = map( distance, 0, 50, 0, 7);
    tone(12, notes[sound]);
  }
}
