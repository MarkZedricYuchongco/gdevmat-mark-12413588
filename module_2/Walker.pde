class Walker
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
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) //up
    {
      y+=10;
    }
    else if (rng == 1) //down
    {
      y-=10;
    }
    else if (rng == 2) //right
    {
      x+=10;
    }
    else if (rng == 3) //left
    {
      x-=10;
    }
    else if (rng == 4) //up-right
    {
      y+=10;
      x+=10;
    }
    else if (rng == 5) //down-right
    {
      y-=10;
      x+=10;
    }
    else if (rng == 6) //up-left
    {
      y+=10;
      x-=10;
    }
    else if (rng == 7) //down-left
    {
      y-=10;
      x-=10;
    }
  }
}
