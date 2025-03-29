Walker[] walker = new Walker[8];
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.2, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 
  
  reset();
}



void draw()
{
  background(80);
  
  line(0, Window.top, 0, Window.bottom);
  for (Walker w : walker)
  {
    
    // Friction = -1 * mew * N * V
    float mew = 0.01f; // coefficient of friction
    if (w.position.x >= 0)
    {
      mew = 0.4f;
    }
    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy(); // copy copies the current velocity of our walker
    friction.mult(-1);
    friction.normalize();
    friction.mult(frictionMagnitude);
    w.applyForce(friction);
    
    //PVector gravity = new PVector(0, -0.15 * w.mass);
    w.update();
    w.render();
    w.applyForce(wind);
    //w.applyForce(gravity);
  
    if (w.position.y >= Window.top)
    {
      w.position.y = Window.top;
      w.velocity.y *= -1;
    }
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
    if (w.position.x <= Window.left)
    {
      w.position.x = Window.left;
      w.velocity.x *= -1;
    }
    if (w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
  }
}

void mousePressed()
{
  reset();
}

void reset()
{
  int posY = 0;
  
  for (int i = 0; i < walker.length; i++)
  {
    posY = (Window.windowHeight / walker.length) * (i - (walker.length/2));
    walker[i] = new Walker();
    
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    
    walker[i].walkerColor = color(r,g,b);
    walker[i].mass = i+1;
    walker[i].scale = walker[i].mass * 15;
    walker[i].position = new PVector (-500, posY);
  }
}
