class Notas {
  PVector location;
  Boolean gone=false;

  Notas(int i) {
    location = new PVector(i*100,0); //Localização de onde vai nascer a nota
  }

  void run() {
    display();
    move();
  }

  void display() {
    fill(location.x==0?#00aaaa:location.x==100?#00aa00:location.x==200?#aaaa00:#aa00aa); //Pinta as notas
    rect(location.x, location.y, 100, 50, 40);
    //image(fogo, location.x,location.y, 100, 100);
  }

  void move() { //Movimenta as teclas
    location.y+=2;                   
  }                                 
}
