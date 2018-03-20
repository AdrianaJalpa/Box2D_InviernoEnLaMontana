
class Surface{

    ArrayList<Vec2> surface;
    
    Surface() {
    surface = new ArrayList<Vec2>();
    
    // Here we keep track of the screen coordinates of the chain
    surface.add(new Vec2(1,398));
    surface.add(new Vec2(64,373));
    surface.add(new Vec2(68,375));
    surface.add(new Vec2(76,368));
    surface.add(new Vec2(82,369));
    surface.add(new Vec2(90,369));
    surface.add(new Vec2(99,374));
    surface.add(new Vec2(107,366));
    surface.add(new Vec2(113,363));
    surface.add(new Vec2(113,356));
    surface.add(new Vec2(117,352));
    surface.add(new Vec2(121,354));
    surface.add(new Vec2(127,347));
    surface.add(new Vec2(135,342));
    surface.add(new Vec2(139,342));
    surface.add(new Vec2(143,338));
    surface.add(new Vec2(152,349));
    surface.add(new Vec2(177,359));
    surface.add(new Vec2(182,353));
    surface.add(new Vec2(187,355));
    surface.add(new Vec2(187,347));
    surface.add(new Vec2(191,346));
    surface.add(new Vec2(194,335));
    surface.add(new Vec2(199,335));
    surface.add(new Vec2(203,330));
    surface.add(new Vec2(206,332));
    surface.add(new Vec2(208,328));
    surface.add(new Vec2(216,329));
    surface.add(new Vec2(222,332));
    surface.add(new Vec2(229,336));
    surface.add(new Vec2(234,331));
    surface.add(new Vec2(239,331));
    surface.add(new Vec2(242,326));
    surface.add(new Vec2(248,327));
    surface.add(new Vec2(252,320));
    surface.add(new Vec2(256,319));
    surface.add(new Vec2(262,312));
    surface.add(new Vec2(267,313));
    surface.add(new Vec2(270,309));
    surface.add(new Vec2(278,297));
    surface.add(new Vec2(286,302));
    surface.add(new Vec2(291,303));
    surface.add(new Vec2(296,308));
    surface.add(new Vec2(298,312));
    surface.add(new Vec2(302,317));
    surface.add(new Vec2(306,316));
    surface.add(new Vec2(309,319));
    surface.add(new Vec2(315,322));
    surface.add(new Vec2(320,327));
    surface.add(new Vec2(322,333));
    surface.add(new Vec2(328,338));
    surface.add(new Vec2(330,332));
    surface.add(new Vec2(338,329));
    surface.add(new Vec2(346,319));
    surface.add(new Vec2(352,311));
    surface.add(new Vec2(355,312));
    surface.add(new Vec2(358,306));
    surface.add(new Vec2(360,299));
    surface.add(new Vec2(363,294));
    surface.add(new Vec2(365,287));
    surface.add(new Vec2(372,286));
    surface.add(new Vec2(385,272));
    surface.add(new Vec2(390,280));
    surface.add(new Vec2(400,290));
    surface.add(new Vec2(405,297));
    surface.add(new Vec2(408,304));
    surface.add(new Vec2(413,313));
    surface.add(new Vec2(419,314));
    surface.add(new Vec2(422,319));
    surface.add(new Vec2(427,314));
    surface.add(new Vec2(433,322));
    surface.add(new Vec2(440,328));
    surface.add(new Vec2(446,322));
    surface.add(new Vec2(452,330));
    surface.add(new Vec2(465,338));
    surface.add(new Vec2(480,328));
    surface.add(new Vec2(489,322));
    surface.add(new Vec2(498,308));
    surface.add(new Vec2(499,313));
    surface.add(new Vec2(511,303));
    surface.add(new Vec2(514,309));
    surface.add(new Vec2(522,303));
    surface.add(new Vec2(527,307));
    surface.add(new Vec2(532,313));
    surface.add(new Vec2(540,318));
    surface.add(new Vec2(545,317));
    surface.add(new Vec2(548,321));
    surface.add(new Vec2(555,325));
    surface.add(new Vec2(558,320));
    surface.add(new Vec2(572,331));
    surface.add(new Vec2(589,342));
    surface.add(new Vec2(590,337));
    surface.add(new Vec2(594,345));
    surface.add(new Vec2(602,346));
    surface.add(new Vec2(612,356));
    surface.add(new Vec2(615,360));
    surface.add(new Vec2(620,354));
    surface.add(new Vec2(637,356));
    surface.add(new Vec2(645,360));
    surface.add(new Vec2(655,362));
    surface.add(new Vec2(662,364));
    surface.add(new Vec2(664,370));
    surface.add(new Vec2(666,369));
    surface.add(new Vec2(672,375));
    surface.add(new Vec2(682,376));
    surface.add(new Vec2(689,380));
    surface.add(new Vec2(695,382));
    surface.add(new Vec2(703,386));
    surface.add(new Vec2(711,384));
    surface.add(new Vec2(721,393));
    surface.add(new Vec2(733,383));
    surface.add(new Vec2(745,382));
    surface.add(new Vec2(757,373));
    surface.add(new Vec2(768,386));
    surface.add(new Vec2(772,387));
    surface.add(new Vec2(782,396));
    surface.add(new Vec2(785,396));
    surface.add(new Vec2(788,401));
    surface.add(new Vec2(796,411));
    surface.add(new Vec2(801,414));

    // This is what box2d uses to put the surface in its world
    ChainShape chain = new ChainShape();

    // We can add 3 vertices by making an array of 3 Vec2 objects
    Vec2[] vertices = new Vec2[surface.size()];
    for (int i = 0; i < vertices.length; i++) {
      vertices[i] = box2d.coordPixelsToWorld(surface.get(i));     
    }
    
    chain.createChain(vertices,vertices.length);
 
    // The edge chain is now a body!
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    // Shortcut, we could define a fixture if we
    // want to specify frictions, restitution, etc.
    body.createFixture(chain,1);
  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
        
    stroke(255);
    strokeWeight(0.1);
    fill(255);
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
   
    endShape();
    
    switch(key){
      case 'c' | 'C':
        image(mountain1,0,0);
        typ=0;
      break;
      
      case 'v' | 'V':
        image(mountain2,0,0);
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
            image(mountain1,0,0);
          }
        }
      }
    }
  } 
}