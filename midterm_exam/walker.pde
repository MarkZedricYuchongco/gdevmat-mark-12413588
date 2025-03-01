public class Walker {
  
  public PVector position = new PVector();
  public float scale = 15;
  public int walkerColor;
  
  public Walker()
  {
    walkerColor = color(255);
  }
  
  public void render()
  {
    fill(walkerColor);
    noStroke();
    circle(position.x, position.y, scale);
  }
}
