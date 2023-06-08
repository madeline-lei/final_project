class LevelOne {
  
  int firstY = 125;
  boolean blockTouch = false;
  
  ArrayList<Block> blocks = new ArrayList<Block>();
  ArrayList<BlockWall> blockWalls = new ArrayList<BlockWall>();
  

  public LevelOne() {
  // first wall
    blockWalls.add(new BlockWall(firstY));
    blockWalls.add(new BlockWall(firstY + 6*125));
    blockWalls.add(new BlockWall(firstY + 19*125));
    blockWalls.add(new BlockWall(firstY + 32*125));
  
    blocks.add(new Block(0, 3, firstY + 4*125));
  }

    
  //Block block13 = new Block();
  //  block13.init(1, startY + 9*125);
  //Block block14 = new Block();
  //  block14.init(5, startY + 9*125);
    
  //Block block15 = new Block();
  //  block15.init(1, startY + 11*125);
  //Block block16 = new Block();
  //  block16.init(4, startY + 11*125);
  
  void drawLevel() {
    if( isTouching()) {
      scrollRate = 0;
    }
    
    for( int i = 0; i<blockWalls.size(); i++) {
      if(! blockWalls.get(i).isOnScreen()) {
        // if current blockwall is not on screen, continuously change magnitude based off of snake length
        blockWalls.get(i).changeMagnitude();
      }
    }
    
    for( BlockWall bw : blockWalls) {
      bw.drawBlockWall();
    }
    for( Block b : blocks) {
      b.drawBlock();
    }
    
    
    if(!isTouching()) {
      scrollRate = 1;
    }
  }
  
  boolean isTouching() {
    boolean accum = false;
    for( BlockWall bw : blockWalls) {
      accum |= bw.isTouching;
    }
    for( Block b : blocks) {
      accum |= b.isTouching();
    }
    return accum;
  }
  
}
