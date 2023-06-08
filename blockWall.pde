class BlockWall{
  ArrayList<Integer> possibleBlocks = new ArrayList<Integer>();
  int totalBlocks = 6;
  
  ArrayList<Block> blocks = new ArrayList<Block>();
  boolean isTouching = false;
  
  public BlockWall() {
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
      blocks.get(i).blockPos = new PVector( possibleBlocks.get(chosen), 0);
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


}
