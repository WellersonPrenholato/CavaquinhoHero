import processing.sound.*;

ArrayList tile = new ArrayList();
int score=0, recorde =0;
PImage img;
PShape nota;
PImage fundo;
PFont font, font2;
SoundFile musica;
Amplitude rms;

float scale = 3.0;

float smoothFactor = 0.2;

float sum;

void setup(){
   size(1700,950, P3D); 
   noStroke();
   fundo = loadImage("fundo3.png");
   image(fundo,0,0);
   fundo.resize(1700,950);
   img = loadImage("tex_2.jpg");
   nota = createShape(SPHERE, 40); 
   nota.setTexture(img);
   
   // LISTA DE MÚSICAS
    //musica = new SoundFile(this, "Timmy Trumpet  Savage.mp3");
    //musica = new SoundFile(this, "Péssimo Negócio - Dilsinho.mp3");
    musica = new SoundFile(this, "16 Toneladas - Noriel Vilela.mp3");
    //musica = new SoundFile(this, "Bezerra da Silva - Sequestraram a minha sogra.mp3");
    //musica = new SoundFile(this, "Molejo - Cilada.mp3");
    //musica = new SoundFile(this, "Deixa Acontecer - Grupo Revelação - Letra.mp3");
    //musica = new SoundFile(this, "Revelação - Coração Radiante.mp3");
    
    musica.loop();
  
    // Create and patch the rms tracker
    rms = new Amplitude(this);
    rms.input(musica);
    
    // LISTA DE FONTES 
    font = createFont("Bombing.ttf", 72);
    font2 = createFont("Radiant.ttf", 40);
}

void draw(){
  background(fundo);
  //background(0);
  
  int r = (int)random(30, 50);
  
  //camera(width/2.0, height/2.0-320+r, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  camera(width/2, height/2-300, (height/2.0) / tan(PI*30.0 / 180.0), width/2.0, height/2.0, 0, 0, 1, 0);
  
  textAlign(CENTER);
  textSize(72);
  fill(75,0,130);
  textFont(font);
  text("Cavaquinho Hero ",width/2, 100);
    
  // Smooth the rms data by smoothing factor
  sum += (rms.analyze() - sum) * smoothFactor;  
  float rmsScaled = sum * (height/2) * scale;
  
  //Referente a elipse no começo da rampa
  pushMatrix();
  // Draw an ellipse at a size based on the audio analysis
  translate(width/4-420, height/4-130,-690);
  fill((int)random(0, 255),(int)random(0, 255),(int)random(0, 255));
  ellipse(width/2, height/4, rmsScaled, rmsScaled);
  popMatrix();
  
  pushMatrix();
  translate(width/2-150, height/2-100,0);
  stroke(255);
  fill(255,99,71, 120); //Rampa D
  box(100,20,1400);
  translate(105,0,0);
  stroke(255);
  fill(102,205,170, 120); //F
  box(100,20,1400);
  translate(105,0,0);
  stroke(255);
  fill(34,139,34, 120);//J
  box(100,20,1400);
  translate(105,0,0);
  stroke(255);
  fill(255,215,0, 120);
  box(100,20,1400);
  popMatrix();
  
  if ((key=='d'||key=='D') && keyPressed){
    pushMatrix();
    translate(width/2-150, height/2-105,595);
    stroke(255);
    fill(220,20,60);
    box(100,30,20);
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
  }
  if ((key=='f'||key=='F') && keyPressed){
      pushMatrix();
      translate(width/2-150, height/2-105,595);
      stroke(255);
      fill(0);
      box(99,20,20);
      translate(105,0,0);
      stroke(255);
      fill(64,224,208);
      box(100,30,20);
      translate(105,0,0);
      stroke(255);
      fill(0);
      box(99,20,20);
      translate(105,0,0);
      stroke(255,255,0);
      fill(0);
      box(99,20,20);
      popMatrix();
  }
  if ((key=='j'||key=='J') && keyPressed){
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
      fill(85,107,47);
      box(100,30,20);
      translate(105,0,0);
      stroke(255,255,0);
      fill(0);
      box(99,20,20);
      popMatrix();
  }
   if ((key=='k'||key=='K') && keyPressed){
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
      fill(255,165,0);
      box(100,30,20);
      popMatrix();
  }

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
      //score-=10;
      score =0;
      tile.remove(i);
    }
    if (ta.gone==true) {
      score+=1;
      //score+=ta.location.z>400?30:ta.location.z>350?20:10;    //scoring system(you get more points if you do better)
      tile.remove(i); 
    }

  }
  
  //PLACAR
  pushMatrix();
  translate(1400, 250,-100);
  fill(0,0,0, 130);
  box(350,100,0);
  translate(0,10,+10);
  fill(255,0,0, 127);
  textAlign(CENTER);
  textSize(60);
  text("Score: "+score, 0, 0,0);
  popMatrix();
  
  
  if(score > recorde){
    recorde = score;
  }
  
   //Recorde
  pushMatrix();
  translate(1400, 350,-100);
  fill(0,0,0, 130);
  box(350,80,0);
  translate(0,10,+10);
  fill(255,0,0, 127);
  textAlign(CENTER);
  textSize(50);
  text("Record: "+recorde, 0, 0,0);
  popMatrix();
  
  
  //LETRAS
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
