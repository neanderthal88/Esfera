//Iamneizh Integracion de audio ritmos usando Minim & P3D
//import toxi.processing.*;
import ddf.minim.analysis.*;
import ddf.minim.*;
import processing.video.*;

//libreria para la generacion de colisiones

//import java.awr.Rectangle;




Minim minim;
AudioPlayer jingle;
FFT fft;
AudioInput in;
float[] angle;
float[] y, x,z;


//vida
//Variables globales
int gridscale = 10;
int dnasize;
int lifetime;


//variables coodependientes para ecosistema basado en Freq y Band ftt

//Population population;
int lifecycle;
int recordtime;





//Particulas



//video

Capture video;

void setup()
{
  //size(800, 600, P3D);
    size(displayWidth,displayHeight,P3D);
  minim = new Minim(this);
  in = minim.getLineIn(Minim.STEREO, 2048, 192000.0);
  in = minim.getLineIn();
  fft = new FFT(in.bufferSize(), in.sampleRate());
  y = new float[fft.specSize()];
  x = new float[fft.specSize()];
  z = new float[fft.specSize()];
  angle = new float[fft.specSize()];
/*
  //vida
  dnasize = (width/gridscale) * (height/gridscale);
  lifetime = width/3;

  //lifeycle = 0;
  recordtime = lifetime;
  target = new Obstacle(width-diam-diam/2, height/2-diam/2, diam, diam);
  start = new Obstacle(diam/2,height/2-diam/2,diam,diam);

*/
/*
  // crear la poblacion con un grado de mutacion, y agregar la poblacion maxima
  int popmax = 1000;
  float mutationRate = 0.02;
  population = new Population(mustationRate,popmax);
*/


  //crear el obstaulo en cursor(
  //esta parte es para generar nuevos obstaculos ya sea con el mouse o tacto o cualquier otra entrada

  //obstacle = new ArrayList<Obstacle>();







  //Particulas

  //Particle p1 = new Particle(new Vec2D(100,20));

//Particle p2 = new Particle(new Vec2D(100,20));

  //video
  //video = new Capture(this,width,height);
  //video.start();




  frameRate(240);
}





void draw()
{
  //video.read();
  background(24);
//Particle();
   //physics.addParticle(p1);
    //physics.addParticle(p2);

  //target.display();
//si la generacion no a terminado


fifAtomicSprocket();
  fft.forward(in.mix);
  doubleAtomicSprocket();
  tripleAtomicSprocket();
  quadAtomicSprocket();
}

void doubleAtomicSprocket() {
  noStroke();
  pushMatrix();
  translate(width/2, height/2);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/2048;
    x[i] = x[i] + fft.getFreq(i)/2048;
    z[i] = z[i] + fft.getBand(i)/2048;
    angle[i] = angle[i] + fft.getFreq(i)/2000;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(TWO_PI/angle[i]));
    stroke(fft.getFreq(i)*19,fft.getBand(i)*191,fft.getBand(i)*190);
    fill(fft.getFreq(i)*18, fft.getBand(i)*168, fft.getBand(i)*30);
    pushMatrix();
    translate((x[i]+50)%width/3, (y[i]+50)%height/3, (z[i]+50)%width+height/9);
    box(fft.getBand(i)/2+fft.getFreq(i)/2);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2 );
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/2048;
    x[i] = x[i] + fft.getFreq(i)/2048;
    z[i] = z[i] + fft.getFreq(i)/2048;
    angle[i] = angle[i] + fft.getFreq(i)/100000 ;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(PI/angle[i]));
    stroke(fft.getFreq(i)*168,fft.getFreq(i)*PI,fft.getBand(i)*190);
    fill(255-fft.getBand(i)*4, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+250)%width/3, (y[i]+250)%height/3, (z[i]+250)%width+height/PI);
    box(fft.getBand(i)/20+fft.getFreq(i)/15);

    popMatrix();
  }
  popMatrix();
}

