void setup() {
  size(128, 128);
}

void draw() {
  background(0);
  clear();
  fill(0);

  for (int i = 0; i < 128; ++i) {
    float fk = ((float)i) / 128f;
    float fc = pow(min(1f, fk * 2), 2);
    int c = (int)(fk * fk * 255);
    fill(c);
    stroke(c);
    ellipse(64, 64, 128-i, 128-i);
  }
  
  save("sprite.png");
}