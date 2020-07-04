
class snake{
  
  //hold coordinates of snake body 
  ArrayList<Integer> x;   
  ArrayList<Integer> y; 
  
  int snakeLength; 
  boolean alive; 
  
  char dir = 'W'; 
  char[] dirs = {'S', 'N', 'W', 'E'}; 
  int[] xDirs = {0, 0, 1, -1}; 
  int[] yDirs = {1, -1, 0, 0}; 
  
  public snake(){
     x = new ArrayList<Integer>();
     y = new ArrayList<Integer>();
     snakeLength = 1; 
     alive = true; 
     this.addLength(10,10);  //adds starting position of the snake
  }
  
  public int getLength(){
    return snakeLength; 
  }
  
  public void addLength(int xc, int yc){
    x.add(xc); 
    y.add(yc); 
  }
  
  public boolean isAlive(int xLim, int yLim){
    if(getX(0) < 0 || getY(0) < 0 || getX(0) > xLim || getY(0) > yLim){
      //System.out.println(getX(0) + " " + getY(0)); 
      return (alive = false); 
    }
    for(int i = 1; i < x.size(); i++){
      if(getX(0) == getX(i) && getY(0) == getY(i)){
       return (alive = false); 
      }
    }
    return (alive = true); 
  }
  
  //make snake visible on screen 
  public void show(){
    for(int i = 0; i < jerry.size(); i++){
       fill(88, 214, 141); 
       rect(this.getX(i)*10, this.getY(i)*10, 10, 10);
    }
  }
  
  //increments snake length
  public void grow(){
    snakeLength++; 
  }
  
  //always keeps snake to specified length when looped
  public void trimSnake(){
    if(x.size() > snakeLength){
      remLast(); 
    }
  }
  
  //removes last block of snake
  public void remLast(){
    x.remove(x.size()-1); 
    y.remove(y.size()-1); 
  }
  
  //returns arraylist x at elem
  public int getX(int elem){
     return x.get(elem); 
  }
  
  //returns arraylist y at elem
  public int getY(int elem){
    return y.get(elem); 
  }
  
  //returns size of arraylist (not snake length)
  public int size(){
    return x.size(); 
  }
  
  //changes the direction the snake is moving in if it is valid 
  public void changeDir(char c){
    int ddex; 
    if((ddex = contains(dirs, c)) != -1){
      //cannot move backwards on self, because then you would just die abruptly
      if(x.size() < 2 || !(x.get(1)==x.get(0)+xDirs[ddex] && y.get(1)==y.get(0)+yDirs[ddex])){
        dir = c; 
      }
    }
  }
  
  //check if char array contains an element, returns the index
  //used to check valid snake directions
  int contains(char[] cList, char c){
    for(int i = 0; i < cList.length; i++){
      if(cList[i]==c){
        return i; 
      }
    }
    return -1; 
  }
  
  //update lists to move snake in the direction
  public void move(){
     int ddex = contains(dirs, dir);
     x.add(0, x.get(0) + xDirs[ddex]);
     y.add(0, y.get(0) + yDirs[ddex]);  
  }

}
