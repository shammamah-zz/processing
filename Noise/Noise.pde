import gifAnimation.*; 

GifMaker gifExport;
int frames = 0;
int totalFrames = 300;

// colours can be inverted! 
// these values set the RGB values
// for the background; the dots
// will always be at least slightly
// visible
int r = 255; 
int g = 255;
int b = 255;

// grid dimensions
int sizex; 
int sizey; 

void setup() {
 fullScreen();
 
 gifExport = new GifMaker(this, "export.gif", 100);
 gifExport.setRepeat(0); // make it an "endless" animation
 
 // get screen width and height
 sizex=300;
 sizey=300;
 
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

void draw() {
  background(r,g,b); 
  for(int i=3; i<=sizex*sizey; i++){
    if(isPrime(i)){
      int x = (i-1)%sizex; 
      int y = (int)(Math.floor((i-1)/sizex));
      int c = (int)(Math.random()*3); 
      if(c==0){
        set(x,y,color(r,255-g,255-b)); 
      }
      else if(c==1){
        set(x,y,color(255-r,g,255-b)); 
      }
      else{
        set(x,y,color(255-r,255-g,b)); 
      }
    }
  }
  export(); 
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
Boolean isPrime(int n) {
  for(int i=2; i<=Math.ceil(Math.sqrt(n)); i++){
    if(n%i == 0){
      return false; 
    }
  }
  return true; 
}