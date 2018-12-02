boolean activeTrigger, deactiveTrigger;
Point p;

void Trigger() 
{
  if (keyPressed) {
    Active();
  } else {
    DeActive();
  }
}


public native void isBuzy();

void Active() {
  activeTrigger = true;
  if (activeTrigger) {
    surface.setSize((int)screen.getWidth(), (int)screen.getHeight());
    activeTrigger = false;
  }
  update();
}

void DeActive() {
  deactiveTrigger = true;
  if (deactiveTrigger) {
    surface.setSize(0, 0);
    deactiveTrigger = false;
  }
}
