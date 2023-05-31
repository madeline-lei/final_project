
PVector pos; // snake position (position of the head)

int size = 40; // snake and food square size
int w, h; // how many snakes can be allocated

int spd = 20; // reverse speed (smaller spd will make the snake move faster)
int len = 4; // snake body

ArrayList<PVector> body = new ArrayList<PVector>();

Ball ball0 = new Ball();
Ball ball1 = new Ball();
Ball ball2 = new Ball();

Block block0 = new Block();

void setup() {
  size(750, 900);
  w = width/size;
  h = height/size;
  pos = new PVector(w/2, h/2); // Initial snake position
  block0.init();
  colorMode(RGB, 255);
  fill(0);
}

void draw() {
  background(#FFB9C2);
  drawSnake();
  if( !ball0.isEaten) {
    ball0.drawBall();
  }
    if( !ball1.isEaten) {
    ball1.drawBall();
  }
    if( !ball2.isEaten) {
    ball2.drawBall();
  }
  
    if(block0.magnitude > 0) {
      block0.drawBlock();
    }
    else{
       block0.init();
    }
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();
    

    }

}

void drawSnake() {
  colorMode(RGB, 255);
  color snakeC = color(0, 255, 0);
  fill(snakeC);
  for (PVector segment : body) {
    fill(snakeC);
    circle(segment.x, segment.y * size, size);
  }
  text(len, pos.x, height/2);
   }

void updateSnake() {
  body.add(0, pos);
  if(body.size() > len) body.remove(body.size()-1);

}

//void reset() {
//  spd = 20;
//  len = 5;
//  pos = new PVector(w/2, h/2);
//  dir = new PVector(0, 0);
//  newFood();
//  snake = new ArrayList<PVector>();
//}

void mouseMoved() {
  pos.x = constrain(mouseX, 0, width - size);
}

float getX() {
  return pos.x;
}

float getY() {
  return pos.y;
}

void changeLen(int magnitude) {
  for( int i = 0; i < magnitude; i++) {
    len++;
    body.add(new PVector(mouseX, pos.y+size * (len-1)));
  }
    print(body);

}
