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

public class LightingExperiment extends PApplet {

int lightr = PApplet.parseInt(random(0,255)); 
int lightg = PApplet.parseInt(random(0,255)); 
int lightb = PApplet.parseInt(random(0,255)); 

public void setup(){
   //initialize; P3D means it is a 3D drawing
  surface.setResizable(true); 
  background((255-lightr)/10, (255-lightg)/10, (255-lightb)/10); 
  //dark background, but inverse of light colour
}

public void draw(){
  noStroke(); //disables outline
  directionalLight(lightr, lightg, lightb, -(mouseX-width/2),-(mouseY-height/2),0); 
  //first 3 set colour, last 3 set direction; the light follows the mouse 
  fill(255); //initially draws a white sphere so colour translates properly 
  translate(width/2, height/2, 0); //moving center of coordinate system 
  sphere(100); //sphere with radius 280
}

public void mousePressed(){
  lightr = PApplet.parseInt(random(0,255)); 
  lightg = PApplet.parseInt(random(0,255)); 
  lightb = PApplet.parseInt(random(0,255)); 
  setup(); 
  draw(); 
}
  public void settings() {  size(1280,1280,P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "LightingExperiment" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
