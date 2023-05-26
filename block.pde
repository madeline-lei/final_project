public class block {
   int magnitude;
  private int blockSize = 125;
  private int[] possibleBlocks = new int[6];
  private color blockColor;
  private int txtSize = 30;
  int scrollRate = 1;


  PVector blockPos;
  void init() {
     for(int i = 0; i < possibleBlocks.length; i++) {
       possibleBlocks[i] = i*blockSize;
     }
     blockPos = new PVector( possibleBlocks[ (int) random(0, possibleBlocks.length)], 0);
     magnitude = (int) random(1, 50);

  }

  public void drawBlock() {
    colorMode(HSB, 360, 100, 100);
    blockColor = color( 260 - magnitude*5, 100, 100);
    fill(blockColor);
    square(blockPos.x, blockPos.y, blockSize);
    colorMode(RGB, 255);
    textSize(txtSize); 
    fill(0);
    text(magnitude, blockPos.x + blockSize / 2, blockPos.y + blockSize / 2);
    
    // block stops when hit
    if(blockPos.y == width / 2 - blockSize / 2 - size / 2
       && mouseX > blockPos.x && mouseX < blockPos.x + blockSize) {
          if(frameCount % spd == 0) {
            magnitude--;   
          } 
     }
    else blockPos.y += scrollRate;
    
  }
  
}
