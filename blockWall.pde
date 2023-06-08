class BlockWall{
  ArrayList<Integer> possibleBlocks = new ArrayList<Integer>();
  int totalBlocks = 6;
  
  ArrayList<Block> blocks = new ArrayList<Block>();
  boolean isTouching = false;
  
  
  public BlockWall(int ystart) {
    for(int i = 0; i < 2; i++) {
      blocks.add(new Block(0));
      blocks.add(new Block(1));
      blocks.add(new Block(2));
    }
    for(int i = 0; i < totalBlocks; i++) {
        possibleBlocks.add(i*blocks.get(i).blockSize);
     }
    
    for( int i = 0; i < totalBlocks; i++) {
      int chosen = (int) random(0, possibleBlocks.size());
      blocks.get(i).blockPos = new PVector( possibleBlocks.get(chosen), -ystart);
      possibleBlocks.remove(chosen);
    }
  }
  
  public void drawBlockWall() {
    isTouching = false;
    for( int i = 0; i < totalBlocks; i++) {
      blocks.get(i).drawBlock();
      isTouching |= blocks.get(i).isTouching();
    }
  }
  
  boolean isOnScreen() {
    return blocks.get(0).isOnScreen();
  }
  
  void changeMagnitude() {
   for(int i = 0; i < totalBlocks; i+=3) {
      blocks.get(i).changeMagnitude(0);
      blocks.get(i+1).changeMagnitude(1);
      blocks.get(i+2).changeMagnitude(2);
    }
  }


}
