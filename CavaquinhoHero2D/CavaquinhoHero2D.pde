import processing.sound.*;

ArrayList nota = new ArrayList();
int score=0;
int z = 20, cont=0; //Divisão dos Frames
PImage fogo, fundo; 
int recorde=0;
float resultAmp, mediaTeste=0; 
SoundFile musica;
FFT fft;
Amplitude amp;

PFont font, font2, font3;
    // Declare a scaling factor
  int scale = 5;
  
  // Define how many FFT bands we want
  int bands = 64;
  
  // declare a drawing variable for calculating rect width
  float r_width;
  
  // Create a smoothing vector
  float[] sum = new float[bands];
  
  // Create a smoothing factor
  float smooth_factor = 0.09;
  
void setup() {
  size(800, 600);
  //fogo = loadImage("fogo.png");
  fundo = loadImage("fundo2.png");
  r_width = width/float(bands);

  //Músicas
  //musica = new SoundFile(this, "Timmy Trumpet  Savage.mp3");
  //musica = new SoundFile(this, "Péssimo Negócio - Dilsinho.mp3");
  musica = new SoundFile(this, "16 Toneladas - Noriel Vilela.mp3");
  //musica = new SoundFile(this, "Bezerra da Silva - Sequestraram a minha sogra.mp3");
  //musica = new SoundFile(this, "Deixa Acontecer - Grupo Revelação - Letra.mp3");
  //musica = new SoundFile(this, "Molejo - Cilada.mp3");
  //musica = new SoundFile(this, "Revelação - Coração Radiante.mp3");
  
  musica.loop();

  // Create and patch the FFT analyzer
  fft = new FFT(this, bands);
  fft.input(musica);
  
  amp = new Amplitude(this);
  amp.input(musica);
  
  //Fontes
  font = createFont("Bombing.ttf", 60);
  font2 = createFont("Radiant.ttf", 60);
  font3 = createFont("varsity_regular.ttf", 60);
  
}

void draw() {

  background(fundo); //Fundo preto
  
   fft.analyze();
   resultAmp = amp.analyze()*100;
   //Notas til =new Notas(-1);
   
   //println(resultAmp);
 
  for (int i = bands-1, j=0; i>= bands/2-1 && j<bands/2; i--, j++) {
    // Smooth the FFT data by smoothing factor
    sum[i] += (fft.spectrum[j] - sum[i]) * smooth_factor;
    // Draw the rects with a scale factor
    rect( i*r_width, height, r_width, -sum[i]*height*scale );
    rect( j*r_width, height, r_width, -sum[i]*height*scale );
    //println("SUM: "+ sum[i]);
   
  }
  
  fill(0,0,128);
  
  //Cria Notas
  Notas til = new Notas(int(random(0, 4)));
  
  //fill(#aa0000, 255); //Cor barra de seleção
  //rect(190, 450, 400, 150);
  // 55% opacity.
  fill(255,0,0,127);
  rect(190,450,400,150, 30,30, 0,0);

  if (frameCount%z ==0) {  //Velocidade do movimento das notas
    nota.add(til);
    cont++;
  }
  
  //Cordas
  textFont(font3);
  fill(#aaaaaa, 150);
  rect(225, 0, 30, 600);
  fill(75,0,130);
  textSize(48);
  text("A ",247, 520);
  
  fill(#aaaaaa, 150);
  rect(325, 0, 30, 600);
  textSize(48);
  fill(75,0,130);
  text("S",340, 520);
  
  fill(#aaaaaa, 150);
  rect(425, 0, 30, 600);
  textSize(48);
  fill(75,0,130);
  text("D",440, 520);
  
  fill(#aaaaaa, 150);
  rect(525, 0, 30, 600);
  textSize(48);
  fill(75,0,130);
  text("F",540, 520);
  
  
  for (int i=0; i<nota.size(); i++) {
      Notas ta = (Notas) nota.get(i);
      ta.run();
      ta.display();
      ta.move();
    
      if ((key=='a'|| key=='A') && ta.location.y>430 && ta.location.x==190 && keyPressed) {  //a
        ta.gone=true; 
      }
      if ((key=='s'|| key=='S') && ta.location.y>430 && ta.location.x==290 && keyPressed) {//s
        ta.gone=true;
        //image(fogo, ta.location.x,ta.location.y, 100, 100);
      }
      if ((key=='d'|| key=='D') && ta.location.y>430 && ta.location.x==390 && keyPressed) {//d
        ta.gone=true;
      }
      if ((key=='f'|| key=='F') && ta.location.y>430 && ta.location.x==490 && keyPressed) {//f
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

  textFont(font);
  fill(0, 124);
  rect(570, 110, 200, 110);
  
  // PLACAR
  fill(#0000aa);
  textAlign(CENTER);
  textSize(40);
  fill(255,0,0);
  text("Cavaquinho\n Hero ",680, 40);
  
  fill(255,215,0);
  textFont(font2);
  textSize(16);
  text("PONTUAÇÃO: ",640, 150);
  textSize(32);
  text(score, 730, 150);
  textSize(16);
  text("RECORDE: ",630, 200);

  if(score > recorde){
    recorde = score;
  }
  
  textSize(32);
  text(recorde, 710, 200);
  fill(25,25,112, 127);
  
}
