//import processing.pdf.*;
float a,b,za0 = 0,zb0 = 0,za1 = 0,zb1 = 0;
int c = 0,x;
float f1 = 4,f2 = 2,f3 = 4,f4 = 2,calc = 51;
void setup(){
  //fullScreen();
  size(1000,1000);//,PDF,"mandelbrot.pdf");
  
}

void draw(){
  for(float i = 0;i <= width;i++){
    for(float j = 0;j <= height;j++){
      a = f1*(i/width)-f2;
      b = f3*(j/height)-f4;
      while(pow(za0,2)+pow(zb0,2) < 16 && c < calc){
        za1 = za0*za0-zb0*zb0+a;
        zb1 = 2*za0*zb0+b;
        za0 = za1;
        zb0 = zb1;
        c++;
      } 
      if(pow(za0,2)+pow(zb0,2) < 9){
        stroke(0);
      }else if(pow(za0,2)+pow(zb0,2) < 16){
        stroke(255);
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
