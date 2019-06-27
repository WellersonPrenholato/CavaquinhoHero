ArrayList tile = new ArrayList();
int score=0;
PImage img;
PShape nota;
PImage fundo;


void setup(){
   size(1700,950, P3D); 
   noStroke();
   fundo = loadImage("fundo3.png");
   image(fundo,0,0);
   fundo.resize(1700,950);
   img = loadImage("metal2.jpg");
   nota = createShape(SPHERE, 40); 
   nota.setTexture(img);
}

void draw(){
  background(fundo);
  
  int r = (int)random(30, 50);
  
  //camera(width/2.0, height/2.0-320+r, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  camera(width/2, height/2-300, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);

  pushMatrix();
  translate(width/2-150, height/2-100,0);
  stroke(255);
  fill(0,0,156);
  box(100,20,1400);
  translate(105,0,0);
  stroke(255);
  fill(255,0,0);
  box(100,20,1400);
  translate(105,0,0);
  stroke(255);
  fill(0,255,0);
  box(100,20,1400);
  translate(105,0,0);
  stroke(255);
  fill(255,255,0);
  box(100,20,1400);
  popMatrix();
  
  pushMatrix();
  translate(width/2-150, height/2-105,595);
  stroke(255);
  fill(0);
  box(99,20,20);
  translate(105,0,0);
  stroke(255);
  fill(0);
  box(99,20,20);
  translate(105,0,0);
  stroke(255);
  fill(0);
  box(99,20,20);
  translate(105,0,0);
  stroke(255,255,0);
  fill(0);
  box(99,20,20);
  popMatrix();
  
  tiles til = new tiles(int(random(0, 3.9)));
  
  
  if (frameCount%40==0) {            //quantidade de notas gera por segundo, frameCount% 15 = 6 notas / segundo
    tile.add(til);
    //System.out.println("valor do frame:"+frameCount);
  } 
  
  for (int i=0; i<tile.size(); i++) {
    tiles ta = (tiles) tile.get(i);
    ta.run();
    //ta.display();
    //ta.move();
    
    if ((key=='d'||key=='D')&&ta.location.x==0.0&&ta.location.z>1110.0&&ta.location.z<1190.0&&keyPressed) {  //d    
      ta.gone=true;
    }
    if ((key=='f'||key=='F')&&ta.location.x==105.0&&ta.location.z>1110.0&&ta.location.z<1190.0&&keyPressed) {//f
      ta.gone=true;
    }
    if ((key=='j'||key=='J')&&ta.location.x==210.0&&ta.location.z>1110.0&&ta.location.z<1190.0&&keyPressed) {//j
      ta.gone=true;
    }
    if ((key=='k'||key=='K')&&ta.location.x==315.0&&ta.location.z>1110.0&&ta.location.z<1190.0&&keyPressed) {//k
      ta.gone=true;
    }    
    
    if (ta.location.z>1400) {
      score-=10;
      tile.remove(i);
    }
    if (ta.gone==true) {
      score+=1;
      //score+=ta.location.z>400?30:ta.location.z>350?20:10;    //scoring system(you get more points if you do better)
      tile.remove(i); 
    }

  }
  
  pushMatrix();
  translate(1400, 300,-100);
  fill(0);
  box(500,100,0);
  translate(0,20,+10);
  fill(255,0,0);
  textAlign(CENTER);
  textSize(80);
  text("Score: "+score, 0, 0,0);
  
  popMatrix();
  
  
  pushMatrix();
  
  translate(width/2-150, height/2-105-11,600);
  rotateX(PI/2);
  fill(255,245,238);
  textAlign(CENTER);
  textSize(15);
  text("D", 0, 0,0);
  translate(105,0,0);
  textAlign(CENTER);
  textSize(15);
  text("F", 0, 0,0);
  translate(105,0,0);
  textAlign(CENTER);
  textSize(15);
  text("J", 0, 0,0);
  translate(105,0,0);
  textAlign(CENTER);
  textSize(15);
  text("K", 0, 0,0);
  popMatrix();
  
}
