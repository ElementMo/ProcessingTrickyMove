void Trigger() 
{
  if (frameCount < 200) {
    surface.setVisible(false);
  } else {
    surface.setVisible(true);
  }
}
