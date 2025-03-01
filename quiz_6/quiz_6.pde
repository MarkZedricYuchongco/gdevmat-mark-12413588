void setup()
{
  size(1080, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

  int saberLength = 30;

void draw()
{
  background(130);
  
  PVector mouse = mousePos();
  
  mouse.normalize().mult(saberLength);
  
  //saber blade color 1 
  strokeWeight(10);
  stroke(255,50,50);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  //saber blade color 2
  strokeWeight(5);
  stroke(255,100,100);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  println(mouse.mag());
  
  mouse.normalize().mult(30);
  
  //saber handle color 1
  strokeWeight(10);
  stroke(50,50,50);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  //saber handle color 2
  strokeWeight(5);
  stroke(100,100,100);
  line(-mouse.x, -mouse.y, mouse.x, mouse.y);
  
  if (saberLength < 250)
    saberLength += (250 - saberLength) / 10;
  
}
