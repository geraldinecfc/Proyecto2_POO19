class BN1
{
  color colb;
  Particle player;
  Boundary bs[] = new Boundary [40];
  Boundary b1;
  Boundary b2;
  Boundary b3;
  Boundary b4;
  BoundaryM bm1;
  Interruptor intn1;
  BN1(color colb_)
  {
    colb=colb_;
  }
  
  void declarar()
  {
 
    player = new Particle (50, 50, 18);
    
    bm1 = new BoundaryM((width/2)+50,height/2,20,120,color(255,255,0));
    
    bs[0] = new Boundary(width/2,(height/2)+50,100,20,colb);
    bs[1] = new Boundary(width/2,(height/2)-50,100,20,colb);
    bs[2] = new Boundary((width/2)-50,height/2,20,120,colb);
    bs[3] = new Boundary((width/2)+105,(height/2)-25,20,170,colb);
    bs[4] = new Boundary(width/2,(height/2)+115,230,20,colb);
    bs[5] = new Boundary((width/2)+55,(height/2)-115,230,20,colb);
    bs[6] = new Boundary((width/2)-115,height/2,20,250,colb);
    bs[7] = new Boundary((width/2)-180,height/2,20,350,colb);
    bs[8] = new Boundary((width/2)+145,(height/2)+180,670,10,colb);
    bs[9] = new Boundary((width/2)+50,(height/2)-180,480,20,colb);
    bs[10] = new Boundary((width/2)-245,(height/2)-22,20,515,colb);
    bs[11] = new Boundary (110,75,180,20,colb);
    bs[12] = new Boundary (155,140,180,20,colb);
    bs[13] = new Boundary (110,205,180,20,colb);
    bs[14] = new Boundary (155,270,180,20,colb);
    bs[15] = new Boundary (110,335,180,20,colb);
    bs[16] = new Boundary (155,400,180,20,colb);
    bs[17] = new Boundary (110,465,180,20,colb);
    bs[18] = new Boundary (155,530,180,10,colb);
    bs[19] = new Boundary ((width/2)+15,530,500,10,colb);
    bs[20] = new Boundary(width-105,530,170,10,colb);
    bs[21] = new Boundary(width-105,(height/2)+115,170,20,colb);
    bs[22] = new Boundary(320,45,20,50,colb);
    bs[23] = new Boundary(380,85,20,50,colb);
    bs[24] = new Boundary(440,45,20,50,colb);
    bs[25] = new Boundary(500,85,20,50,colb);
    bs[26] = new Boundary(560,45,20,50,colb);
    bs[27] = new Boundary(620,85,20,50,colb);
    bs[28] = new Boundary(680,45,20,50,colb);
    bs[29] = new Boundary(740,85,20,50,colb);
    bs[30] = new Boundary(800,210,20,300,colb);
    bs[31] = new Boundary(865,160,20,280,colb);
    bs[32] = new Boundary(width-125,(height/2)+50,130,20,colb);
    bs[33] = new Boundary(930,210,20,300,colb);
    bs[34] = new Boundary((width/2)+240,(height/2)-25,20,170,colb);
    bs[35] = new Boundary((width/2)+175,(height/2)+50,120,20,colb);
    bs[36] = new Boundary((width/2)+175,(height/2)-50,30,20,colb);
    bs[37] = new Boundary((width/2)+175,(height/2),30,5,colb);
    bs[38] = new Boundary(width-265,(height/2)+115,150,20,colb);
    bs[39] = new Boundary((width/2)+105,(height/2)+80,20,50,colb);
    
    intn1 = new Interruptor(width/2,height/2,40,20);
    
  }
  
  void crear()
  {
    
  }
  
  void display()
  {
  
    bm1.display();
    if(bm1.contains(mouseX,mouseY))
    {
      println("OK");
      bm1.mover();
    }
    for(int i=0; i<40;i++)
    {
      bs[i].display();
    }
    
  
    intn1.display();
    player.display();
    
    if(player.contains(intn1.x,intn1.y))
    {
      println("Logrado!");
      pantalla++;
    }
  }
}