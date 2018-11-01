import java.awt.*;
import com.sun.awt.AWTUtilities;
import processing.awt.PSurfaceAWT;
import java.awt.geom.*;

PVector windowPos = new PVector(500, 500);
PVector relative = new PVector(0, 0);

void setup()
{
  fullScreen();
  surface.setSize(150, 150);
  noStroke();
  frameRate(60);

  PSurfaceAWT awtSurface = (PSurfaceAWT)surface;
  PSurfaceAWT.SmoothCanvas smoothCanvas = (PSurfaceAWT.SmoothCanvas)awtSurface.getNative();
  Frame frame = smoothCanvas.getFrame();  //这部分的参考：https://forum.processing.org/two/discussion/12260/processing-3-init-disappearance

  frame.removeNotify();
  frame.setUndecorated(true);
  frame.setAlwaysOnTop(true);
  frame.setVisible(true);
  frame.addNotify();

  AWTUtilities.setWindowShape(frame, new Ellipse2D.Double(0, 30, 150, 90));
  AWTUtilities.setWindowOpacity(frame, 0.7);
}
void draw()
{
  background(12, 34, 56);
  Point p = MouseInfo.getPointerInfo().getLocation();

  PVector mousePos = new PVector((int)p.getX()-75, (int)p.getY()-70);

  relative = PVector.sub(mousePos, windowPos);
  PVector lerpVector = PVector.lerp(new PVector(0, 0), relative, 0.09);
  windowPos.add(lerpVector);


  surface.setLocation((int)windowPos.x, (int)windowPos.y);
  fill(255);
  ellipse(40, 70, 50, 50);
  ellipse(110, 70, 50, 50);

  fill(0);
  drawEye(40, 70, PVector.sub(mousePos, windowPos));
  drawEye(110, 70, PVector.sub(mousePos, windowPos));
}

void drawEye(int x, int y, PVector relative)
{
  PVector eye_shift = relative;
  eye_shift.add(new PVector(75-x, 0));
  relative.normalize();
  eye_shift.mult(20);
  PVector eye = PVector.add(new PVector(x, y), eye_shift);
  PVector mouse = new PVector(mouseX, mouseY);
  if (PVector.dist(mouse, new PVector(x, y))<20) {
    ellipse(mouseX, mouseY, 11, 11);
  } else {
    ellipse(eye.x, eye.y, 11, 11);
  }
}
