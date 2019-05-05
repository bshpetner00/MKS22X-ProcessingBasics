Visualizer v;

int MAX_VALUE = 200;
int MIN_VALUE = -200;


/*You are simulating a visualizer of multiple values
 You need to create a display method first. 
 Then you can make a method that changes the values each time the update is called. 
 */
class Visualizer {
  float x, y;
  float [] values;
  float [] speeds;
  Visualizer(float x, float y) {
    this.x = x;
    this.y = y;
    values = new float[50];
    speeds = new float[50];
    for (int i = 0; i < values.length; i++) {
      values[i] = random(-99, 99);
      speeds[i] = random(4);
    }
  }

  void display() {
    //draw the bars equally spaced inside this box. 
    //You can assume 10, but it would be even better 
    //if you could modify it to be larger increments.
    fill(255);
    rect(x, y, 600, 400);

    //the line is the 0 y-value, the top is 100, the bottom is -100
    line(x, y+200, x+600, y+200);

    //You need to use a loop. You need to make the HEIGHT of the bars 
    //the values in the array.
    //Negative values are red, and go below the line.
    //Positive values are green and go above the line.

    //???WRITE THIS METHOD FIRST!!!
    //THESE ARE WRONG: They just illustrate how they could look
    for (int i = 0; i < values.length; i++) {
       if (values[i] > 0) {
         fill(0,0,0);
       }
       else {
         fill(255,255,255);
       }
       rect(x + i * (600/values.length), y + 200, 600/values.length, values[i]);
       //base x + current increment along x-axis, base y, necessary width, random base y of rectangle
     }
  }
  
  void update() {
    //???WRITE THIS METHOD SECOND!!!
    for (int i = 0; i < values.length; i++) {
      values[i] += speeds[i]; //the speed updates the values. Do not touch this.
      //??? keep them values between max/min value so they stay in the box.
      if (values[i] >= MAX_VALUE || values[i] <= MIN_VALUE) {
        speeds[i] *= -1;
      //??? reverse the speeds so the bar oscillates up/down when it reaches max/min
      }
      
    }
  }
  
}

void setup() {
  size(640, 440);
  v = new Visualizer(20, 20);
}
void draw() {
  background(255);
  v.display();
  v.update();
}
