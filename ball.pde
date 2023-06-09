public class Ball { //<>//
   private int magnitude = (int) random(1, 5);
   PVector ballPos;
   private int txtSize = 15;
   private int ballSize = 20;
   public boolean isEaten = false;
   
   int id;
   
   public Ball( float x, int y){
     // input x and y value of the desired block position, and this will adjust
     ballPos = new PVector(x*125 + 65, -(y*125 + 75));
   }
   
   public void drawBall() {
   if (!isEaten) {
    
    // draw the ball
    fill(255, 44, 122);
    circle(ballPos.x, ballPos.y, ballSize);
    fill(#FFFFFF);
    textSize(txtSize); 
    text(magnitude, ballPos.x - txtSize / 4, ballPos.y + txtSize / 3);
    ballPos.y += scrollRate;
    
    // check if the head is on the ball
    if( ballPos.x > mouseX - size && ballPos.x < mouseX + size 
    && ballPos.y > height / 2 - size && ballPos.y < height / 2 ) {
      isEaten = true;
    }
    
    // change the length of the snake
    if(isEaten) {
      changeLen(magnitude, 1);
    }
  }
 }

}
