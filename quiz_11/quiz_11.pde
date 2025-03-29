Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();
    
    int x = int(random(Window.left, Window.right));
    int y = int(random(Window.bottom, Window.top));
    
    int r = int(random(255));
    int g = int(random(255));
    int b = int(random(255));
    
    walker[i].walkerColor = color(r,g,b);
    walker[i].mass = i+1;
    walker[i].scale = walker[i].mass * 15;
    walker[i].position = new PVector (x,y);
  }
}

void draw()
{
  background(0);
  
  // F = (G*m1*m2)/r^2*r^2
  // F - gravitational force
  // G - 6.67428*10^-11 m^3/kg/s^2 (1)
  // m1, m2 - objects' masses
  // r - direction from m1 to m2
  // r^2 - distance between the objects
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].update();
    walker[i].render();
    for (int j = 0; j < walker.length; j++)
    {
      if (i != j)
        walker[i].applyForce(walker[j].calculateAttraction(walker[i]));
    }
  }
  
  //bigMatter.update();
  //bigMatter.render();
  
  //smallMatter.update();
  //smallMatter.render();
  
  //smallMatter.applyForce(bigMatter.calculateAttraction(smallMatter));
  //bigMatter.applyForce(smallMatter.calculateAttraction(bigMatter));
}
