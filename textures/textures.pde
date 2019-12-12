//color pallette
color dirt = #000000;
color white = #FFFFFF;
color wood =#673e07;
color cobblestone=#818181;
color sandb = #fbf406;
color sandstoneb =#8b8708;
color waterb=#0040ff;
color woodb= #fff700;
int bs = 30;
int z=0;
boolean upkey, downkey, leftkey, rightkey, spacekey,vkey,ckey;
float lx=0, ly =height/2- (bs/2), lz=0;
PVector direction=new PVector(0, -10);
PVector Pdirection=new PVector(10, 0);
PImage map, map1, map2, map3, map4, map5, map6; // map7, map8;
float headAngle=0;
//textures
PImage qblock, dT, dS, dB;
PImage cobble, sand, sandstone, water, woodlog, woodplank;
//World manipulation
float rotx = PI/4, roty = PI/4;
int num=1;
ArrayList<Bullet> Bullets;
ArrayList<snow> snows;
ArrayList<Particle> particles;

void setup() {
  size(800, 600, P3D);
 Bullets= new ArrayList<Bullet>();
 snows= new ArrayList<snow>();
particles= new ArrayList<Particle>();
  //load textures
  cobble = loadImage("cobble.jpg");
  sand = loadImage("sand.jpg");
  sandstone = loadImage("sandstone.png");
  water = loadImage("water.jpg");
  woodlog = loadImage("woodlog.jpg");
  woodplank = loadImage("woodplank.jpg");
  qblock      = loadImage("qblock.png");
  dT    = loadImage("dirt_top.png");
  dS   = loadImage("dirt_side.jpg");
  dB = loadImage("dirt_bottom.jpg");
  textureMode(NORMAL);

  //load map
  map   = loadImage("map.png");
  map1 =loadImage("map1.png");
  map2 =loadImage("map2.png");
  map3 =loadImage("map3.png");
  map4 =loadImage("map4.png");
  map5=loadImage("map5.png");
  map6=loadImage("map6.png");
 // map7=loadImage("map7.png");
 // map8=loadImage("map8.png");
}

void draw() {
  background(255);
  pushMatrix();
  
  println(lx,ly,lz);

 // rotateX(rotx);
//  rotateY(roty);
 camera(lx, ly, lz, direction.x+lx, ly+0, direction.y+lz, 0, 1, 0);
  direction.rotate(headAngle);
    headAngle = -(pmouseX-mouseX) *0.01;
      Pdirection=direction.copy();
  Pdirection.rotate(PI/2);
    if (upkey) { 
    lz=lz + direction.y; 
    lx=lx+direction.x;
  }
  if (downkey) { 
    lz=lz - direction.y; 
    lx=lx-direction.x;
  }
  if (leftkey) {
    lx=lx-Pdirection.x;
    lz=lz-Pdirection.y;
  }
  if (rightkey) { 
    lx=lx+Pdirection.x;
    lz=lz+Pdirection.y;
  }
  if (spacekey) {
      Bullets.add(new Bullet(lx,ly,lz,direction.x,direction.y));
  }
  
  if (vkey) {
    ly=ly-10;
  }
  
  if (ckey) {
    ly=ly+10;
  }
  drawMap();
  drawMap1();
  drawMap2();
  drawMap3();
  drawMap4();
  drawMap5();
  drawMap6();
 

  drawFloor(); 
  drawbullets();
  drawSnow();
drawparticles();
 
  popMatrix();
}


void drawSnow(){

int g=0;
PVector direction=new PVector(0,-10);
int p=1000;
  while (z < 500) {
 snows.add(new snow(lx,ly,lz,direction.x,direction.y));
     z++;
}

 while ( g < snows.size()) {
     snow b = snows.get(g);
     b.act();
     b.show();
     g++;
  
  

  
  }
}
  
  void drawparticles(){
    int j=0;
    
    while (j < particles.size()) {
     Particle b = particles.get(j);
     b.act();
     b.show();
      if (b.lives==0) {
     particles.remove(j);}
     j++;
    
  }
}
void drawbullets() {
    int i = 0;
  while (i < Bullets.size()) {
     Bullet b = Bullets.get(i);
     b.act();
     b.show();
     i++;
  
  

  
  }
 
}
void drawFloor() {
  int x = 0;
  int y = height/2 + bs/2;
  stroke(100);
  strokeWeight(1);
  while (x < map.width*bs) {
    line(x, y, 0, x, y, map.height*bs);
    x = x + bs;
  }

  int z = 0;
  while (z < map.height*bs) {
    line(0, y, z, map.width*bs, y, z);
    z = z +bs;
  }

  noStroke();
}


  



