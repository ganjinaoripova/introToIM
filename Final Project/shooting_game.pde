/*
Author: Ganjina Oripova
 Class: Introduction to Interactive Media
 Professor: Michael Shiloh
 Tittle: Final Project - "CORONA" - shooting game 
 
 Explanation:   
 - Player can move only left or right with moving the mouse 
 - If the mouse is on the canvas and is pressed -> player starts shooting 
 - If the mouse is not pressed -> player just stays on its position without doing anything
 - When the game starts enemies automatically start shooting,  
 while coming down to the direction of the player 
 - When the player shoots the enemy -> enemy automatically disappears but still the bullets come down 
 - You get a one second when you shoot the enemy 
 - You have five lives 
 - when you get hit by bullet -> minus one live
 - when you get hit by enemy -> you die
 
 
 
 Tricky Part: 
 - Sometimes takes longer to restarts the game -> after pressing TAB
 - Having some problems working with "lives": 
 whenever enemy shoots the player -> one live less
 - after restarting the game score/lives text is shifting to the left side a bit
 - Writing a code for GameOver screen: it kept showing the GameOver screen only once 
 at the beginning, and when you play the game for the second time, it automatically 
 kept restarting it without even showing the screen 
 
 Date: May 16, 2020
 */


// Declaring variables that affects the whole code
// Why we want all the classes to have access to these variables
Myself myself;
ArrayList<Enemy> enemies;
ArrayList<Bullet> myBullets;
ArrayList<Bullet> eneBullets;
PImage bg;
int score=0; //initial score 
int lives=5; //number of lives you start with
//int time;
boolean state_game;
boolean state_game_over; 
boolean restartRequest = false;

void setup() {
  size(652, 418);
  bg = loadImage("corona3.png");
  rectMode(CENTER);
  myself = new Myself();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>();
  state_game = true;
  state_game_over = false;
}

void draw() {
  background(bg);
  if (state_game == true)
    play_game();
  else
    game_over();

  if (restartRequest == true) {
    restartGame();
  }
}
void print_score() { 
  textSize(25); //sets the size of the text
  fill(255, 255, 0); // makes the collor of the score yellow
  text("Score: " + score, 35, 30); // Print the score on the screen
}



void lives() {
  fill(255, 255, 0);
  stroke(0, 255, 0); 
  textSize(25); //sets the size of the text
  text("lives = "+lives, width-130, 30); //Print remaining lives
}


void play_game() {
  print_score();
  lives();
  myself.display();
  for (Enemy enemy : enemies) {
    enemy.display();
  }
  for (Bullet bullet : myBullets) {
    bullet.display();
  }
  for (Bullet bullet : eneBullets) {
    bullet.display();
  }

  myself.update();
  ArrayList<Enemy> nextEnemies = new ArrayList<Enemy>();
  for (Enemy enemy : enemies) {
    enemy.update();
    if (!enemy.isDead) {
      nextEnemies.add(enemy);
    }
  }
  enemies = nextEnemies;
  ArrayList<Bullet> nextMyBullets = new ArrayList<Bullet>();
  for (Bullet bullet : myBullets) {
    bullet.update();
    if (!bullet.isDead) {
      nextMyBullets.add(bullet);
    }
  }
  myBullets = nextMyBullets;
  ArrayList<Bullet> nextEneBullets = new ArrayList<Bullet>();
  for (Bullet bullet : eneBullets) {
    bullet.update();
    if (!bullet.isDead) {
      nextEneBullets.add(bullet);
    }
  }
  eneBullets = nextEneBullets;
  if (random(1) < 0.02) {
    enemies.add(new Enemy());
  }
  enemytouch();
}

void enemytouch() { // whenever enemy touches the player -> game over

  if (myself.isDead == true) {
    state_game = false;
    state_game_over = true;
  } else {
    state_game = true;
    state_game_over = false;
  }
}

void game_over() {
  background(0);
  pushStyle();
  textSize(50);
  fill(250, 0, 0);
  textAlign(CENTER, CENTER);
  text("Game Over!\n\nScore: " + score + 
    "\nclick TAB to restart", width/2, height/2); // prints game over, score and restart on the screen after game finishes 
  delay(1000);
  popStyle();
}

void keyReleased() {
  if ( keyCode == TAB) {
    restartRequest = true;
  }
}

void restartGame() {
  state_game_over = false;
  state_game = true;
  score = 0;
  lives = 5;
  myself.isDead = false;
  for (int i = 0; i< enemies.size(); i++) {
    enemies.remove(i);
  }
  for (int i= 0; i<eneBullets.size(); i++) {
    eneBullets.remove(i);
  }
  for (int i =0; i<myBullets.size(); i++) {
    myBullets.remove(i);
  }
  restartRequest = false;
}




/*
References: 
 - https://www.youtube.com/watch?v=wOc2g0rlh3I
 - https://processing.org/reference/keyReleased_.html
 */
