import java.util.Random; 

class food{
  
  //coordinates of the food on the map 
  int x; 
  int y; 
  
  //creates a food object, given the parameters of the map dimensions
  public food(int xlim, int ylim){
    Random rand = new Random(); 
    x = rand.nextInt(xlim); 
    y = rand.nextInt(ylim); 
  }
  
  //checks if snake has eaten food, returns true or false
  public boolean eaten(snake eater){
      if(eater.getX(0) == x && eater.getY(0) == y){
        return true; 
      }
      return false; 
  }
  
  //displays food 
  public void show(){
    fill(255, 87, 51); 
    rect(x*10, y*10, 10, 10); 
  }



}
