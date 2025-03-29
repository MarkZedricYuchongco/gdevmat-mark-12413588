public class Walker {
  
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();
  
  public int walkerColor;
  
  public float velocityLimit = 10;
  public float scale = 15;
  
  public float mass = 1;
  
  public Walker()
  {
    walkerColor = color(255);
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass);
    //this.acceleration = force; // A = F
    this.acceleration.add(f); // Force accumulation
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration); // velocity accumulation
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);
    this.acceleration.mult(0); // resets acceleration every frame
  }
  
  public void render()
  {
    fill(walkerColor);
    circle(position.x, position.y, scale);
  }
}
