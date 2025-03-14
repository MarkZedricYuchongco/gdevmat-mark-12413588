Walker[] myWalker = new Walker[100];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  //myWalker.acceleration = new PVector(-0.01, 0.1);
    
  for (int i = 0; i < myWalker.length; i++)
  {
    myWalker[i] = new Walker();
    
    float x = random(Window.left, Window.right);
    float y = random(Window.bottom, Window.top);
    
    myWalker[i].position = new PVector (x, y);
    myWalker[i].scale = random(5, 20);
  }
}

/* Vector Motion 101

  1. Add velocity to the position
  2. Draw the object at the position
  
*/

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(80);
  
  for (int i = 0; i < myWalker.length; i++)
  {
    PVector direction = PVector.sub(mousePos(), myWalker[i].position);
    direction.normalize();
    
    myWalker[i].acceleration.add(direction);
    myWalker[i].acceleration.mult(0.2);
    myWalker[i].update();
    myWalker[i].render();
  }
}
