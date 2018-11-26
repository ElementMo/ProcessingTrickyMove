import java.awt.*;
import java.awt.image.*;
import java.io.*;
import javax.imageio.*;

PImage pimg;
PImage bobble;
Bobble[] b = new Bobble[20];

void init() 
{
  Dimension screen = Toolkit.getDefaultToolkit().getScreenSize();
  Rectangle screenRect = new Rectangle(screen);

  try {
    Robot robot = new Robot();
    BufferedImage image = robot.createScreenCapture(screenRect);
    pimg = new PImage(image);
  }
  catch(AWTException e) {
    e.printStackTrace();
  }

  bobble = loadImage("bobble2.png");
  for (int i=0; i<b.length; i++) {
    b[i] = new Bobble();
  }
}

void update() 
{
  for (int i=0; i<b.length; i++) {
    for (int j=0; j<b.length; j++) {
      if (i != j) {
        b[i].collide(b[j]);
      }
    }
    b[i].draw();
  }
}
