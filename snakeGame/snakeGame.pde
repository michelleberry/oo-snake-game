
boolean initialStart;
int difficulty; 

//declare objects used in setup/draw 
PImage orangeImg; 
PImage snakeImg; 

snake jerry; 
food snack;

void setup(){
  size(600,500);
  background(255);
  
  initialStart = true; 
  
  orangeImg = loadImage("orange.png"); 
  snakeImg = loadImage("snake.png"); 
}

void draw(){ 
  //show opening / start screen
  if(initialStart == true){
    startScreen(); 
    
  //gameplay 
  } else if(jerry.isAlive(60,50)){
    background(255); 
 
    jerry.show(); 
    snack.show(); 
  
    if(snack.eaten(jerry)){
      snack = new food(60,50);  //spawn new food
      jerry.grow();             //grow 
    }
  
    if(frameCount%difficulty==0){ 
      jerry.move(); 
      jerry.trimSnake(); 
    }
    
  //death screen 
  } else {
     deathScreen(); 
  } 
}

//recieve keyboard input
void keyPressed(){
  char newDir = 'x'; 
  if(key == CODED){
    if(keyCode == UP){ newDir = 'N'; } 
    else if(keyCode == DOWN){ newDir = 'S'; } 
    else if(keyCode == LEFT){ newDir = 'E'; } 
    else if(keyCode == RIGHT){ newDir = 'W'; }
    jerry.changeDir(newDir); 
  }
}

void startScreen(){
  background(249, 231, 159); 
  
  fill(40, 180, 99); 
  textSize(50); 
  text("SNAKE GAME", 150, 100); 
  
  image(snakeImg, -100, -100); 
  image(orangeImg, 400, 150); 
  
  difficultyButtons(); 
  
  fill(0,0,0);  
  textSize(15); 
  text("Click to start - Use arrow keys to play - Eat the oranges to grow longer", 40, 450);
  
  difficultyButtonSensor(); 

}

void deathScreen(){
  background(255,0,0);
  fill(0); 
  stroke(90); 
  textSize(30);
  text("GAME OVER! ", 10, 50); 
  text("Your score was: " + (jerry.getLength() - 1), 10, 90); 
  text("Click to restart...", 10, 130);
  difficultyButtons(); 
  difficultyButtonSensor(); 

}

void difficultyButtons(){
  fill(88, 214, 141); 
  rect(200, 200, 200, 60);
  fill(0,0,0);  
  textSize(24); 
  text("Easy", 275, 240);
  
  fill(231, 76, 60);  
  rect(200, 300, 200, 60);
  fill(0,0,0);  
  textSize(24); 
  text("Hard", 275, 340);

}

void difficultyButtonSensor(){
  if(mousePressed && mouseX > 200 && mouseX < 400){
    if(mouseY > 200 && mouseY < 260){
      difficulty = 10; 
      initialStart = false;
      jerry = new snake(); 
      snack = new food(60,50);
    } else if (mouseY > 300 && mouseY < 360 ){
      difficulty = 5; 
      initialStart = false;
      jerry = new snake(); 
      snack = new food(60,50);
    } 
  }
}
