class Block {
  int magnitude = (int) random(1, 50);
  
  private int blockSize = 125;
  int[] possibleBlocks = new int[6];
  private color blockColor;
  private int txtSize = 30;
  
  //int scrollRate = 1;
  PVector blockPos;
  
  void init() {
    for(int i = 0; i < possibleBlocks.length; i++) {
      possibleBlocks[i] = i*blockSize;
    }
    
    blockPos = new PVector( possibleBlocks[ (int) random(0, possibleBlocks.length)], 0);
  }
  
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
      //blockPos.y++;
    }
    else {
      blockPos.y += scrollRate;
    }
    // otherwise continue scrolling



  }
    else this.init();

  }
boolean isTouching() {
  return blockPos.y == width / 2 - blockSize / 2 - size / 2 && mouseX > blockPos.x && mouseX < blockPos.x + blockSize;
}

}
