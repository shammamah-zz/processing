/** 
  * Behaviour options
  **/ 
private final Boolean randomize = false;     // randomly place points on click 
private final Boolean oscillate = true;      // enable oscillate or move animation 

private final Boolean colorChange = true;    // dynamic colour for lines
private final Boolean hideTrace = false;     // remove old lines each frame
private final int maxdx = 10; // max absolute change in x-coordinate
private final int maxdy = 10; // max absolute change in y-coordinate


/** 
  * Colour options
  **/ 
private final int minRGB = 150;  // min RGB value
private final int maxRGB = 205;  // max RGB value

private final int mindRGB = -5; // min change in RGB values
private final int maxdRGB = 5;  // max change in RGB values

private final int bg = 255;      // background colour (greyscale)


/**
  * Shape options 
  **/ 
private final int w = 800;  // width 
private final int h = 800;  // height
private final int fr = 60;  // framerate 

void setup(){
  size(800,800);     // must be same dimensions as w,h 
  strokeWeight(1); 
  frameRate(fr);
  draw(); 
}


/** 
  * Application of settings
  * (DO NOT ALTER) 
  **/ 
private int mindx = -maxdx; 
private int mindy = -maxdy;
private int r = minRGB; 
private int g = minRGB; 
private int b = minRGB; 

/** 
  * Collection of points in canvas 
  **/ 
private ArrayList<point> points = new ArrayList<point>();

/** 
  * Point object  
  * rotate(): method for rotate animation, 
  * move(): method for move animation
  * getX(), getY(): returns x/y coord of point
  **/
private final class point{ 
  
  private int x, y;                  // coordinates
  private final int distx, disty;    // distance from middle of frame
  private Boolean moveRight, moveUp; // direction of movement 

  // Constructor 
  public point(int xcoord, int ycoord, ArrayList<point> pts){
   
    // geometry 
    this.x = xcoord; 
    this.y = ycoord; 
    this.distx = xcoord-w/2; 
    this.disty = ycoord-h/2; 
    
    // movement direction
    if(distx<0) moveRight = true; else moveRight = false; 
    if(disty<0) moveUp = true; else moveUp = false; 
    
    // create lines from all existing points to new point
    for(point pt : pts){
      line(x, y, pt.getX(), pt.getY());
    }
    // add new point to collection of points
    pts.add(this); 

  }
  
  // getter methods for coordinates
  public int getX(){ return this.x; } 
  public int getY(){ return this.y; } 
  
  // re-connects all existing points to point's position
  private void updateLines(point p){ 
    for(point pt : points){
      if(pt == p) continue; 
      line(x, y, pt.x, pt.y);
    }
  }
   
  // oscillate animation 
  public void oscillate(){
    
    // direction of movement based on borders of window
    if(this.x > w/2+abs(this.distx)) this.moveRight = false; 
    else if(this.x < w/2-abs(this.distx)) this.moveRight = true; 
    if(this.y > h/2+abs(this.disty)) this.moveUp = false; 
    else if(this.y < h/2-abs(this.disty)) this.moveUp = true; 
   
    // horizontal movement 
    if(this.moveRight){  
      if(this.x == w/2) this.x += 1;
      else this.x +=  (int) (Math.pow(float(this.distx)-float(w/2),1/4)); 
    }  
    else{
      if(this.x == w/2) this.x -= 1; 
      else this.x -= (int) (Math.pow(float(this.distx)-float(w/2),1/4));
    }
   // vertical movement 
    if(this.moveUp){      
      if(this.y == h/2) this.y += 1;
      else this.y +=  (int) (Math.pow(float(this.disty)-float(h/2),1/4)); 
    }  
    else{
      if(this.y == h/2) this.y -= 1; 
      else this.y -= (int) (Math.pow(float(this.disty)-float(h/2),1/4));
    }
    
    updateLines(this); 
    
  }
  
  // random movement animation 
  public void moveRandom(){
    
    int r = int(random(mindx, maxdx)); // horizontal change in position
    int u = int(random(mindy, maxdy)); // vertical change in position
    
    if(this.x + r > w) r = -(w-this.x); 
    if(this.x + r < 0) r = -r; 
    if(this.y + u > h) u = -(h-this.y); 
    if(this.y + u < 0) u = -u; 
    
    // update coordinates
    this.x += r; 
    this.y += u; 
    
    updateLines(this); 
    
  }  
  
}
  

/** 
  * Colour of all lines on the canvas 
  **/ 
private final void lineColor(){
  int dr = int(random(mindRGB,maxdRGB));
  int dg = int(random(mindRGB,maxdRGB));
  int db = int(random(mindRGB,maxdRGB));
  if(r+dr < minRGB || r+dr > maxRGB){
    dr = -dr; 
  }
  if(g+dg < minRGB || g+dg > maxRGB){
    dg = -dg; 
  }
  if(b+db < minRGB || b+db > maxRGB){
    db = -db; 
  }
  r += dr; 
  g += dg; 
  b += db; 
}


/** 
  * Action to take on mouse click 
  **/ 
void mousePressed(){
  if(randomize){
    new point(int(random(0,w)), int(random(0,h)), points); 
  }
  else{
    new point(mouseX, mouseY, points); 
  }
}


/** 
  * Generation of canvas 
  **/ 
void draw(){
  if(hideTrace) background(bg);
  if(colorChange) lineColor(); 
  stroke(r,g,b); 
  for(point pt : points){
    if(oscillate){
      pt.oscillate(); 
    }
    else{
      pt.moveRandom(); 
    }
  }
}