JSONArray poses;
JSONArray bgposes;
ArrayList<Point> points = new ArrayList<Point>();
ArrayList<Point> bgpoints = new ArrayList<Point>();
PFont font;
int R = 100;

void setup() {
  //size(375, 450, P2D); 
  fullScreen(P2D);
  colorMode(HSB);
  surface.setSize(375, 450);
  surface.setLocation(800, 300);
  smooth(10);

  font = createFont("TheSerif HP5 Plain", 50);
  poses = loadJSONArray("poses.json");
  bgposes = loadJSONArray("bgposes.json");


  for (int i=0; i<bgposes.size(); i++) {
    bgpoints.add(new Point(bgposes.getJSONArray(i).getFloat(0), bgposes.getJSONArray(i).getFloat(1), color(random(145, 150), random(170, 190), random(140, 170), random(20, 130))));
  }

  for (int i=0; i<poses.size(); i++) {
    points.add(new Point(poses.getJSONArray(i).getFloat(0), poses.getJSONArray(i).getFloat(1), color(random(40, 160), random(20, 110), random(180, 240), random(40, 150))));
  }
}


void draw() {
  background(#101F2D);

  drawPlexus(bgpoints, 0.2, 1);
  drawPlexus(points, 0.5, 1.8);

  beginShape();
  noStroke();
  fill(0, 0);
  vertex(0, 0);
  vertex(375, 0);
  fill(140, 150, 5, 210);
  vertex(375, 450);
  vertex(0, 450);
  endShape(CLOSE);


  fill(255);
  textFont(font, 60);
  text("Processing 3", 25, 216);
  fill(#B0C4D0, 180);
  textFont(font, 13);
  text("An Open project initiated by Ben Fry and Casey Reas.", 26, 260);
  text("Supported by programmers like you and the nonprofit", 26, 278);
  text("Processing Foundation, 501(c)(3).", 26, 296);
  textFont(font, 10);
  text("©  2012-2018 The Processing Foundation", 26, 398);
  text("©  2004-2012 Ben Fry and Casey Reas", 26, 411);
  text("©  2001-2004 Massachusetts Institude of Technology", 26, 424);

  fill(#0B151F);
  rect(39, 175, 4, 29);
}

void drawPlexus(ArrayList<Point> _points, float wieght1, float weight2) {
  beginShape(LINES);
  for (int i=0; i<_points.size(); i++) {
    for (int j=0; j<_points.size(); j++) {
      if (i!=j) {
        if (dist(_points.get(i).x, _points.get(i).y, _points.get(j).x, _points.get(j).y) < R) {
          stroke(_points.get(i).col);
          strokeWeight(wieght1);
          vertex(_points.get(i).x, _points.get(i).y);
          stroke(_points.get(j).col);
          strokeWeight(weight2);
          vertex(_points.get(j).x, _points.get(j).y);
        }
      }
    }
  }
  endShape();
}
