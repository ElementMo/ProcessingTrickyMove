import java.awt.*;

void setup()
{
  fullScreen();
  surface.setAlwaysOnTop(true);
}

void draw()
{
  background(0);

  Point p = MouseInfo.getPointerInfo().getLocation();

  int mouse_x = (int)p.getX();

  int screen_w = (int) Toolkit.getDefaultToolkit().getScreenSize().getWidth();
  int screen_h = (int) Toolkit.getDefaultToolkit().getScreenSize().getHeight();

  surface.setSize(screen_w, 1080);
  surface.setLocation(mouse_x-screen_w, 0);
}
