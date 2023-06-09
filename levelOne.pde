class LevelOne {
    
  ArrayList<Block> blocks = new ArrayList<Block>();
  ArrayList<BlockWall> blockWalls = new ArrayList<BlockWall>();
  ArrayList<Ball> balls = new ArrayList<Ball>();
  
  int textY = -35*125;

  public LevelOne() {
    balls.add(new Ball(2, -1));
    balls.add(new Ball(5, -1));
    balls.add(new Ball(3, -1));
    
    blockWalls.add(new BlockWall(0));
    balls.add(new Ball(4, 2));
    blocks.add(new Block(1, 1, 2));
    balls.add(new Ball(0, 3));
    blocks.add(new Block(2, 4, 3));
    blocks.add(new Block(1, 0, 4));
    blocks.add(new Block(0, 3, 4));
    blocks.add(new Block(2, 2, 4));
    balls.add(new Ball(3, 5));
    
    blockWalls.add(new BlockWall(6));
    balls.add(new Ball(2, 8));
    blocks.add(new Block(1, 1, 8));
    blocks.add(new Block(2, 5, 8));
    blocks.add(new Block(0, 2, 9));
    balls.add(new Ball(0, 9));
    blocks.add(new Block(0, 0, 10));
    blocks.add(new Block(2, 2, 10));
    blocks.add(new Block(1, 4, 10));
    balls.add(new Ball(4, 11));
    
    blockWalls.add(new BlockWall(12));
    blocks.add(new Block(1, 4, 14));
    blocks.add(new Block(2, 2, 15));
    blocks.add(new Block(2, 3, 15));
    balls.add(new Ball(1, 15));
    blocks.add(new Block(0, 0, 16));
    blocks.add(new Block(2, 1, 16));
    blocks.add(new Block(1, 5, 16));
    balls.add(new Ball(5, 17));
    
    blockWalls.add(new BlockWall(18));
    blocks.add(new Block(2, 0, 20));
    blocks.add(new Block(2, 2, 20));
    balls.add(new Ball(2, 21));
    blocks.add(new Block(1, 3, 21));
    blocks.add(new Block(0, 4, 21));
    balls.add(new Ball(5, 21));
    
    blockWalls.add(new BlockWall(23));
    blocks.add(new Block(1, 2, 25));
    balls.add(new Ball(3, 25));
    blocks.add(new Block(2, 4, 25));
    blocks.add(new Block(2, 3, 26));
    blocks.add(new Block(0, 0, 27));
    balls.add(new Ball(0, 28));
    blocks.add(new Block(2, 4, 28));
    blocks.add(new Block(2, 1, 28));
    blocks.add(new Block(1, 5, 28));
    blocks.add(new Block(2, 0, 30));
    blocks.add(new Block(0, 2, 30));
    blocks.add(new Block(2, 3, 30));
    blocks.add(new Block(1, 4, 30));
    balls.add(new Ball(4, 31));
    
    blockWalls.add(new BlockWall(32));
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
    for( Ball b : balls){
      b.drawBall();
    }
    
    if(textY < height/2 - 50)
     textY += scrollRate;
     fill(0);
     textSize(50);
     text( "You Win! Score: " + accum, width /2 - 200, textY);
    
    if(!isTouching()) {
      scrollRate = setScroll;
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
