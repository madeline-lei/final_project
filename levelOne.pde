class LevelOne {
  
  static void startLevelOne(){
  int firstY = 125;
  
  // first wall
  BlockWall blockWall0 = new BlockWall(firstY);
  
  Block block6 = new Block(0);
    
  BlockWall blockWall1 = new BlockWall(firstY + 6*125);
  
  BlockWall blockWall2 = new BlockWall(firstY + 19*125);
  
  BlockWall blockWall3 = new BlockWall(firstY + 32*125);

    
  //Block block13 = new Block();
  //  block13.init(1, startY + 9*125);
  //Block block14 = new Block();
  //  block14.init(5, startY + 9*125);
    
  //Block block15 = new Block();
  //  block15.init(1, startY + 11*125);
  //Block block16 = new Block();
  //  block16.init(4, startY + 11*125);
}
}
