class moveAndBounce
{
  
  PVector position = new PVector();
  PVector speed = new PVector(10, 16);
  
  void updatePosition()
  {
  // add speed to the current position
  position.add(speed);
  
  // conditions for bouncing
  if ((position.x > Window.right) || (position.x < Window.left))
  {
    speed.x *= -1;
  }
  
  if ((position.y > Window.top) || (position.y < Window.bottom))
  {
    speed.y *= -1;
  }
  }

  void render()
  {
    // render the circle
    fill(182, 52, 100);
    circle(position.x, position.y, 50);
  }
}
