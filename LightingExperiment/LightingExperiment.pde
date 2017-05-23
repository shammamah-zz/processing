import gifAnimation.*; 

GifMaker gifExport;
int frames = 0;
int totalFrames = 300;

int lightr = int(random(0,255)); 
int lightg = int(random(0,255)); 
int lightb = int(random(0,255)); 

void setup(){
  size(1280,1280,P3D); //initialize; P3D means it is a 3D drawing
  surface.setResizable(true); 
  background((255-lightr)/10, (255-lightg)/10, (255-lightb)/10); 
  //dark background, but inverse of light colour
  gifExport = new GifMaker(this, "export.gif", 100);
  gifExport.setRepeat(0); // make it an "endless" animation
 
}

void draw(){
  noStroke(); //disables outline
  directionalLight(lightr, lightg, lightb, -(mouseX-width/2),-(mouseY-height/2),0); 
  //first 3 set colour, last 3 set direction; the light follows the mouse 
  fill(255); //initially draws a white sphere so colour translates properly 
  translate(width/2, height/2, 0); //moving center of coordinate system 
  sphere(100); //sphere with radius 280
}

void mousePressed(){
  lightr = int(random(0,255)); 
  lightg = int(random(0,255)); 
  lightb = int(random(0,255)); 
  setup(); 
  draw(); 
}