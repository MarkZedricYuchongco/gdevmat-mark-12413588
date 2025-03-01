Walker blackhole = new Walker();
Walker[] walkers = new Walker[100];

void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  reset();
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(0);
  
  blackhole.position = mousePos();
  
  float maxSpeed = 50;
  float maxDistance = dist(Window.left, Window.bottom, Window.right, Window.top);
  boolean blackholeAbsorbedAll = true;
  
  for (int i = 0; i < walkers.length; i++)
  {    
    PVector direction = PVector.sub(blackhole.position, walkers[i].position);
    float distance = direction.mag();
    
    if (distance > blackhole.scale / 2)
    {
      blackholeAbsorbedAll = false;
      
      float speed = maxSpeed * (0.5 - (distance / maxDistance));
      speed = constrain(speed, 1, maxSpeed);
      
      direction.normalize().mult(speed);
      walkers[i].position.add(direction);
    }
    
    walkers[i].render();
  }
  
  blackhole.scale = 50;
  blackhole.render();
  
  if (blackholeAbsorbedAll)
  {
    reset();
  }
}

void reset()
{  
  for (int i = 0; i < walkers.length; i++)
  {
    walkers[i] = new Walker();
    
    float x = (float) randomGaussian() * (Window.windowWidth/6);
    float y = (float) randomGaussian() * (Window.windowHeight/6);
    
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    
    walkers[i].position = new PVector (x, y);
    walkers[i].scale = random(5, 20);
    walkers[i].walkerColor = color(r,g,b);
  }
}
