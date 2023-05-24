public class block {
  private int magnitude;
  private int blockSize = 125;
  private int[] possibleBlocks = new int[6];
  void init() {
     for(int i = 0; i < possibleBlocks.length; i++) {
       possibleBlocks[i] = i*blockSize;
     }
     
  }
  PVector blockPos = new PVector( possibleBlocks[ (int) random(0, possibleBlocks.length)], height - blockSize);

  public void drawBlock() {
    //color blockColor = 
    fill(255, 44, 122);
    square(blockPos.x, blockPos.y, blockSize);

  }
}
