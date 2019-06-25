ArrayList nota = new ArrayList();
int score=0;
PImage fogo; 
int recorde=0;

void setup() {
  size(600, 600);
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
    
      if ((key=='a'|| key=='A') && ta.location.y>430 && ta.location.x==0.0 && keyPressed) {  //a
        ta.gone=true; 
      }
      if ((key=='s'|| key=='S') && ta.location.y>430 && ta.location.x==100.0 && keyPressed) {//s
        ta.gone=true;
        //image(fogo, ta.location.x,ta.location.y, 100, 100);
      }
      if ((key=='d'|| key=='D') && ta.location.y>430 && ta.location.x==200.0 && keyPressed) {//d
        ta.gone=true;
      }
      if ((key=='f'|| key=='F') && ta.location.y>430 && ta.location.x==300.0 && keyPressed) {//f
        ta.gone=true;
      }
      
      if (ta.location.y>600) {
        nota.remove(i);
        score=0;
      }
      
      if (ta.gone==true) {
        score+=ta.location.y>530?30:ta.location.y>480?20:10;
        nota.remove(i);
        //image(fogo, ta.location.x,ta.location.y, 100, 100);
      }
  }
  
  fill(#0000aa);
  textAlign(CENTER);
  textSize(24);
  text("Cavaquinho Hero ",490, 30);
  textSize(20);
  text("PONTUAÇÃO: ",500, 100);
  textSize(50);
  text(score, 500, 150);
  
  textSize(20);
  text("Recorde: ",500, 250);

  if(score > recorde){
    recorde = score;
  }
  textSize(50);
  text(recorde, 500, 300);
  
}
