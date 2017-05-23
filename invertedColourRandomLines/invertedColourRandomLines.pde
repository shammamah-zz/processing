import gifAnimation.*; 

int fr = 20; 
int fn = 0; 
int numlines = 1; 
int color1 = 0;
int color2 = 0;
int color3 = 0; 

Boolean start = true; 

GifMaker gifExport;
int frames = 0;
int totalFrames = 500;

void setup(){
  size(480,480);
  surface.setResizable(true); 
  stroke(color1,color2,color3); 
  strokeWeight(1); 
  frameRate(fr);
  if(start==true){
    gifExport = new GifMaker(this, "export.gif", 100);
    gifExport.setRepeat(0); // make it an "endless" animation
    start=false; 
  }
}

void draw(){
 background(255-color1, 255-color2, 255-color3);
 for(int i=0; i<numlines; i++){
   line(width/2,  height/2, random(0, width), random(0,height));
 }
 if(numlines>1){
   export();
 }
 fn++;
 if(fn%50==0){
   change();
 }
}

void mousePressed(){
  change(); 
}

void change(){ 
  numlines=int(random(2,100));  
  color1 = int(random(0,255)); 
  color2 = int(random(0,255));
  color3 = int(random(0,255));
  draw(); 
  setup(); 
}
  
void export() {
  if(frames < totalFrames) {
    gifExport.setDelay(50);
    gifExport.addFrame();
    frames++;
  } else {
    gifExport.finish();
    frames++;
    println("gif saved");
    exit();
  }
}