void drawMap() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=0;
  while ( mapY < map.height ) {
    //read in a pixel
    color pixel = map.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}
void drawMap1() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=bs;

  while ( mapY < map1.height ) {
    //read in a pixel
    color pixel = map1.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map1.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}

void drawMap2() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=bs*2;
  while ( mapY < map2.height ) {
    //read in a pixel
    color pixel = map2.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map2.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}
void drawMap3() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=bs*3;

  while ( mapY < map3.height ) {
    //read in a pixel
    color pixel = map3.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map3.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}

void drawMap4() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=bs*4;

  while ( mapY < map4.height ) {
    //read in a pixel
    color pixel = map4.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map4.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}
void drawMap5() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=bs*5;

  while ( mapY < map5.height ) {
    //read in a pixel
    color pixel = map5.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map5.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}
void drawMap6() {
  int mapX = 0, mapY = 0;
  int worldX = 0, worldZ = 0;
  int g=bs*6;

  while ( mapY < map6.height ) {
    //read in a pixel
    color pixel = map6.get(mapX, mapY);

    worldX = mapX * bs;
    worldZ = mapY * bs;

    if (pixel == dirt) {
      texturedBox(dT, dS, dB, worldX, (height/2)-g, worldZ, bs/2);
    }
    if (pixel == waterb) {
      texturedBox(water, water, water, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandb) {
      texturedBox(sand, sand, sand, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == sandstoneb) {
      texturedBox(sandstone, sandstone, sandstone, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == wood) {
      texturedBox(woodplank, woodplank, woodplank, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == woodb) {
      texturedBox(woodlog, woodlog, woodlog, worldX, (height/2)-g, worldZ, bs/2);
    }

    if (pixel == cobblestone) {
      texturedBox(cobble, cobble, cobble, worldX, (height/2)-g, worldZ, bs/2);
    }

    mapX++;
    if (mapX > map6.width) {
      mapX = 0; //go back to the start of the row
      mapY++;   //go down to the next row
    }
  }
}

 


void texturedBox(PImage top, PImage side, PImage bottom, float x, float y, float z, float size) {
  pushMatrix();
  translate(x, y, z);
  scale(size);

  //rotateX(rotx);
  //rotateY(roty);

  beginShape(QUADS);
  noStroke();
  texture(side);

  // +Z Front Face
  vertex(-1, -1, 1, 0, 0);
  vertex( 1, -1, 1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  // -Z Back Face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, 1, -1, 1, 1);
  vertex(-1, 1, -1, 0, 1);

  // +X Side Face
  vertex(1, -1, 1, 0, 0);
  vertex(1, -1, -1, 1, 0);
  vertex(1, 1, -1, 1, 1);
  vertex(1, 1, 1, 0, 1);

  // -X Side Face
  vertex(-1, -1, 1, 0, 0);
  vertex(-1, -1, -1, 1, 0);
  vertex(-1, 1, -1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  endShape();

  beginShape();
  texture(bottom);

  // +Y Bottom Face
  vertex(-1, 1, -1, 0, 0);
  vertex( 1, 1, -1, 1, 0);
  vertex( 1, 1, 1, 1, 1);
  vertex(-1, 1, 1, 0, 1);

  endShape();

  beginShape();
  texture(top);

  // -Y Top Face
  vertex(-1, -1, -1, 0, 0);
  vertex( 1, -1, -1, 1, 0);
  vertex( 1, -1, 1, 1, 1);
  vertex(-1, -1, 1, 0, 1);

  endShape();

  popMatrix();
}



void mouseDragged() {
 // rotx = rotx + (pmouseY - mouseY) * 0.01;
 // roty = roty - (pmouseX - mouseX) * 0.01;
}

void keyPressed() {
  if (key == 'w')    upkey = true; 
  if (key == 's')  downkey = true;
  if (key == 'a')  leftkey = true;
  if (key == 'd') rightkey = true;
  if (key == ' ')       spacekey = true;
    if (key == 'v')       vkey = true;
    if(key== 'c') ckey=true;
}

void keyReleased() {
  if (key == 'w')    upkey = false; 
  if (key == 's')  downkey = false;
  if (key == 'a')  leftkey = false;
  if (key == 'd') rightkey = false;
  if (key == 'v')      vkey = false;
    if (key == ' ')       spacekey = false;
    if(key=='c') ckey=false;
}
