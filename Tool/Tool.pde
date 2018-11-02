PImage xiaohei;
ArrayList<PVector> points = new ArrayList<PVector>();

void setup()
{
  xiaohei = loadImage("xiaohei.png");
  size(450, 450);
}
void draw()
{
  image(xiaohei, 0, 0, width, height);
}
void mousePressed()
{
  points.add(new PVector(mouseX/3, mouseY/3));
  for (PVector p : points)
  {
    print((int)p.x, ",");
  }

  print("Y:");
  for (PVector p : points)
  {
    print((int)p.y, ",");
  }
  print("Size:", points.size());
  println();
}
