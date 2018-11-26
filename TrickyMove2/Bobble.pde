class Bobble
{
  PVector bobblePos, speed, acc;
  PImage bobblePic;
  boolean accTrigger;
  int accTimer;

  Bobble()
  {
    bobblePic = bobble;
    bobblePos = new PVector(random(200, width-200), random(200, height-200));
    speed = new PVector(random(5), random(5));
    acc = new PVector(0, 0.01);
  }
  void draw()
  {
    //println(accTimer, frameCount);
    if (frameCount % 4000 == 0) {
      accTrigger = true;
    }
    if (accTrigger) {
      accTimer++;
      if (accTimer<300) {
        acc.y = -0.03;
      } else {
        acc.y = 0.01;
        accTimer = 0;   
        accTrigger = false;
      }
    }

    pushMatrix();
    translate(bobblePos.x, bobblePos.y);
    translate(-100, -100);
    image(bobblePic, 0, 0, 200, 200);
    popMatrix();

    bobblePos.add(speed);
    speed.add(acc);

    if (bobblePos.x < 100) {
      bobblePos.x = 100;
      speed.x *= -1;
    } else if (bobblePos.x > width-100) {
      bobblePos.x = width-100;
      speed.x *= -1;
    } else if (bobblePos.y < 100) {
      bobblePos.y = 100;
      speed.y *= -1;
    } else if ( bobblePos.y > height-100) {
      bobblePos.y = height-100;
      speed.y *= -1;
    }
  }
  void collide(Bobble other)
  {
    float dist = PVector.dist(other.bobblePos, this.bobblePos);
    if (dist <= 200)
    {
      PVector inter = PVector.sub(this.bobblePos, other.bobblePos);
      inter.normalize();
      float mag = speed.mag()*0.9999;
      speed = inter.mult(mag);
      other.speed = speed.copy();
      other.speed.mult(-1);
    }
  }
}
