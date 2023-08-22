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
    pushMatrix();      //As notas nascem aqui
    translate(width/2-150+location.x, height/2-103,-550+location.z);     //em move(), location.z é incrementado para que as notas andem 
    rotate(PI/2);
    noStroke();
    //fill(location.x==0?#0000FF:location.x==105?#FF0000:location.x==210?#00FF00:#FFFF00);
    //sphere(39);    
    shape(nota);
    //System.out.println("x= "+location.x);
    popMatrix();
  }

  void move() {
    location.z+=8;                   //note speed, changing this will up the difficulity, putting it too high will make 
  }                                  //it literally impossible
}
