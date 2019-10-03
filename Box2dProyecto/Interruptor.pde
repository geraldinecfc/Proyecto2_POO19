class Interruptor {

  float x,y,a,l;
  
  Interruptor(float x_, float y_, float a_, float l_)
  {
    a=a_;
    y=y_;
    x=x_;
    l=l_;
  }
  
  void display()
  {
    image(interruptor,x,y,a,l);
    
  }
  
 
}
