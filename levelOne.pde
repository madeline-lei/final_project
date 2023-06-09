class LevelOne {
  
  int firstY = 125;
  
  ArrayList<Block> blocks = new ArrayList<Block>();
  ArrayList<BlockWall> blockWalls = new ArrayList<BlockWall>();
  

  public LevelOne() {
    blockWalls.add(new BlockWall(firstY));  
    blocks.add(new Block(1, 1, firstY + 2*125));
    blocks.add(new Block(2, 4, firstY + 3*125));
    blocks.add(new Block(1, 0, firstY + 4*125));
    blocks.add(new Block(0, 3, firstY + 4*125));
    blocks.add(new Block(2, 2, firstY + 4*125));
    
    blockWalls.add(new BlockWall(firstY + 6*125));
    blocks.add(new Block(1, 1, firstY + 8*125));
    blocks.add(new Block(2, 5, firstY + 8*125));
    blocks.add(new Block(0, 2, firstY + 9*125));
    blocks.add(new Block(0, 0, firstY + 10*125));
    blocks.add(new Block(2, 2, firstY + 10*125));
    blocks.add(new Block(1, 4, firstY + 10*125));
    
    blockWalls.add(new BlockWall(firstY + 12*125));
    blocks.add(new Block(1, 4, firstY + 14*125));
    blocks.add(new Block(2, 2, firstY + 15*125));
    blocks.add(new Block(2, 3, firstY + 15*125));
    blocks.add(new Block(0, 0, firstY + 16*125));
    blocks.add(new Block(2, 1, firstY + 16*125));
    blocks.add(new Block(1, 5, firstY + 16*125));
    
    blockWalls.add(new BlockWall(firstY + 18*125));
    blocks.add(new Block(2, 0, firstY + 20*125));
    blocks.add(new Block(1, 3, firstY + 20*125));
    blocks.add(new Block(2, 4, firstY + 20*125));
    blocks.add(new Block(0, 2, firstY + 21*125));
    blocks.add(new Block(0, 4, firstY + 22*125));
    
    blockWalls.add(new BlockWall(firstY + 23*125));
    blocks.add(new Block(1, 4, firstY + 25*125));
    blocks.add(new Block(2, 2, firstY + 25*125));
    blocks.add(new Block(2, 3, firstY + 26*125));
    blocks.add(new Block(0, 0, firstY + 27*125));
    blocks.add(new Block(2, 1, firstY + 28*125));
    blocks.add(new Block(1, 5, firstY + 28*125));
    blocks.add(new Block(2, 0, firstY + 30*125));
    blocks.add(new Block(0, 2, firstY + 30*125));
    blocks.add(new Block(2, 3, firstY + 30*125));
    blocks.add(new Block(1, 4, firstY + 30*125));
    
    blockWalls.add(new BlockWall(firstY + 32*125));
  }
  
  void drawLevel() {
    if( isTouching()) {
      scrollRate = 0;
    }
    if(isLeftCollide()) {
      leftCollide = true;
    }
    if(isRightCollide()) {
      rightCollide = true;
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
      scrollRate = 2;
    }
    if(!isLeftCollide()) {
      leftCollide = false;
    }
     if(!isRightCollide()) {
      rightCollide = false;
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
  
  boolean isLeftCollide() {
    boolean accum = false;
    for( BlockWall bw : blockWalls) {
      accum |= bw.leftCollide;
    }
    for( Block b : blocks) {
      accum |= b.leftCollision();
    }
    return accum;
  }
  
  boolean isRightCollide() {
    boolean accum = false;
    for( BlockWall bw : blockWalls) {
      accum |= bw.rightCollide;
    }
    for( Block b : blocks) {
      accum |= b.rightCollision();
    }
    return accum;
  }
  
  
}
