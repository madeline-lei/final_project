PVector pos; // snake position (position of the head)

int size = 40; // snake size

int spd = 20; // reverse speed (smaller spd will make the snake move faster)
int len = 4; // snake body

int accum = 0;
int scrollRate = 1;

ArrayList<PVector> body = new ArrayList<PVector>();

ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Block> blocks = new ArrayList<Block>();
int numBalls = 3;

Ball ball0 = new Ball();
Ball ball1 = new Ball();
Ball ball2 = new Ball();

Block block0 = new Block();
Block block1 = new Block();
Block block2 = new Block();
Block block3 = new Block();
Block block4 = new Block();
Block block5 = new Block();

void setup() {
  size(750, 900);
  pos = new PVector(width/2, height/2); // Initial snake position
  colorMode(RGB, 255);
  fill(0);
  
  // initialize objects
  for(int i = 0; i < numBalls; i++) {
    balls.add(new Ball());
    balls.get(i).id = i;
  }

  block0.init();
  block1.init();
  block2.init();
  block3.init();
  block4.init();
  block5.init();

}

void draw() {
  background(#FFB9C2);
  drawSnake();
    //ball0.drawBall();
    //ball1.drawBall();
    //ball2.drawBall();
    
    createFood();
    block0.drawBlock();
    block1.drawBlock();
    block2.drawBlock();
    block3.drawBlock();
    block4.drawBlock();
    block5.drawBlock();

  //if(block0.magnitude > 0) {
  //  block0.drawBlock();
  //}
  //else{
  //   block0.init();
  //}
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();
  }
  fill(0);
  textSize(35);
  text(accum, 20, 40);
}

void drawSnake() {
  colorMode(RGB, 255);
  color snakeC = color(0, 255, 0);
  fill(snakeC);
  for (PVector segment : body) {
    fill(snakeC);
    circle(pos.x, segment.y, size);
  }
  fill(0,0,0);
  textSize(15);
  if(len < 10)
     text(len, pos.x - 3, height/2 +5);
  if(len >= 10)
     text(len, pos.x - 7, height/2 + 5);
}

void updateSnake() {
  // continuously add the new head to the body
  body.add(body.size(), pos);
  
  // remove the excess (old) positions of the body
  if(body.size() > len) {
      body.remove(body.size()-1);
  }
  
  // change the position of the head
  pos = new PVector(pos.x, pos.y + size);
  
}

void mouseMoved() {
  pos.x = constrain(mouseX, 20, width - 20);
}

void changeLen(int magnitude, int direction) {
  for( int i = 0; i < magnitude; i++) {
    len += direction;
    if( direction > 0) {
      PVector addPos = new PVector(mouseX, height/2+size * (len-1));
      body.add(addPos);
    }
    else {
      if(len < 0) {
        reset();
      }
      else {
        body.remove(body.size()-1);
        accum++;
        scrollRate = 1;
      }
    }
    
  }
}


void reset() {
  //len = 4;
  noLoop();
  print("score: " + accum);
  //loop();
}
void createFood() {
  for( int i = 0; i < balls.size(); i++) {
    balls.get(i).drawBall();
  }
}
