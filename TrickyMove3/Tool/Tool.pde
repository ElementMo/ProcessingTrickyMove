JSONArray poses;
ArrayList<PVector> points = new ArrayList<PVector>();
PImage cover;

void setup() {
  size(800, 800, P2D);
  poses = new JSONArray();
  stroke(255);
  cover = loadImage("cover.png");
}
void draw() {
  int R = 100;
  background(15, 29, 43);
  image(cover, 200, 200, 375, 450);
  fill(100, 100);
  ellipse(mouseX, mouseY, R*2, R*2);

  for (PVector p : points) {  
    ellipse(p.x, p.y, 10, 10);
  }
  for (int i=0; i<points.size(); i++) {
    for (int j=0; j<points.size(); j++) {
      if (i!=j) {
        if (dist(points.get(i).x, points.get(i).y, points.get(j).x, points.get(j).y) < R) {
          line(points.get(i).x, points.get(i).y, points.get(j).x, points.get(j).y);
        }
      }
    }
  }
}

void mouseClicked() {
  points.add(new PVector(mouseX, mouseY));
}
void mouseDragged() {
  for (PVector p : points) {  
    if (dist(pmouseX, pmouseY, p.x, p.y) < 10) {
      p.x = mouseX;
      p.y = mouseY;
    }
  }
}
void keyPressed() {
  for (int i=0; i<points.size(); i++) {
    JSONArray onepos = new JSONArray();
    onepos.setFloat(0, points.get(i).x);
    onepos.setFloat(1, points.get(i).y);
    poses.setJSONArray(i, onepos);
  }
  println(poses);
  saveJSONArray(poses, "poses.json");
}
