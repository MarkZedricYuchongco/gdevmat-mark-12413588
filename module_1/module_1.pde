float sineFrequency = 50;
float sineAmplitude = 75;

// the function that gets called at the first frame
void setup()
{
  size(1920, 1080, P3D); // set window size to 1920, 1080, and also become 3d
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0); // centers camera
}

// the function that gets called every frame
void draw()
{
  background(0,0,0); // sets the background color of the whole window

  //circle(0,0,20); // draws a circle at x,y with thickness
  
  //strokeWeight(1);
  //color white = color(255,255,255); // declares a color variable "white"
  //fill(white); // fills with the color of variable "white"
  //stroke(white); // all the strokes will be the color selected
  //line(1000,0,-1000,0); // draws a line x1,y1,x2,y2
  //line(0,1000,0,-1000); // draws a line x1,y1,x2,y2
  
  drawCartesianPlane();
  drawLinearFunction();
  drawQuadraticFunction();
  drawCircle();
  drawFuncYellow();
  drawFuncPurple();
  drawSineWave(sineFrequency, sineAmplitude);
}

void drawCartesianPlane()
{

  strokeWeight(1);
  color white = color(255,255,255);
  fill(white);
  stroke(white);
  line(300,0,-300,0);
  line(0,300,0,-300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i, 2);
    line(-2, i, 2, i);
  }
}

void drawLinearFunction()
{
  /*
  * f(x) = x + 2
  * Let x = 4, then y = 6  (4,6)
  * Let x = -5, then y = -3  (-5,-3)
  */
  
  color white = color(255,255,255);
  fill(white);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x,x+2,5);
  }
}

void drawQuadraticFunction()
{
  /*
  * f(x) = x^2 + 2x - 5
  * Let x = 2, then y = 3
  * Let x = -1, then y = -6
  */
  
  color green = color(0,255,0);
  fill(green);
  stroke(green);
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x*10, ((float)Math.pow(x,2) + (2*x) - 5), 5);
  }
}

void drawCircle()
{
  /*
  Radius, sine, cosine
  cos = x, sin = y
  */
  
  color blue = color(0,0,255);
  fill(blue);
  stroke(blue);
  float radius = 100;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x)*radius, (float)Math.sin(x)*radius, 5);
  }
}

void drawFuncYellow()
{
  /*
  f(x) = x^2-15x-3
  If x = 3, then y = -39
  If x = 4, then y = -47
  */
  
  color yellow = color(255,255,0);
  fill(yellow);
  stroke(yellow);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x,(float)Math.pow(x,2) - (15*x) - 3, 5);
  }
}

void drawFuncPurple()
{
  /*
  f(x) = -5x+30
  If x = 3, then y = 15
  If x = 4, then y = 10
  */
  
  color purple = color(255,0,255);
  fill(purple);
  stroke(purple);
  
  for (float x = -300; x <= 300; x+=0.1f)
  {
    circle(x,(-5*x)+30,5);
  }
}

void drawSineWave(float sineFrequency, float sineAmplitude)
{
  color cyan = color(0,255,255);
  fill(cyan);
  stroke(cyan);
  for(float i = -300; i <= 300; i+=0.1f)
  {
    float x = (i * sineFrequency);
    float y = (sin(i+millis()*0.05) ) * sineAmplitude;
    if (x <= 300 && x >= -300)
    {
    circle(x,y,1);
    }
    else if (x < -300)
    {
      x = -300;
    }
    else
    {
      x = 300;
    }
  }
}

void keyPressed() {
  
  /*
  Arrows Up and Down to Modify Sine wave Amplitude
  Arrows Left and Right to Modify Sine wave Frequency
  */
  
  if (key == CODED)
  {
    if (keyCode == UP)
    {
      sineAmplitude+=10;
    }
    else if (keyCode == DOWN)
    {
      sineAmplitude-=10;
    }
    else if (keyCode == LEFT)
    {
      sineFrequency-=5;
    }
    else if (keyCode == RIGHT)
    {
      sineFrequency+=5;
    }
  }
}
