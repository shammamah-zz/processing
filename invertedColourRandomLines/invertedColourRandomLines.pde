int fr = 2; 
int numlines = 1; 
int color1 = 0;
int color2 = 0;
int color3 = 0; 

void setup(){
  size(480,480);
  surface.setResizable(true); 
  stroke(color1,color2,color3); 
  strokeWeight(2); 
  frameRate(fr); 
}

void draw(){
 background(255-color1, 255-color2, 255-color3);
 for(int i=0; i<numlines; i++){
 line(width/2,  height/2, random(0, width), random(0,height));
 }
}
 
void mousePressed(){ 
  numlines=int(random(1,100)); 
  fr=int(random(10,30)); 
  color1 = int(random(0,255)); 
  color2 = int(random(0,255));
  color3 = int(random(0,255));
  setup(); 
  draw(); 
  }