 int i = 0;
 
 void setup()
 {
   size(1920, 1080, P3D);
   camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
   background(0);
 }
 
 void draw()
 {
   float gaussian = randomGaussian();
   
   float standardDeviation = 100;
   float mean = 0;
   
   float sizeGaussian = randomGaussian();
   float sizeStandardDeviation = 20;
   float sizeMean = 30;
   
   float x = standardDeviation * gaussian + mean;
   float y = random(-360,360);
   
   float circleSize = sizeStandardDeviation * sizeGaussian + sizeMean;
   
   int r = int(random(0,255));
   int g = int(random(0,255));
   int b = int(random(0,255));
   int a = int(random(10,100));
   
   noStroke();
   
   fill(r,g,b,a);
   circle(x, y, circleSize);
   
   i++;
   
   if (i >= 300)
   {
     background(0);
     i = 0;
   }
     
 }
