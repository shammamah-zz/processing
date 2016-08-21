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

public class fib extends PApplet {

int[] fib = new int[20]; 
int r=0; 
int g=0; 
int b=0; 

public void setup() {
   
  stroke(255-r, 255-g, 255-b); 
  frameRate(25);
  fib[0] = 1; 
  fib[1] = 2; 
  for(int i=2; i<fib.length; i++){
    fib[i] = fib[i-1] + fib[i-2]; 
  }
  fib[fib.length-1]=0; 
}


int i = 0; 


public void draw() {
  background(r,g,b);
  int k = fib[i]; 
  int l = -10*k; 
  if(k!=0){
    strokeWeight(3); 
    line(0,k,k,0);
    line(width,height-k,width-k,height); 
    line(0,height-k,k,height); 
    line(width,k,width-k,0); 
    line(0,k+l,k+l,0);
    line(width,height-k+l,width-k+l,height); 
    line(0,height-k+l,k+l,height); 
    line(width,k+l,width-k+l,0);
    line(0,k-l,k-l,0);
    line(width,height-k-l,width-k-l,height); 
    line(0,height-k-l,k-l,height); 
    line(width,k-l,width-k-l,0);
  }
  else{
    fib[i-1]=0; 
    i=0; 
    draw();
  }
  i++; 
  if(fib[1]==0){
    r=(int)random(0,255); 
    g=(int)random(0,255); 
    b=(int)random(0,255); 
    
    setup(); 
  }
}
public void mousePressed(){
  r=(int)random(0,255); 
  g=(int)random(0,255); 
  b=(int)random(0,255); 
  
  stroke(255-r, 255-g, 255-b); 
  background(r,g,b);
}
  public void settings() {  size(1600, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "fib" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
