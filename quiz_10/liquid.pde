public class Liquid
{
  public float x, y;
  public float horizon, depth;
  public float cd;
  
  public Liquid(float x, float y, float horizon, float depth, float cd)
  {
    this.x = x;
    this.y = y;
    this.horizon = horizon;
    this.depth = depth;
    this.cd = cd;
  }
  
  public void render()
  {
    noStroke();
    fill(28, 120, 186);
    beginShape();
    vertex(x - horizon, y, 0);
    vertex(x + horizon, y, 0);
    vertex(x + horizon, y + depth, 0);
    vertex(x - horizon, y + depth, 0);
    endShape();
  }
  
  // checks if a walker is in contact or colliding with liquid
  public boolean isCollidingWith(Walker walker)
  {
    PVector pos = walker.position;
    return pos.x > this.x - this.horizon &&
           pos.x < this.x + this.horizon &&
           pos.y < this.y;
  }
  
  public PVector calculateDragForce(Walker walker)
  {
    // drag magnitude is coefficient of drag * speed squared
    float speed = walker.velocity.mag();
    float dragMagnitude = this.cd * speed * speed;
    
    //direction is inverse of velocity
    PVector dragForce = walker.velocity.copy().mult(-1);
    
    // scale according to magnitude
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
}
