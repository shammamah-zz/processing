import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class invertedColourRandomLines extends PApplet {

int fr = 2; 
int numlines = 1; 
int color1 = 0;
int color2 = 0;
int color3 = 0; 

public void setup(){
  
  surface.setResizable(true); 
  stroke(color1,color2,color3); 
  strokeWeight(2); 
  frameRate(fr); 
}

public void draw(){
 background(255-color1, 255-color2, 255-color3);
 for(int i=0; i<numlines; i++){
 line(width/2,  height/2, random(0, width), random(0,height));
 }
}
 
public void mousePressed(){ 
  numlines=PApplet.parseInt(random(1,100)); 
  fr=PApplet.parseInt(random(10,30)); 
  color1 = PApplet.parseInt(random(0,255)); 
  color2 = PApplet.parseInt(random(0,255));
  color3 = PApplet.parseInt(random(0,255));
  setup(); 
  draw(); 
  }
  public void settings() {  size(480,480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "invertedColourRandomLines" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
