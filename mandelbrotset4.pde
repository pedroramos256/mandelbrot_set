/*

Mandelbrot set

Designed by Pedro Ramos

*/

// if you want you can save the images in pdf
// import processing.pdf.*;
float a; // real part
float b; // imaginary part
float za0 = 0,zb0 = 0,za1 = 0,zb1 = 0; // points to calculate the recursive function Zn+1 = Zn^2 + c, c = a + b*i
int k = 0; // number of iterations
int x;
float f1 = 4,f2 = 2,f3 = 4,f4 = 2; // values of scale
int calc = 51; // maximum number of iterations

void setup(){
  //if fullScreen is used, it takes more time to process the image
  //fullScreen();
  size(1000,1000);//,PDF,"mandelbrot.pdf");
}

void draw(){
  // updates every pixel
  for(float i = 0;i <= width;i++){
    for(float j = 0;j <= height;j++){
      a = f1*(i/width)-f2;
      b = f3*(j/height)-f4;
      // see if it goes to infinity
      while(pow(za0,2)+pow(zb0,2) < 16 && c < calc){
        za1 = za0*za0-zb0*zb0+a;
        zb1 = 2*za0*zb0+b;
        za0 = za1;
        zb0 = zb1;
        c++;
      }
      // if it goes to zero, paints black
      if(pow(za0,2)+pow(zb0,2) < 9){
        stroke(0);
      // if it is in the middle, paints white
      }else if(pow(za0,2)+pow(zb0,2) < 16){
        stroke(255);
      // if it goes to infinity, paints black
      }else{
        stroke(255/calc*c);
      }
      point(i,j);
      c = 0;
      za0 = 0;
      zb0 = 0;
      za1 = 0;
      zb1 = 0;
    }
  }
}

void mousePressed(){
  // doubles the size, so it just shows the quadrant that it was pressed
  f1 = f1/2;
  f3 = f3/2;
  c *= 2;
  if(mouseX > width/2){
    f2 = f2-f1;
  }
  if(mouseY > height/2){
    f4 = f4-f3;
  } 
}
