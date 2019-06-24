ArrayList tile = new ArrayList();
int score=0;
PImage img;
PShape nota;

void setup(){
   size(1500,610, P3D); 
   noStroke();
   img = loadImage("metal2.jpg");
   nota = createShape(SPHERE, 40); 
   nota.setTexture(img);
}

void draw(){
  background(0);
  
  int r = (int)random(30, 50);
  
  //camera(width/2.0, height/2.0-320+r, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  camera(width/2, height/2-300, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  //camera(mouseX/2, mouseY/2, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
 
  //rotateX(PI*((float)mouseY/(width)));
  //rotateY(PI*((float)mouseX/(height/2)));
  
  //directionalLight(255,255,255,0,0.6,1);
  
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
  translate(width/2-150, height/2-105,395);
  stroke(255);
  fill(0);
  box(99,20,20);
  translate(105,0,0);
  stroke(255);
  fill(0);
  box(100,20,20);
  translate(105,0,0);
  stroke(255);
  fill(0);
  //fill(255,255,255);
  box(100,20,20);
  translate(105,0,0);
  stroke(255,255,0);
  fill(0);
  box(100,20,20);
  popMatrix();
   
   
   //print("X: ", mouseX);
   //print("Y: ", mouseY);
  /*
  pushMatrix();
  translate(width/2-148, height/2-123,380);   //As peças do jogo se movem incrementando o valor em z
  //rotateX(radians(150));
  stroke(255);
  noFill();
  box(98,20,50);
  popMatrix();
  
  
  pushMatrix();
  translate(width/2-150+105, height/2-103,0);
  stroke(255);
  noFill();
  sphere(40);
  popMatrix();
  
  
  pushMatrix();
  translate(width/2-150+210, height/2-103,-330);
  stroke(255);
  noFill();
  sphere(40);
  popMatrix();
  
  
  pushMatrix();
  translate(width/2-150+315, height/2-103,200);
  stroke(255);
  noFill();
  sphere(40);
  popMatrix();
*/
  
  tiles til = new tiles(int(random(0, 3.9)));
  
  
  if (frameCount%15==0) {            //quantidade de notas gera por segundo, frameCount% 15 = 6 notas / segundo
    tile.add(til);
    //System.out.println("valor do frame:"+frameCount);
  } 
  
  for (int i=0; i<tile.size(); i++) {
    tiles ta = (tiles) tile.get(i);
    ta.run();
    //ta.display();
    //ta.move();
    
    if (key=='d'&&ta.location.x==0.0&&ta.location.z>900.0&&ta.location.z<990.0&&keyPressed) {  //d
      
      ta.gone=true;
    }
    if (key=='f'&&ta.location.x==105.0&&ta.location.z>900.0&&ta.location.z<990.0&&keyPressed) {//f
      ta.gone=true;
    }
    if (key=='j'&&ta.location.x==210.0&&ta.location.z>900.0&&ta.location.z<990.0&&keyPressed) {//j
      ta.gone=true;
    }
    if (key=='k'&&ta.location.x==315.0&&ta.location.z>900.0&&ta.location.z<990.0&&keyPressed) {//k
      ta.gone=true;
    }    
    
    if (ta.location.z>1400) {
      score-=1;
      tile.remove(i);
    }
    if (ta.gone==true) {
      score+=1;
      //score+=ta.location.z>400?30:ta.location.z>350?20:10;    //scoring system(you get more points if you do better)
      tile.remove(i); 
    }

  }
  
  fill(255,245,238);
  textAlign(CENTER);
  textSize(100);
  text(score, 200, 200);
}
