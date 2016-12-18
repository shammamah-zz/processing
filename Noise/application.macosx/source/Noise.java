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

public class Noise extends PApplet {

// colours can be inverted! 
// these values set the RGB values
// for the background; the dots
// will always be at least slightly
// visible
int r = 0; 
int g = 0;
int b = 0;

// grid dimensions
int sizex; 
int sizey; 

public void setup() {
 
 
 // get screen width and height
 sizex=width;
 sizey=height;
 
 // set grid dimensions to smallest 
 // prime numbers that are greater
 // than screen dimensions, to avoid
 // blank rows/columns
 while(!isPrime(sizex)){
   sizex++;
 }
 while(!isPrime(sizey)){
   sizey++; 
 }

 frameRate(10);
}

public void draw() {
  background(r,g,b); 
  for(int i=3; i<=sizex*sizey; i++){
    if(isPrime(i)){
      int x = (i-1)%sizex; 
      int y = (int)(Math.floor((i-1)/sizex));
      int c = (int)(Math.random()*3); 
      if(c==0){
        set(x,y,color(255-r,g,b)); 
      }
      else if(c==1){
        set(x,y,color(r,255-g,b)); 
      }
      else{
        set(x,y,color(r,g,255-b)); 
      }
    }
  }
}

public Boolean isPrime(int n) {
  for(int i=2; i<=Math.ceil(Math.sqrt(n)); i++){
    if(n%i == 0){
      return false; 
    }
  }
  return true; 
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Noise" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
