int[] fib = new int[20]; 
int r=0; 
int g=0; 
int b=0; 

void setup() {
  size(1600, 1000); 
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


void draw() {
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
void mousePressed(){
  r=(int)random(0,255); 
  g=(int)random(0,255); 
  b=(int)random(0,255); 
  
  stroke(255-r, 255-g, 255-b); 
  background(r,g,b);
}