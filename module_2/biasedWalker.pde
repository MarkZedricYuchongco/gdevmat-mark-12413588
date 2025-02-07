class biasedWalker
{
  float x, y;
  
  void render()
  {
    int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
    int a = int(random(50,100));
    fill(r,g,b,a);
    circle(x, y, 30); 
  }
  
  void randomWalkBiased()
  {
    int rng = int(random(5));
    
    if (rng == 0) //up 20% | 1/5
    {
      y+=10;
    }
    else if (rng == 1) //down 20% | 1/5
    {
      y-=10;
    }
    else if (rng == 2 || rng == 3) //right 40% | 2/5
    {
      x+=10;
    }
    else if (rng == 4) //left 20% | 1/5
    {
      x-=10;
    }
  }
}
