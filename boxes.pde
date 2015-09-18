int count = 12;
int step = 360 / count;

void setup() {
  size(displayWidth, displayHeight, P3D);
}

void drawBoxes(float startAngle, float m) {
  float val = (log(sin(radians(frameCount * m))));
  float opacity = (val + 1);
  for (float i = startAngle; i <= startAngle + 360; i+=step) {
    pushMatrix();
      stroke(lerpColor(color(255, 0, 0), color(0, 255, 0), (val + 1) / 2), 255 * opacity);
      rotate(radians(i));
      rotateX(cos(radians(frameCount * m)));
      rotateY(cos(radians(frameCount * m)));
      rotateZ((radians(frameCount * m)));
      translate(0, 100+val*120.0, 200 + (10 * (cos(i / 10))));
      
      // arc(0, 0, 20, 20, 0, TWO_PI);
      box(10, 30, 10);
    popMatrix();
  }
  
}

void draw() {
  float rad = radians(frameCount);
  background(0);
  strokeWeight(1);
  noFill();
  pushMatrix();
    translate(width / 2, height / 2);
    // rotate(rad);
    
    for (float x = 10; x < 40; x++) {
      drawBoxes(3 * x, x / 40);
    }
    
  popMatrix();
}

