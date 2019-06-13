ArrayList nota = new ArrayList();
int score=0;
PImage fogo; 

void setup() {
  size(400, 600);
  fogo = loadImage("fogo.png");
}

void draw() {
  background(0); //Fundo preto
  
  Notas til = new Notas(int(random(0, 3.9)));

  fill(#aa0000, 255); //Cor barra de seleção
  rect(0, 450, 400, 150);

  if (frameCount%50==0) {  //Velocidade do movimento das notas
    nota.add(til);
  }
  
  //Cordas
  fill(#aaaaaa);
  rect(40, 0, 30, 600);
  rect(140, 0, 30, 600);
  rect(240, 0, 30, 600);
  rect(340, 0, 30, 600);
  
  for (int i=0; i<nota.size(); i++) {
      Notas ta = (Notas) nota.get(i);
      ta.run();
      ta.display();
      ta.move();
    
      if (key=='a' && ta.location.y>430 && ta.location.x==0.0 && keyPressed) {  //a
        ta.gone=true; 
      }
      if (key=='s' && ta.location.y>430 && ta.location.x==100.0 && keyPressed) {//s
        ta.gone=true;
        //image(fogo, ta.location.x,ta.location.y, 100, 100);
      }
      if (key=='d'&& ta.location.y>430 && ta.location.x==200.0 && keyPressed) {//d
        ta.gone=true;
      }
      if (key=='f' && ta.location.y>430 && ta.location.x==300.0 && keyPressed) {//f
        ta.gone=true;
      }
      
      if (ta.location.y>600) {
        nota.remove(i);
        score=0;
      }
      
      if (ta.gone==true) {
        score+=ta.location.y>530?30:ta.location.y>480?20:10;
        nota.remove(i);
        image(fogo, ta.location.x,ta.location.y, 100, 100);
      }
  }
  
  fill(#0000aa);
  textAlign(CENTER);
  textSize(50);
  text(score, 200, 530);
}
