class Block {
  int magnitude = (int) random(1, 50);
  
  int blockSize = 125;
  ArrayList<Integer> possibleBlocks = new ArrayList<Integer>();
  int totalBlocks = 6;
    
  private color blockColor;
  private int txtSize = 30;
  boolean isEaten = false;
  
  //int scrollRate = 1;
  PVector blockPos;
  // boundaries

  float left;
  float right;
  
  int type;
  // 0 = easy block (always breakable), 1 = medium block (near the size), 2 = impossible block
  
  public Block(int Itype, int x, int y) {
    changeMagnitude(Itype);
    blockPos = new PVector(x*125, -y);

    left= blockPos.x;
    right = blockPos.x - blockSize;
  }
  public Block(int Itype) {
     changeMagnitude(Itype);
  }
  
  void changeMagnitude(int type) {
    if (type == 0) {
      magnitude = (int) random(1, len/2 + 1);
    }
    if (type == 1) {
      magnitude = (int) random(len / 2, len * 1.5);
    }  
    if( type == 2) {
      magnitude = (int) random(len, len * 2 + 1);
    }
    if(magnitude == 0) magnitude = 1;
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
      
      left= blockPos.x;
      right = blockPos.x - blockSize;
      
      collision();
      scroll();
  }
}
  
void scroll() {
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
boolean isTouching() {
  // WHY IS THERE WIDTH FOR A y-coor COMPARISION AND WHY DOES IT WORK
  return blockPos.y == width / 2 - blockSize / 2 - size / 2 && mouseX > blockPos.x && mouseX < blockPos.x + blockSize
  && !isEaten;
}


boolean isOnScreen() {
  return blockPos.y > 0 - size * 3 - 5;
}

void collision() {
  // this somehow checks if the mouse is off the screen?????
  if(blockPos.y+blockSize > 360 && blockPos.y > 360 && mouseX == 0) {
       pos = new PVector(pos.x + size, pos.y + size);
  }
}

}
