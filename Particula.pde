class Particula{
  Body body;
  float r;

  Particula(float x, float y, float r_){
    r= r_;
    
    makeBody(x,y,r);
  }
  
  void killBody() {
    box2d.destroyBody(body);
  }
  
  boolean done() {
    
    Vec2 pos = box2d.getBodyPixelCoord(body);
    if (pos.y > height+r*2) {
      killBody();
      return true;
    }
    return false;
  }
  
  void applyForce(Vec2 force){
    Vec2 pos= body.getWorldCenter();
    body.applyForce(force, pos);
  }
  
  //dibujo de particula
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    
    float a = body.getAngle();
    
    
    //dibujo principal
    switch(key){
      case 'c' | 'C':
      
      pushMatrix();
      translate(pos.x,pos.y);
      rotate(-a);
      fill(6,129,152,60);
      ellipse(0,0,r*2,r*2);
      popMatrix();
        
      typ=0;
      break;
      
      case 'v' | 'V':
      
      pushMatrix();
      translate(pos.x,pos.y);
      rotate(-a);
      fill(189,229,237,60);
      ellipse(0,0,r*2,r*2);
      popMatrix();
        
      typ=1;
      break;
    }
    
    switch(typ){
      case 0:
        key= 'c';
      break;
      
      case 1:
        key= 'v';
      break;
    }
    
    if( key != 'a'){
      if( key != 'A'){
        if(key != 'v'){
          if(key != 'V'){
            
            pushMatrix();
            translate(pos.x,pos.y);
            rotate(-a);
            fill(6,129,152,60);
            ellipse(0,0,r*2,r*2);
            popMatrix();
          }
        }
      }
    }
    
  }
    
    
  
  
  
  //añade particulas a nuestro mundo de box2d
  void makeBody(float x, float y, float r) {
    
    BodyDef bd = new BodyDef();
    
    bd.position = box2d.coordPixelsToWorld(x,y);
    bd.type = BodyType.DYNAMIC;
    body = box2d.world.createBody(bd);
    
    CircleShape cs = new CircleShape();
    cs.m_radius = box2d.scalarPixelsToWorld(r);
    
    FixtureDef fd = new FixtureDef();
    fd.shape = cs;
    // Parameters that affect physics
    fd.density = 1.5;
    fd.friction = 0.00;
    fd.restitution = 0.0;
    
    // Attach fixture to body
    body.createFixture(fd);

    // Give it a random initial velocity (and angular velocity)
    body.setAngularVelocity(random(-10,10));
  }
    
  
}