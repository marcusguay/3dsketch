class Particle{
   float melting;
   float x,y,z,vz,vx;
    float r;
  PVector direction;
  int lives;
Particle(float _x, float _y, float _z, float _vx, float _vz){
   x=_x;
   y=_y;
   z=_z;
   r=1;
   vx=random(PI/2);
   vz=10;
  lives=1;
  melting=255;
   
   }
  
  void show(){
    if(r<60){
    pushMatrix();
   noFill();
  
    translate(x,y+51,z);
   // fill(255,255,255,melting);
    stroke(0);
    rotateX(PI/2);
ellipse(0,0,r,r);
    popMatrix();
    }
    
    
    
    }
    
    
    void act(){
r=r+1;
melting=melting-1;
if(r>60){
 lives=0;
  
}
    }
  
}
