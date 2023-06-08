class Block {
  int magnitude = (int) random(1, 50);
  
  int blockSize = 125;
  //int[] possibleBlocks = new int[6];
  ArrayList<Integer> possibleBlocks = new ArrayList<Integer>();
  int totalBlocks = 6;

  private color blockColor;
  private int txtSize = 30;
  boolean isEaten = false;
  
  //int scrollRate = 1;
  PVector blockPos;
  int type; 
  // 0 = easy block (always breakable), 1 = medium block (near the size), 2 = impossible block
  
  void init( int x, int y){
    blockPos = new PVector(x*125, -y);
  }
  
  public Block(int Itype) {
    int type = Itype;
    if (type == 0) {
      magnitude = (int) random(1, len/2 + 1);
    }
    if (type == 1) {
      magnitude = (int) random(len / 2, len * 1.5);
    }  
    if( type == 2) {
      magnitude = (int) random(len, len * 2);
    }
    
    for(int i = 0; i < totalBlocks; i++) {
      possibleBlocks.add(i*blockSize);
    }
    int chosen = (int) random(1, totalBlocks);
    blockPos = new PVector( possibleBlocks.get(chosen), 0);
    
  }
  //void init() {
  //  for(int i = 0; i < possibleBlocks.length; i++) {
  //    possibleBlocks[i] = i*blockSize;
  //  }
    
  //  blockPos = new PVector( possibleBlocks[ (int) random(0, possibleBlocks.length)], 0);
  //}
  
  public void drawBlock() {
    if( magnitude > 0) {
    colorMode(HSB, 360, 100, 100);
    blockColor = color( 260 - magnitude*5, 100, 100);
    fill(blockColor);
    square(blockPos.x, blockPos.y, blockSize);
    colorMode(RGB, 255);
    textSize(txtSize); 
    fill(0);
    text(magnitude, blockPos.x + blockSize / 2 -10, blockPos.y + blockSize / 2 +8);

    // block stops when hit
    if(isTouching()) {
      if(frameCount % spd == 0) {
        changeLen(1, -1);
        magnitude--;   
      }
     if( magnitude == 0) {
      isEaten = true;
      }
    }
    
    // otherwise continue scrolling
    else {
      blockPos.y += scrollRate;
    }



  }


  }
boolean isTouching() {
  return blockPos.y == width / 2 - blockSize / 2 - size / 2 && mouseX > blockPos.x && mouseX < blockPos.x + blockSize
  && !isEaten;
}

}
