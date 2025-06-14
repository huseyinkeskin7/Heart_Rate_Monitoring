#include <TimerOne.h>

const int analogPin = A0; //analog pin
int data = 0; // to store sensor value
int samplingfrequency= 128; // sampling frequency 100hz


void setup() {
  Serial.begin(115200);
  Timer1.initialize(1000000/samplingfrequency); //sampling frequency set as 128hz. this function works with microsec. 
                                                //1000000 micsec / sampling freq , gives as sampling period   1/f = T
  Timer1.attachInterrupt(timerInterrupt); 
}

void loop() {
  
}

void timerInterrupt() {
  data = analogRead(analogPin); //analog read from pin that sensor is connected
  Serial.println(data);        //print data to serial port
}                   