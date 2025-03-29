Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 
  
  int posX = 0;
  
  for (int i = 0; i < walker.length; i++)
  {
    posX = 2 * (Window.windowWidth / walker.length) * (i - (walker.length/2));
    walker[i] = new Walker();
    
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    
    walker[i].walkerColor = color(r,g,b);
    walker[i].mass = i+1;
    walker[i].scale = walker[i].mass * 15;
    walker[i].position = new PVector (posX, Window.top + 100);
  }
}



void draw()
{
  background(255);
  
  ocean.render();
  for(Walker w : walker)
  {
    w.render();
    w.update();
    
    PVector gravity = new PVector(0, -0.15f * w.mass);
    PVector wind = new PVector(0.1, 0);
    w.applyForce(gravity); // applying gravity to walker
    w.applyForce(wind);
    
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c * normal;
    PVector friction = w.velocity.copy();
    // F = -uNv
    w.applyForce(friction.mult(-1).normalize().mult(frictionMagnitude)); // applying friction to walker
    
    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
    
    if (w.position.x >= Window.right)
    {
      w.position.x = Window.right;
      w.velocity.x *= -1;
    }
    
    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }
  }
}
