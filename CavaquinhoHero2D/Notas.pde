class Notas {
  PVector location;
  Boolean gone=false;

  Notas(int i) {
    location = new PVector((i*100)+190,0); //Localização de onde vai nascer a nota
    //println(i);  
}

  void run() {
    display();
    move();
  }

  void display() {
    fill(location.x==190?#00aaaa:location.x==290?#00aa00:location.x==390?#ffd700:#aa00aa); //Pinta as notas

    rect(location.x, location.y, 100, 50, 40);
    //image(fogo, location.x,location.y, 100, 100);
  }

  void move() { //Movimenta as teclas
    location.y+=2;                   
  }                                 
}
