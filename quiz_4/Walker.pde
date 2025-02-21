public class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  public float r, g, b;
  public float tr = 0, tg = 100, tb = 255;
  public float circleSize;
  public float tcs = 0;
  
  void render()
  {
    r = map(noise(tr), 0, 1, 0, 255);
    g = map(noise(tg), 0, 1, 0, 255);
    b = map(noise(tb), 0, 1, 0, 255);
    circleSize = map(noise(tcs), 0, 1, 5, 150);
    
    tr += 0.1f;
    tg += 0.1f;
    tb += 0.1f;
    tcs += 0.01f;
    
    fill(r,g,b,255);
    circle(x, y, circleSize);
  }
  
  void perlinWalk()
  {
    x = map(noise(tx), 0, 1, -960, 960);
    y = map(noise(ty), 0, 1, -540, 540);
    
    tx += 0.01f;
    ty += 0.01f;
  }
}
