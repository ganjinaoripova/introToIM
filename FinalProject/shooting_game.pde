/*
Author: Ganjina Oripova
 Class: Introduction to Interactive Media
 Tittle: Final Project - "Corona" - shooting game 
 
 Explanation:   
 - Player can move only left or right with moving the mouse 
 - If the mouse is on the canvas and is pressed -> starts shooting 
 - If the mouse is not pressed -> nothing happens 
 - When the game starts enemies automatically start shooting 
 while coming down to the direction of the player 
 - When you shoot the enemy -> automatically disappears but still the bullets come down 
 - You get a point when you shoot the enemy 
 - You have five lives 
 - Score/time/lives is being counted 
 - Time - in total 30 seconds -> when the timer reaches 
 10 seconds -> the color of the timer and the score becomes red to notify the player that 
 the game will end soon 
 
 
 Tricky Part: 
 - Sometimes takes longer to load the game 
 - Having some problems working with "lives": 
 whenever enemy shoots the player -> one live less
 
 To do list:
 - Game Over at the end of the game
 
 
 Date: May 16, 2020
 */


// Declaring variables that affects the hole code
// Why we want all the classes to have access to these variables
Myself myself;
ArrayList<Enemy> enemies;
ArrayList<Bullet> myBullets;
ArrayList<Bullet> eneBullets;
PImage bg;
int score=0; //initial score 
int lives=5; //number of lives you start with
int time;
boolean state_game;
boolean state_game_over; 


void setup() {
  size(652, 418);
  bg = loadImage("corona3.png");
  rectMode(CENTER);
  myself = new Myself();
  enemies = new ArrayList<Enemy>();
  myBullets = new ArrayList<Bullet>();
  eneBullets = new ArrayList<Bullet>();
  time = 30 * 60;
  state_game = true;
  state_game_over = false;
}

void draw() {
  background(bg);
  if (state_game == true)
    play_game();
  else
    game_over();
}
void print_score() { 
  textSize(25); //sets the size of the text

  if (time / 60 <= 10) {
    fill(255, 0, 0); // if time is less than 10 seconds -> makes the color red
  } else {
    fill(255, 255, 0); // otherwise yellow
  }
  text("Time: " + (time / 60), 35, 30); // print the text on the screen
  text("Score: " + score, 35, 60); // Print the score on the screen
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
  check_time();
}

void check_time() { // count up timer 
  time--;
  if (time <= 0) {
    state_game = false;
    state_game_over = true;
  } else {
    state_game = true;
    state_game_over = false;
  }
}

void game_over() {
  background(0);
  textSize(50);
  fill(250, 0, 0);
  textAlign(CENTER, CENTER);
  text("Game Over!\n\nScore: " + score + 
    "\nclick TAB to restart", width/2, height/2); // prints game over, score and restart on the screen after game finishes 
  delay(1000);
  keyReleased();
}

void keyReleased() {
  if ( keyCode == TAB) {
    state_game_over = false;
    state_game = true;
    time = 30 *60;
    score = 0;
    for (int i = 0; i< enemies.size(); i++) {
      enemies.remove(i);
    }
    for (int i= 0; i<eneBullets.size(); i++) {
      eneBullets.remove(i);
    }
    for (int i =0; i<myBullets.size(); i++) {
      myBullets.remove(i);
    }
  }
}
