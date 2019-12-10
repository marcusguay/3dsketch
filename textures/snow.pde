class snow{
    float x,y,z, vx,vz;
  snow(float _x, float _y, float _z, float _vx, float _vz){
    x=_x;
   y=100;
   z=_z;
   vx=_vx;
   vz=_vz;
    
   }
  void show(){
    pushMatrix();
    translate(x,y,z);
    fill(0);
    stroke(0);
    box(1);
    popMatrix();
  }
  
  
  void act(){
     x=x+vx;
     z=z+vz;
      
      
    }
  
  
}
