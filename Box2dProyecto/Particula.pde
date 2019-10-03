class Particle {

  
  Body body;
  float r;

  color col;


  Particle(float x, float y, float r_) {
    r = r_;
    // colocar particula en mundo de box2d
    makeBody(x, y, r);
    body.setUserData(this);
    col = color(220);
  }

  // elimina la particula del mundo de box2d, no se va a utilizar
  void killBody() {
    box2d.destroyBody(body);
  }

  // cambia el color al ser eliminada, tampoco se va a utilizar
  void change() {
    col = color(255, 0, 0);
  }


 boolean contains(float x, float y) {
    Vec2 worldPoint = box2d.coordPixelsToWorld(x, y);
    Fixture f = body.getFixtureList();
    boolean inside = f.testPoint(worldPoint);
    return inside;
  }
  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }


  // 
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(a);
    fill(col);
    stroke(0);
    strokeWeight(1);
    //ellipse(0, 0, r*2, r*2);
    // Let's add a line so we can see the rotation
    //line(0, 0, r, 0);
    imageMode(CENTER);
    image(marciano,0,0,r*2,r*2);
    popMatrix();
  }

  // Here's our function that adds the particle to the Box2D world
  void makeBody(float x, float y, float r) {
    // Define a body
    BodyDef bd = new BodyDef();
    // Set its position
    bd.position = box2d.coordPixelsToWorld(x, y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.createBody(bd);

    // Make the body's shape a circle
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);

    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1;
    fd.friction = 0.01; //0.01;
    fd.restitution = 0.3; //0.3;

    // Attach fixture to body
    body.createFixture(fd);

    body.setAngularVelocity(random(-10, 10));
  }
}
