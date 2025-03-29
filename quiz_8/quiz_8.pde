Walker[] walker = new Walker[10];
PVector gravity = new PVector(0, -0.4);
PVector wind = new PVector(0.15, 0);

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); 
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    
    walker[i].walkerColor = color(r,g,b);
    walker[i].mass = i+1;
    walker[i].scale = walker[i].mass * 15;
    walker[i].position = new PVector (-500, 200);
  }
}

void draw()
{
  background(80);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].render();
    walker[i].update();
    walker[i].applyForce(wind);
    walker[i].applyForce(gravity);
  
    if (walker[i].position.y <= Window.bottom || walker[i].position.y >= Window.top)
    {
      walker[i].velocity.y *= -1;
    }
    if (walker[i].position.x >= Window.right || walker[i].position.x <= Window.left)
    {
      walker[i].velocity.x *= -1;
    }
  }
}
