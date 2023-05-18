
ArrayList<PVector> snake = new ArrayList<PVector>(); // snake body (not included the head)
PVector pos; // snake position (position of the head)
StringList mode_list = new StringList(new String[] {"border", "no_border"}); // if you implement both functionalities
int mode_pos = 1; // mode 1 by default - if hits wall wraps around
String actual_mode = mode_list.get(mode_pos); // current mode name
PVector food; // food position

PVector dir = new PVector(0, 0); // snake direction (up, down, left right)

int size = 40; // snake and food square size
int w, h; // how many snakes can be allocated

int spd = 20; // reverse speed (smaller spd will make the snake move faster)
int len = 4; // snake body

void setup() {
  size(1080, 720);
  w = width/size;
  h = height/size;
  
  pos = new PVector(width/4, height/2 - size/2); // Initial snake position
  newFood(); // create 2D vector
  
  noStroke();
  fill(0);
}

void draw() {
  background(200);
  drawSnake();
  drawFood();
  
  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();   
  }
}

// draw the food item (square) which size is the variable size
void drawFood() {
   fill(200, 140, 255);
   rect(food.x*size, food.y*size, size, size);
}

// declare a new pVector (random) for food
void newFood() {
   food = new PVector((int) random (w), (int) random(h));
   for(int i = 0; i < snake.size(); i++){
      if(snake.get(i).equals(food)){
        newFood();
        break;
      }
   }
}

// draw snake, consider the snake array size (each square of size size) + square of the current pos
void drawSnake() {
   fill(30, 190, 30);
   for(int i = 0; i < snake.size(); i++){
     rect(snake.get(i).x*size, snake.get(i).y*size, size, size);
   }
   fill(30, 120, 30);
   rect(pos.x*size, pos.y*size, size, size);
   }

void updateSnake() {
  snake.add(0, pos.copy());
  if(snake.size() > len) snake.remove(snake.size()-1);
  pos.add(dir);
  if(pos.equals(food)){
    spd = max(5, spd-1);
    newFood();
    len++;
  }
  for(int i = 0; i < snake.size(); i++){
    if(pos.equals(snake.get(i))){
      reset();
      break;
    }
  }
  if( actual_mode.equals("no_border")){
    if(pos.x >= w) pos.x = 0;
    if(pos.x < 0) pos.x = w;
    if(pos.y >= h) pos.y = 0;
    if(pos.y < 0) pos.y = h;
  }
  else if( actual_mode.equals("border")){
    if(pos.x >= w || pos.x < 0 || pos.y >= h || pos.y < 0)
      reset();
  }  
}

void reset() {
  spd = 20;
  len = 5;
  pos = new PVector(w/2, h/2);
  dir = new PVector(0, 0);
  newFood();
  snake = new ArrayList<PVector>();
}
