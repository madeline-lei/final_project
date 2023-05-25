public class block {
  private int magnitude;
  private int blockSize = 125;
  private int[] possibleBlocks = new int[6];
  colorMode(HSB, 360, 100, 100);
  private color blockColor = color(260 - magnitude*5, 100, 100);
  void init() {
     for(int i = 0; i < possibleBlocks.length; i++) {
       possibleBlocks[i] = i*blockSize;
     }
     
  }
  PVector blockPos = new PVector( possibleBlocks[ (int) random(0, possibleBlocks.length)], height - blockSize);

  public void drawBlock() {
    colorMode(HSB, 360, 100, 100);
    blockColor = color( 260 - magnitude*5, 100, 100);
    fill(blockColor);
    square(blockPos.x, blockPos.y, blockSize);

  }
}
