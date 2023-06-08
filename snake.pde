PVector pos; // snake position (position of the head)

int size = 40; // snake size

int spd = 20; // reverse speed (smaller spd will make the snake move faster)
int len = 10; // snake body

int accum = 0;
int scrollRate = 1;
//boolean blockHead = false;

ArrayList<PVector> body = new ArrayList<PVector>();

ArrayList<Ball> balls = new ArrayList<Ball>();
ArrayList<Block> blocks = new ArrayList<Block>();
int numBalls = 3;

Ball ball0 = new Ball();
Ball ball1 = new Ball();
Ball ball2 = new Ball();

BlockWall blockWall0 = new BlockWall();

Block block0 = new Block(0);
Block block1 = new Block(0);
Block block2 = new Block(1);
Block block3 = new Block(1);
Block block4 = new Block(2);
Block block5 = new Block(2);

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

}

void draw() {
  background(#FFB9C2);
  drawSnake();
    //ball0.drawBall();
    //ball1.drawBall();
    //ball2.drawBall();
    blockWall0.drawBlockWall();
    createFood();
    //block0.drawBlock();
    //block1.drawBlock();
    //block2.drawBlock();
    //block3.drawBlock();
    //block4.drawBlock();
    //block5.drawBlock();

  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();
  }
  fill(0);
  textSize(35);
  text("score: " + accum, 20, 40);
  //text(scrollRate, 302, 402);
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
  
  if(block0.isTouching() || block1.isTouching() || block2.isTouching() || blockWall0.isTouching) {
    // checking every object is such a band-aid fix
    
    scrollRate = 0;
    // we need to implement some sort of correction
    // i would make every object just equal to their old position in addition to the scrollRate = 0,
    // but that seems like too much hassle
    // also each block moves a diff amt each frame? idk why that is
  }
  else {
    scrollRate = 1;
  }
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
      }
    }
    
  }
     scrollRate = 1;

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
