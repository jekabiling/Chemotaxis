Fish[] fish = new Fish[100];

void setup()
{
  size(550, 550);
  for (int i = 0; i < fish.length; i++){
    int x = (int)(Math.random() * width);
    int y = (int)(Math.random() * height);
    fish[i] = new Fish(x, y);
  }
}

void draw()
{
  background(0, 149, 182);
  if (mousePressed && mouseButton == LEFT){
    noStroke();
    fill(100, 65, 23);
    ellipse(mouseX, mouseY, 15, 15);
  }

  for (int i = 0; i < fish.length; i++){
    fish[i].move();
    fish[i].show();
  }
}

class Fish
{
  int x;
  int y;
  int c;
  float angle;
  float size;
  Fish(int startX, int startY){
    x = startX;
    y = startY;
    c = color((int)(Math.random() * 200) + 55, (int)(Math.random() * 200) + 55,(int)(Math.random() * 200) + 55);
    angle = (float)(Math.random() * 6);
    size = (float)(Math.random() * 4) + 6;
  }

  void move()
  {
    if (mousePressed && mouseButton == LEFT && Math.random() < 0.5){
      float dx = mouseX - x;
      float dy = mouseY - y;
      float distance = sqrt(dx * dx + dy * dy);
      if (distance > 1)
      {
        x += dx / distance * 2;
        y += dy / distance * 2;
        angle = atan2(dy, dx);
      }
    }
    else{
      angle += (float)(Math.random() * 1.0 - 0.5);
      x += (int)(Math.cos(angle) * 2);
      y += (int)(Math.sin(angle) * 2);
    }
    if (x < 0) x = width;
    if (x > width) x = 0;
    if (y < 0) y = height;
    if (y > height) y = 0;
  }

  void show()
  {
    pushMatrix();
    translate(x, y);
    rotate(angle);

    noStroke();
    fill(c);
    triangle(-size * 0.45, 0, -size * 1.3, -size * 0.8, -size * 1.3, size * 0.8);
    ellipse(0, 0, size * 1.8, size * 1.15);
    stroke(255, 220);

    fill(0);
    ellipse(size * 0.6, -size * 0.15, size * 0.14, size * 0.14);

    popMatrix();
  }
}
