PImage xiaohei;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup()
{
  xiaohei = loadImage("xiaohei.png");
  size(150, 150);
}
void draw()
{
  image(xiaohei, 0, 0);
}
void mousePressed()
{
  points.add(new PVector(mouseX, mouseY));
  for (PVector p : points)
  {
    print((int)p.x, (int)p.y, " ");
  }
  println();
}
