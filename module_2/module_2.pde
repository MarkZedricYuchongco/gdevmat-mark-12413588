void setup()
{
  size(1020, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

Walker myWalker = new Walker(); // creates new instance of walker class in sketch
biasedWalker biasedWalker = new biasedWalker();

void draw()
{
  //int rng = int(random(4));
  //println(rng);
  noStroke();
  biasedWalker.randomWalkBiased();
  biasedWalker.render();
  myWalker.randomWalk();
  myWalker.render();
}
