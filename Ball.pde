public class Ball{
   private int magnitude = (int) random(1, 5);
   PVector ballPos = new PVector((int) random(size, 750 - size), height - size);
   private int txtSize = 15;
   private int ballSize = 20;
   int scrollRate = 1;
   
   public void drawBall() {
      fill(255, 44, 122); //<>//
      circle(ballPos.x, ballPos.y, ballSize);
      fill(#FFFFFF);
      textSize(txtSize); 
      text(magnitude, ballPos.x - txtSize / 4, ballPos.y + txtSize / 3);
      ballPos.y += scrollRate;
   }
   
   public void update(){
      // draw
      // move down
      // if snake hits, call eat() then disappear
   }

}
