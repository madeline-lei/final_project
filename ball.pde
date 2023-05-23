public class Ball{
   private int magnitude;
   PVector pos;
   
   
   public void newBall() {
       pos = new PVector((int) random(w), height);
   }
   
   public void drawBall() {
      fill(255, 44, 122);
      square(pos.x * size, pos.y * size, size);
   }
   public void update(){
      // draw
      // move down
      // if snake hits, call eat() then disappear
   }

}
