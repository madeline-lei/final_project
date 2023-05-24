PVector pos; // snake position (position of the head)

int size = 40; // snake and food square size
int w, h; // how many snakes can be allocated

int spd = 20; // reverse speed (smaller spd will make the snake move faster)
int len = 4; // snake body

ArrayList<PVector> body = new ArrayList<PVector>();

Ball ball0 = new Ball();
Ball ball1 = new Ball();
Ball ball2 = new Ball();

block block0 = new block();

void setup() {
  size(750, 900);
  w = width/size;
  h = height/size;
  pos = new PVector(w/2, h/2); // Initial snake position
  block0.init();
  fill(0);
}

void draw() {
  background(#FFB9C2);
  drawSnake();
    ball0.drawBall();
    ball1.drawBall();
    ball2.drawBall();
    block0.drawBlock();
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();   
  }
}

//// draw snake, consider the snake array size (each square of size size) + square of the current pos
void drawSnake() {
  color snakeC = color(0, 255, 0);
  fill(snakeC);
  for (PVector segment : body) {
    fill(snakeC);
    square(segment.x, segment.y * size, size);

  }
   }

void updateSnake() {
  body.add(0, pos);
  if(body.size() > len) body.remove(body.size()-1);

//  pos.add(dir);
//  if(pos.equals(food)){
//    spd = max(5, spd-1);
//    newFood();
//    len++;
//  }
//  for(int i = 0; i < snake.size(); i++){
//    if(pos.equals(snake.get(i))){
//      reset();
//      break;
//    }
//  }
//  if( actual_mode.equals("no_border")){
//    if(pos.x >= w) pos.x = 0;
//    if(pos.x < 0) pos.x = w;
//    if(pos.y >= h) pos.y = 0;
//    if(pos.y < 0) pos.y = h;
//  }
//  else if( actual_mode.equals("border")){
//    if(pos.x >= w || pos.x < 0 || pos.y >= h || pos.y < 0)
//      reset();
//  }  
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
