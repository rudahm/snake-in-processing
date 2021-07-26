/*Declaration all variables*/ 

//array lists store x and y positions of individual snake parts 
ArrayList<Integer> x = new ArrayList<Integer>(), y = new ArrayList<Integer>();

int w=30, h=30, 

/*blocksize as the individual parts of the snake
w(30)*blocks(20)= 600
h(30)*blocks(20) = 600
screensize = 600x600
*/ 


blocks=20, 

direction = 0, foodx = 15, foody= 15, fc1 = 255, fc2 = 255, fc3 = 255, speed = 8; 

/* an integer array x and y with the four directions*/ 
int[]x_direction={0,0,1,-1}, y_direction={1,-1,0,0}; 
boolean gameover = false; 

void setup() { 
  size(600, 600);
  x.add(15); //starting position x coordinate block 
  y.add(15); //starting position y coordinate block
} 
//the field of the snake is 30 blocks by 30 blocks

void draw() { 
  background(0); 
  
  fill(50,168,111);
  /* loops through ArrayList x and ArrayList y  --> 
  while i is smaller than final block of the snake computer draws another block to complete the snake as long as he is in that moment*/ 
  for (int i = 0; i < x.size(); i++) 
  rect(x.get(i)*blocks, y.get(i)*blocks, blocks, blocks); 
  
  if(!gameover){ 
    /*creates food*/ 
    fill(fc1,fc2,fc3); 
    ellipse(foodx*blocks+10, foody*blocks+10, blocks, blocks); 
   
    /*scoreboard*/
    textAlign(LEFT); //score 
    textSize(25); 
    fill(255); 
    text("Score: "+ x.size(), 10,10,width-20, 50); 
    
    /* gameplay */ 
    if (frameCount%speed==0){ //frameCount contains the number of frames that have been displayed since the program started. (in setup this is 0) FRAMECOUNT%SPEED ==0 MEANS 
    
    /*makes snake longer*/ 
    x.add(0, x.get(0) + x_direction[direction]); //makes the snake longer
    y.add(0, y.get(0) + y_direction[direction]); //makes the snake longer 
    
    
    if (x.get(0) < 0 || y.get(0) < 0 || x.get(0) >= w || y.get(0) >= h) gameover = true; 
    for (int i = 1; i<x.size(); i++) 
    if (x.get(0)==x.get(i)&&y.get(0)==y.get(i)) gameover = true;
      if (x.get(0)==foodx && y.get(0)==foody){ 
        if(x.size()%2 ==0 && speed>=2) speed-=1; //speed increases  
        foodx = (int)random(0,w); //determines xcoordinate food
        foody = (int)random(0,h); //determines ycoordinates food
        fc1 = (int)random(255);
        fc2 = (int)random(255); 
        fc3 = (int)random(255); 
      } else { 
      x.remove(x.size()-1); //adds eaten food to snake
      y.remove(y.size()-1); //adds eaten food to snake
      } 
    } 
    }  else{ 
      fill(219,186,18);
      textSize(30);
     textAlign(CENTER); 
     text("GAME OVER \n Your Score Is: " + x.size() + "\n Press ENTER", width/2, height/3); 
     if (keyCode == ENTER){ 
       x.clear(); 
       y.clear(); 
       x.add(0); 
       y.add(15); 
       direction = 2; 
       speed = 8; 
       gameover = false; 
     } 
  
}} 

void keyPressed() {
  int newdir=keyCode == DOWN? 0:(keyCode == UP?1:(keyCode ==RIGHT?2:(keyCode == LEFT?3:-1))); 
  if (newdir != -1) direction = newdir; 
}
