
float x=width/2;
float y=height/2;
int n=0;
boolean begin=false;
int speed=1000;
int zoom=50;
float tx=0;
float ty=0;
float zs=2;

void setup() {
  fullScreen();
  background(0);
  fill(255);
}

void draw() {
  zoom += 1;
  background(0);
  pushMatrix();
  translate(width+tx, height/2+ty);
  rotate(PI/2);
  for (int i=0; i<speed; i++) {
    float roll=random(0, 100);
    if (roll<1) {
      x=0;
      y=0.16*y;
    }
    if (roll>1 && roll<8) {
      x=-0.15*x+0.28*y;
      y=0.26*x+0.24*y+0.44;
    }
    if (roll>8 && roll<15) {
      x=0.2*x-0.26*y;
      y=0.23*x+0.22*y+1.6;
    }
    if (roll>15) {
      x=0.85*x+0.04*y;
      y=-0.04*x+0.85*y+1.6;
    }
    fill(random(0, 255), random(0, 255), random(0, 255));
    noStroke();
    if (screenX(x*zoom, y*zoom)>0 && screenX(x*zoom, y*zoom)<width && screenY(x*zoom, y*zoom)>0 && screenY(x*zoom, y*zoom)<height) {
      ellipse(x*zoom, y*zoom, 1, 1);
    }
  }
  println(tx, ty);
  tx=(mouseX-width/2)*20;
  ty=(mouseY-height/2)*20;
  println(mouseX, mouseY);
  popMatrix();
  if (keyPressed) {
    zoom+=zs;
    //zs*=1.1;
  }
  speed=400*zoom;
}

void mouseReleased() {
  zs=2;
  zs*=-1;
}

void keyPressed() {
  if (key=='=') {
    zs*=1.5;
  }
  if (key=='-') {
    tx-=100;
  }
  if (key==']') {
    ty+=100;
  }
  if (key=='[') {
    ty-=100;
  }
  if (key==' ') {
    zoom/=2;
  }
}
