class LevelOne {
  
  int firstY = 125;
  boolean blockTouch = false;
  
  ArrayList<Block> blocks = new ArrayList<Block>();
  ArrayList<BlockWall> blockWalls = new ArrayList<BlockWall>();
  

    public LevelOne() {
    blockWalls.add(new BlockWall(firstY));
    blockWalls.add(new BlockWall(firstY + 6*125));
    blockWalls.add(new BlockWall(firstY + 12*125));
    blockWalls.add(new BlockWall(firstY + 18*125));
    blockWalls.add(new BlockWall(firstY + 32*125));
  
    blocks.add(new Block(1, 1, firstY + 2*125));
    blocks.add(new Block(0, 3, firstY + 4*125));
    blocks.add(new Block(1, 1, firstY + 8*125));
    blocks.add(new Block(1, 5, firstY + 8*125));
    blocks.add(new Block(2, 2, firstY + 10*125));
    blocks.add(new Block(2, 4, firstY + 10*125));
    blocks.add(new Block(1, 4, firstY + 14*125));
    blocks.add(new Block(0, 0, firstY + 16*125));
    blocks.add(new Block(1, 2, firstY + 16*125));
    blocks.add(new Block(0, 5, firstY + 16*125));
  }
  
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
      scrollRate = 2;
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
