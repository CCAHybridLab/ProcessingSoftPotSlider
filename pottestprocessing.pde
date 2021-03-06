import processing.serial.*;

import cc.arduino.*;

Arduino arduino;
int flexVal;
int softpotVal;
float mapVal;
int backColor;
int m;

//make a slider out of a soft potentionmeter attached to PIN AO, Change the backgoround color
//with a flex senors attached to pin A1
//use 10K resistor for the soft potentiometer and a 5K resitor for the flex sensor as pull down resistors.
//put the Standard Firmata on Adruino
int cm;
int barwidth;
void setup() {
  size(400, 700);//width, height
  backColor=0;
  barwidth= 50;
  
  arduino = new Arduino(this, Arduino.list()[2], 57600);
  

}


void draw() {
  background(backColor);

  cm = millis();
  flexVal = arduino.analogRead(1);
  softpotVal = arduino.analogRead(0);
  println();
 if (flexVal>0){
   backColor= 255;
     m = millis();}
   if ((cm-m)>500){
     backColor= 0;
 }
  mapVal= map(softpotVal, 0,1024, 0,(height-20));
  
  rect(width/2-(barwidth/2),(height-10),barwidth, -mapVal);
  fill(100, 255, 100);
}