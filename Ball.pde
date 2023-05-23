public class Ball{
   private int magnitude;
   PVector ballPos = new PVector((int) random(size, 1080 - size), height - size);
   public void drawBall() {
      //print(ballPos.x);
      //print(width);
      fill(255, 44, 122); //<>//
      square(ballPos.x, ballPos.y, size);
   }
   
   public void update(){
      // draw
      // move down
      // if snake hits, call eat() then disappear
   }

}
