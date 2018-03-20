
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.*;

Box2DProcessing box2d;

import ddf.minim.*;

Minim minim;
AudioPlayer player;

import processing.sound.*;
SoundFile soundfile;


//clase
ArrayList<Particula> particulas;

Surface surface;

int pantalla=0;
int typ;
PImage mountain;
PImage mountain1;
PImage mountain2;

PFont fuente1;
PFont fuente2;

//montaña 1pantalla
float x = 90.0;
float speed = 1.0;
float radius = 4.0;
float angle = 0.0;



void setup(){
  size(800,500);
  background(#7AA8AA);
  
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  
  //gravedad
  box2d.setGravity(0, -20);
  
  particulas = new ArrayList<Particula>();
  surface= new Surface();
  
  mountain = loadImage("montaña.png");
  mountain1 = loadImage("montaña1.jpg"); 
  mountain2 = loadImage("montaña2.jpg"); 
  
  fuente1= loadFont("Tangerine-Bold-48.vlw");
  fuente2= loadFont("Philosopher-Regular-48.vlw");
  
  minim= new Minim(this);
  player = minim.loadFile("viento.mp3");
  
  soundfile= new SoundFile(this, "Sleeping_At_Last.mp3");
  soundfile.play();
  
}

void draw(){
  switch(pantalla){
    case 0: 
      Titulo();
    break;
    
    case 1:
       instrucciones();
    break;
    
    case 2:
       cuerpo();
    break;
  }
}




void Titulo(){
  
  fill(#F2F4F5);
  textAlign(CENTER);
  
  pushMatrix();
  textFont(fuente1);
  textSize(65);
  text("Invierno en la Montaña", 400,130);
  popMatrix();
  
  textFont(fuente2);
  textSize(20);
  text("Presiona N para continuar",400,160);
  
  
  //montaña
  fill(0, 10);
  stroke (255, 40);
  angle = angle - 0.01;
  
  translate(x, height/1.2); 
  rotate(angle); 

    triangle(-50, -50, -50, -50, 30, 30); 
    triangle(-50, -50, -50, -50, 90, 30); 
    triangle(-50, -0, -20, -20, 110, 2); 
  

 x = x + speed;
 if (x > width + radius) {
   x = - radius;
 }
  
  
  if(keyPressed){
    if(key == 'n' || key == 'N'){
      pantalla=1;
    }
  }
  
}




void instrucciones(){
  
  background(#2D6C76);
  
  pushMatrix();
  strokeWeight(30);
  stroke(0, 255, 255, 20);
  //blendMode(DIFFERENCE);
  translate(width/2, height/2);
  for (int q = 0; q < 360; q+=60) {
    pushMatrix();
    rotate(radians(-q));
    for (int i = 0; i < 60; i+=10) {
      float x = 0;
      float y = i*1.5+tan(radians(i+frameCount))*20;
      float s = 20+y/10;
      if (y > 0) {
        line(x-s, y+s/2, x, y);
        line(x+s, y+s/2, x, y);
        fill(20);
      }
    }
    popMatrix();
  }
  popMatrix();
  
  fill(#F2F4F5);
  textFont(fuente2);
  
  textSize(25);
  text("INSTRUCCIONES", 400,70);
  
  textSize(18);
  text("El propósito de 'Invierno en la Montaña' es cambiar nuestro estado de conciencia actual \n a uno de calma libre de tensión y estrés ", 400, 110);
  text("¿Cómo interactuar?",400,180);
  text("TECLAS \n  'V' y 'C' para cambiar de escenario",150,350);
  text("BOTONES DEL MOUSE \n para modificar dirección del viento", 650,350);
  
  
  textSize(15);
  text("Presiona 's' para continuar",650,450);
  
 if(keyPressed){
    if(key == 's' || key == 'S'){
      pantalla=2;
    }
  }
}





void cuerpo(){
  
  background(#B0B2B2);
  
  box2d.step();
  
  
  
  if (random(0.5) < 0.1) {
    float sz = random(1,6);
    Particula p = new Particula(random(width),-10,sz);
    particulas.add(p);
  }
  
  if (mousePressed) {
    if(mouseButton==RIGHT){
      for (Particula b: particulas) {
       Vec2 wind = new Vec2(20,0);
       b.applyForce(wind);
     }
    }
    
    if(mouseButton==LEFT){
      for (Particula b: particulas) {
       Vec2 wind = new Vec2(-20,0);
       b.applyForce(wind);
    } 
  }
 }
 
 surface.display();
 
  for (Particula b: particulas) {
    b.display();
  }
  
  for (int i = particulas.size()-1; i >= 0; i--) {
    Particula b = particulas.get(i);
    if (b.done()) {
      particulas.remove(i);
    }
  } 
}


void mousePressed(){
   if(player.isPlaying()){
     player.pause();
   }
   
   else if (player.position() == player.length() ){
     player.rewind();
     player.play();
   }
   else{
     player.play();
   }
}