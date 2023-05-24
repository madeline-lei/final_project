public class Ball{
   private int magnitude = (int) random(1, 5);
   PVector ballPos = new PVector((int) random(size, 1080 - size), height - size);
   private int txtSize = 20;
   public void drawBall() {
      //print(ballPos.x);
      //print(width);
      fill(255, 44, 122); //<>//
      circle(ballPos.x, ballPos.y, size);
      fill(000);
      textSize(txtSize); 
      text(magnitude, ballPos.x - txtSize / 4, ballPos.y + txtSize / 3);
   }
   
   public void update(){
      // draw
      // move down
      // if snake hits, call eat() then disappear
   }

}
