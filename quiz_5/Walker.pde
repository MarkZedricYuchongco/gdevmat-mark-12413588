class Walker
{
  PVector position = new PVector();
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) //up
    {
      position.y+=10;
    }
    else if (rng == 1) //down
    {
      position.y-=10;
    }
    else if (rng == 2) //right
    {
      position.x+=10;
    }
    else if (rng == 3) //left
    {
      position.x-=10;
    }
    else if (rng == 4) //up-right
    {
      position.y+=10;
      position.x+=10;
    }
    else if (rng == 5) //down-right
    {
      position.y-=10;
      position.x+=10;
    }
    else if (rng == 6) //up-left
    {
      position.y+=10;
      position.x-=10;
    }
    else if (rng == 7) //down-left
    {
      position.y-=10;
      position.x-=10;
    }
  }
  
  void render()
  {
    int r = int(random(0,255));
    int g = int(random(0,255));
    int b = int(random(0,255));
    fill(r,g,b,255);
    circle(position.x, position.y, 30); 
  }
}
