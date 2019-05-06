int levels;
color bg,fg;

void setup() {
  size(800, 600);
  levels = 0;
}

/*Create Sierpiski's Gasket (google an image of this)
  The outer triangle are the vertices: (v1x, v1y), (v2x,v2y), (v3x, v3y)
  levels:
  0 = regular triangle
  1 = triforce (looks like 3 triangles)
  2 = each of the 3 triangles will be cut into 3 triangles.
  etc.
*/
void gasket(int levels, float v1x, float v1y, float v2x, float v2y, float v3x, float v3y) {
    float firstX = lerp(v1x,v2x,0.5);
    float firstY = lerp(v1y,v2y,0.5);
    float secondX = lerp(v2x,v3x,0.5);
    float secondY = lerp(v2y,v3y,0.5);
    float thirdX = lerp(v1x,v3x,0.5);
    float thirdY = lerp(v1y,v3y,0.5);
    fill(255,0,0);
    if (levels == 0) {
      triangle(v1x,v1y,v2x,v2y,v3x,v3y);
    }  
    else if (levels >= 1) {
      triangle(v1x,v1y,v2x,v2y,v3x,v3y);
      fill(0,0,0);
      triangle(firstX,firstY,secondX,secondY,thirdX,thirdY);
    }
    if (levels > 1){
       gasket(levels - 1, firstX, firstY, v1x, v1y, thirdX, thirdY);
       gasket(levels - 1, firstX, firstY, v2x, v2y, secondX, secondY);
       gasket(levels - 1, secondX, secondY, v3x, v3y, thirdX, thirdY);
    }
}

void draw() { 
  background(50);  
  
  fill(255);
  text("Click the mouse to increase levels, press a key to decrease levels",20,20);

  gasket(levels,0, height-10, width, height-10, width/2, 10);

 //koch(levels,width-10, height/2,10, height/3 ); 
 //other fractal you can do! This requires a bit more math, or you can look up the coordinates.
}

void mouseClicked(){ 
 if (levels < 10)levels ++;  
}

void keyPressed(){
 if (levels > 0) levels --; 
}
