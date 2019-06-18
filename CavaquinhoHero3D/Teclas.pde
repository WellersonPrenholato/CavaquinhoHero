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
    location.z+=8;                   //note speed, changing this will up the difficulity, putting it too high will make 
  }                                  //it literally impossible
}
