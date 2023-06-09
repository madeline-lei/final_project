PVector pos; // snake position (position of the head)
String page = "home";
boolean leftCollide = false;
boolean rightCollide = false;
int size = 40; // snake size


int spd = 5; // reverse speed (smaller spd will make the snake move faster)
int len = 10; // snake body
int setScroll = 6;
int accum = 0;
int scrollRate = setScroll;

ArrayList<PVector> body = new ArrayList<PVector>();

LevelOne lvl1 = new LevelOne();

void setup() {
  size(750, 900);
  pos = new PVector(width/2, height/2); // Initial snake position
  colorMode(RGB, 255);
  fill(0);

}

void draw() {
  if (page.equals("home")){
    homeScreen();
  }
  else{
  background(#FFB9C2);
  drawSnake();
  lvl1.drawLevel();

  // update snake if frameCount is a multiple of spd which is 20 at the begining
  if(frameCount % spd == 0) {
    updateSnake();
  }
  fill(0);
  textSize(35);
  text("score: " + accum, 20, 40);
  
  if(len == 0){
    fill(#FFB9C2);
    square(-5, -5, 915);
    fill(0);
    textSize(50);
    text("You died!", width/2 - 98, height/2 - 50);
    text("final score: " + accum, width/2 - 140, height/2 + 50);
  }
  }
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
  if(len < 1) {
    reset();
  }
  
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
  if (!leftCollide && !rightCollide) pos.x = constrain(mouseX, 20, width - 20);
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

}


void reset() {
  noLoop();
}


void homeScreen(){
  background(#FFB9C2);
  textSize(50);
  fill(0);
  text("Snake vs Block", width/2 - 148, height/2 - 50);
  textSize(20);
  fill(0);
  text("press the space bar to start", width/2 - 105, height/2 + 50);
}

void keyPressed(){
  if (key == 'h'){
    page = "home";
    homeScreen();
  }
  
  if (key == ' '){
    page = "game";
    setup();
  }
  
  //if(key == 1) {
  //  setScroll = 2;
  //}
  
  //if(key == 2) {
  //  setScroll = 10;
  //}
}
