class Bobble
{
  PVector bobblePos;
  PVector speed;
  PImage bobblePic;

  Bobble()
  {
    bobblePic = bobble;
    bobblePos = new PVector(random(200, width-200), random(200, height-200));
    speed = new PVector(random(5), random(5));
  }
  void draw()
  {
    pushMatrix();
    translate(bobblePos.x, bobblePos.y);
    translate(-100, -100);
    image(bobblePic, 0, 0, 200, 200);
    popMatrix();

    bobblePos.add(speed);
    speed.add(new PVector(0, 0.01));

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
