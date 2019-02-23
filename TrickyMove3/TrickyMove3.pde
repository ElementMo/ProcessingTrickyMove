JSONArray poses;
JSONArray bgposes;
ArrayList<PVector> points = new ArrayList<PVector>();
ArrayList<PVector> bgpoints = new ArrayList<PVector>();
PFont font;


void setup() {
  fullScreen(P2D);
  surface.setSize(375, 450);
  surface.setLocation(800, 300);
  smooth(10);

  font = createFont("TheSerif HP5 Plain", 50);
  poses = loadJSONArray("poses.json");
  bgposes = loadJSONArray("bgposes.json");

  for (int i=0; i<poses.size(); i++) {
    points.add(new PVector(poses.getJSONArray(i).getFloat(0), poses.getJSONArray(i).getFloat(1)));
  }  
  for (int i=0; i<bgposes.size(); i++) {
    bgpoints.add(new PVector(bgposes.getJSONArray(i).getFloat(0), bgposes.getJSONArray(i).getFloat(1)));
  }
}


void draw() {
  int R = 100;
  background(16, 31, 45);

  beginShape(LINES);
  for (int i=0; i<bgpoints.size(); i++) {
    for (int j=0; j<bgpoints.size(); j++) {
      if (i!=j) {
        if (dist(bgpoints.get(i).x, bgpoints.get(i).y, bgpoints.get(j).x, bgpoints.get(j).y) < R) {
          stroke(random(25), random(50, 60), random(60, 90));
          strokeWeight(0.2);
          vertex(bgpoints.get(i).x, bgpoints.get(i).y);
          stroke(random(30), random(50, 100), random(110, 150));
          strokeWeight(1);
          vertex(bgpoints.get(j).x, bgpoints.get(j).y);
        }
      }
    }
  }

  for (int i=0; i<points.size(); i++) {
    for (int j=0; j<points.size(); j++) {
      if (i!=j) {
        if (dist(points.get(i).x, points.get(i).y, points.get(j).x, points.get(j).y) < R) {
          stroke(random(120, 200), random(100, 220), random(60, 70));
          strokeWeight(random(0.4));
          vertex(points.get(i).x, points.get(i).y);
          stroke(random(40, 110), random(110, 180), random(150, 240));
          strokeWeight(random(1.5));
          vertex(points.get(j).x, points.get(j).y);
        }
      }
    }
  }
  endShape();

  beginShape();
  noStroke();
  fill(0, 0);
  vertex(0, 0);
  vertex(375, 0);
  fill(2, 4, 6, 210);
  vertex(375, 450);
  vertex(0, 450);
  endShape(CLOSE);

  fill(255);
  textFont(font, 60);
  text("Processing 3", 25, 216);
  fill(255, 130);
  textFont(font, 13);
  text("An Open project initiated by Ben Fry and Casey Reas.", 26, 260);
  text("Supported by programmers like you and the nonprofit", 26, 278);
  text("Processing Foundation, 501(c)(3).", 26, 296);
  textFont(font, 10);
  text("@ 2012-2018 The Processing Foundation", 26, 398);
  text("@ 2004-2012 Ben Fry and Casey Reas", 26, 411);
  text("@ 2001-2004 Massachusetts Institude of Technology", 26, 424);

  noLoop();
}
