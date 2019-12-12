class snow {
  float x, y, z, vx, vz;
  int lives;
  snow(float _x, float _y, float _z, float _vx, float _vz) {
    x=random(1, 1000);
    y=random(-1500, -500);
    z=random(1, 1000);
    vx=0;
    vz=0;
    lives=1;
  }
  void show() {
    pushMatrix();
    translate(x, y, z);
    fill(#4A9AED);
    stroke(#4A9AED);
    box(1.5);
    popMatrix();
  }


  void act() {
    y=y+15;


    if (y>=220) {
      particles.add(new Particle(x,y,z,direction.x,direction.y));
      y=random(-1000, -800);
      snows.remove(g);
      
      //snows.add(new snow(lx, ly, lz, direction.x, direction.y));
    }
  }
}
