ArrayList tile = new ArrayList();
int score=0;
PImage img;


void setup(){
   size(1200,610, P3D); 
   img = loadImage("pericles.jpg");
   //background(img);
}

void draw(){
  background(0);
  camera(width/2.0, height/2.0-320, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  
  pushMatrix();
  
  translate(width/2-150, height/2-100,0);
  
  //stroke(255);
  fill(0,0,156);
  box(100,20,1400);
  translate(105,0,0);
  
  //stroke(255);
  fill(255,0,0);
  box(100,20,1400);
  translate(105,0,0);
  
  //stroke(255);
  fill(0,255,0);
  box(100,20,1400);
  translate(105,0,0);
  
  //stroke(255);
  fill(255,100,100);
  box(100,20,1400);
  popMatrix();
 
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
  
  
  if (frameCount%15==0) {            //amount of notes generates per second, frameCount%10=6 notes/second
    tile.add(til);
  } 
  
  for (int i=0; i<tile.size(); i++) {
    tiles ta = (tiles) tile.get(i);
    //ta.run();
    ta.display();
    ta.move();
    
    if (ta.location.z>1400) {
      tile.remove(i);
      score=0;
    }

    }
}


class tiles {
  PVector location;
  Boolean gone=false;

  tiles(int i) {
    location = new PVector(i*105, 0);
  }

  void run() {
    display();
    move();
  }

  void display() {
    pushMatrix();                                                        //As notas nascem aqui
    translate(width/2-150+location.x, height/2-103,-550+location.z);
    stroke(255);
    noFill();
    sphere(40);
    popMatrix();
     
  }

  void move() {
    location.z+=5;                   //note speed, changing this will up the difficulity, putting it too high will make 
  }                                  //it literally impossible
}
