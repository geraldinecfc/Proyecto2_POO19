import shiffman.box2d.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.joints.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.collision.shapes.Shape;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.contacts.*;

// A reference to our box2d world
Box2DProcessing box2d;


Boundary piso;
Boundary techo;
Boundary paredizq;
Boundary paredder;
BN1 bn1;
//Boundary b1;

ArrayList <Boundary> bs;

color colorest;
color colorest2;

PImage marciano;
PImage interruptor;
PImage pantalla1;
PImage pantalla2;
PImage pantalla4;
int pantalla=1;
void setup()
{
  size(1000, 600);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box2d.listenForCollisions();

  colorest = color(#1E68F7);
  colorest2 = color(#FCBB52);

  marciano = loadImage("marciano.png");
  interruptor = loadImage("interruptor.png");
  pantalla1=loadImage("P1.png");
  pantalla2=loadImage("P2.png");
  pantalla4=loadImage("P4.png");

  piso = new Boundary(width/2, height-10, width, 20, colorest);
  techo = new Boundary(width/2, 10, width, 20, colorest);
  paredder = new Boundary(width-10, height/2, 20, height, colorest);
  paredizq = new Boundary(10, height/2, 20, height, colorest);
  bn1 = new BN1(colorest);
  //b1 = new Boundary (width/2,(height/2)+50,100,20,colorest2);
  
  bs = new ArrayList <Boundary>();

  
}

void draw()
{
  background(180);
  imageMode(CENTER);
  if (pantalla==1)
  {
    image(pantalla1, width/2, height/2);
  }
  if (pantalla==2)
  {
    image(pantalla2, width/2, height/2);
    
  }
  if (pantalla==3)
  {
    box2d.step();
    piso.display();
    techo.display();
    paredder.display();
    paredizq.display();
    bn1.display();

    

    if (keyPressed && keyCode == RIGHT)
    {
      box2d.setGravity(10, 0);
      println("GravedadDerecha");
      keyPressed=false;
    } else if (keyPressed && keyCode == DOWN)
    {
      box2d.setGravity(0, -10);
      println("GravedadAbajo");
      keyPressed=false;
    } else if (keyPressed && keyCode == UP)
    {
      box2d.setGravity(0, 10);
      println("GravedadArriba");
      keyPressed=false;
    } else if (keyPressed && keyCode == LEFT)
    {
      box2d.setGravity(-10, 0);
      println("GravedadIzquierda");
      keyPressed=false;
    }
  }
  
  if (pantalla==4)
  {
    image(pantalla4, width/2, height/2);
    
    if(keyPressed && key == ' ')
    {
      pantalla=1;
    }
  }
}

void mouseClicked()
{
  if (pantalla==1 || pantalla ==2 )
  {
    
    
    if(pantalla==2)
    {
      bn1.declarar();
    }
    pantalla++;
  }
}



void beginContact(Contact cp) {

  Fixture f1 = cp.getFixtureA();
  Fixture f2 = cp.getFixtureB();

  Body b1 = f1.getBody();
  Body b2 = f2.getBody();


  Object o1 = b1.getUserData();
  Object o2 = b2.getUserData();
}

// Objects stop touching each other
void endContact(Contact cp) {
}