void stop()
{
  // No olvidar cerrar Minim con estas dos ultimas clases
  jingle.close();
  minim.stop();

  super.stop();
}
void tripleAtomicSprocket() {
  noStroke();
  pushMatrix();
  translate(width, height);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/1024;
    x[i] = x[i] + fft.getFreq(i)/1024;
    z[i] = z[i] + fft.getBand(i)/1024;
    angle[i] = angle[i] + fft.getFreq(i)/2000;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(angle[i]/PI));
    stroke(fft.getFreq(i)*2,fft.getBand(i)*150,fft.getBand(i)*255);
    fill(fft.getBand(i)*5, fft.getBand(i)*255, fft.getBand(i)*255);
    pushMatrix();
    translate((x[i]+50)%width/3, (y[i]+50)%height/3, (z[i]+50)%width+height/9);
    box(fft.getBand(i)/20+fft.getFreq(i)/15);

    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/3, height/3 );
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/4096;
    x[i] = x[i] + fft.getFreq(i)/4096;
    z[i] = z[i] + fft.getFreq(i)/4096;
    angle[i] = angle[i] + fft.getFreq(i)/100000 ;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(angle[i]/PI));
    stroke(fft.getFreq(i)*255,fft.getFreq(i)*255,fft.getBand(i)*255);
    fill(55-fft.getBand(i), 255-fft.getBand(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+250)%width, (y[i]+250)%height, (z[i]+250)%width+height/PI);
    box(fft.getBand(i)+fft.getFreq(i));
    line(fft.getBand(i)/20+fft.getFreq(i)/15,fft.getBand(i)/20+fft.getFreq(i)/15,fft.getBand(i)/20+fft.getFreq(i)/15,fft.getBand(i)/20+fft.getFreq(i)/15);
    line(fft.getBand(i)/10+fft.getFreq(i)/35,fft.getBand(i)/30+fft.getFreq(i)/85,fft.getBand(i)/80+fft.getFreq(i)/30,fft.getBand(i)/60+fft.getFreq(i)/40);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/3, height/2 );
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/2048;
    x[i] = x[i] + fft.getFreq(i)/2048;
    z[i] = z[i] + fft.getFreq(i)/2048;
    angle[i] = angle[i] + fft.getFreq(i)/100000 ;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(angle[i]/PI));
    stroke(fft.getFreq(i)*16,fft.getFreq(i)*PI,fft.getBand(i)*16);
    fill(255-fft.getBand(i)*8, 255-fft.getBand(i)*2,255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+250)%width, (y[i]+250)%height, (z[i]+250)%width+height/8);
    box(fft.getBand(i)/8+fft.getFreq(i));
    line(fft.getBand(i)/20+fft.getFreq(i)/15,fft.getBand(i)/20+fft.getFreq(i)/15,fft.getBand(i)/20+fft.getFreq(i)/15,fft.getBand(i)/20+fft.getFreq(i)/15);
    line(fft.getBand(i)/10+fft.getFreq(i)/35,fft.getBand(i)/30+fft.getFreq(i)/85,fft.getBand(i)/80+fft.getFreq(i)/30,fft.getBand(i)/60+fft.getFreq(i)/40);
    popMatrix();
  }
  popMatrix();
}

void quadAtomicSprocket() {
  noStroke();
  pushMatrix();
  translate(width, height);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/4096;
    x[i] = x[i] + fft.getFreq(i)/4096;
    z[i] = z[i] + fft.getBand(i)/4096;
    angle[i] = angle[i] + fft.getFreq(i)/2000;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(angle[i]/PI));
    stroke(fft.getFreq(i)*88,fft.getBand(i)*255,fft.getBand(i)*88);
    fill(fft.getFreq(i)*88, fft.getBand(i)*255, fft.getBand(i)*88);
    pushMatrix();
    translate((x[i]+50)%width/3, (y[i]+50)%height/3, (z[i]+50)%width+height/9);
    box(fft.getBand(i)+fft.getFreq(i));
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width, height);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/4096;
    x[i] = x[i] + fft.getFreq(i)/4096;
    z[i] = z[i] + fft.getFreq(i)/4096;
    angle[i] = angle[i] + fft.getFreq(i)/100000 ;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(angle[i]/PI));
    stroke(fft.getFreq(i)*255,fft.getFreq(i)*255,fft.getBand(i)*TWO_PI);
    fill(255-fft.getBand(i)*PI, 255-fft.getFreq(i)*2,255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+250)%width/2, (y[i]+250)%height/2, (z[i]+250)%width+height/9);
    box(fft.getBand(i)+fft.getFreq(i)/15);
    box(fft.getBand(i)/40+fft.getFreq(i));
    box(fft.getBand(i)/85+fft.getFreq(i));
    popMatrix();
  }
  popMatrix();
}


void fifAtomicSprocket() {
  noStroke();
  pushMatrix();
  translate(width/3, height/3);
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/2048;
    x[i] = x[i] + fft.getFreq(i)/2048;
    z[i] = z[i] + fft.getBand(i)/2048;
    angle[i] = angle[i] + fft.getFreq(i)/2000;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(TWO_PI/angle[i]));
    stroke(fft.getFreq(i)*192,fft.getBand(i)*191,fft.getBand(i)*190);
    fill(fft.getFreq(i)*18, fft.getBand(i)*168, fft.getBand(i)*30);
    pushMatrix();
    translate((x[i]+50)%width/3, (y[i]+50)%height/3, (z[i]+50)%width+height/9);
    box(fft.getBand(i)/2+fft.getFreq(i)/2);
    popMatrix();
  }
  popMatrix();
  pushMatrix();
  translate(width/2, height/2 );
  for (int i = 0; i < fft.specSize() ; i++) {
    y[i] = y[i] + fft.getBand(i)/2048;
    x[i] = x[i] + fft.getFreq(i)/2048;
    z[i] = z[i] + fft.getFreq(i)/2048;
    angle[i] = angle[i] + fft.getFreq(i)/100000 ;
    rotateX(sin(angle[i]/2));
    rotateY(cos(angle[i]/2));
    rotateZ(tan(PI/angle[i]));
    stroke(fft.getFreq(i)*168,fft.getFreq(i)*PI,fft.getBand(i)*190);
    fill(255-fft.getFreq(i)*2, 255-fft.getFreq(i)*2, 255-fft.getBand(i)*2);
    pushMatrix();
    translate((x[i]+250)%width/3, (y[i]+250)%height/3, (z[i]+250)%width+height/PI);
    box(fft.getBand(i)/20+fft.getFreq(i)/15);

    popMatrix();
  }
  popMatrix();
}

/* Particula
Esperemos que rebote de acuerdo a la gravedad*/


/*
class Particle {
VeletParticle2D p;

Particle(Vec2D pos){
  p = new VerletParticle2D(pos);

}
void display()
{
  fill(10,0,150);
  stroke(50,40,0);
  ellipse(p.x.p.y.width/2,height/2);
}
}
*/
