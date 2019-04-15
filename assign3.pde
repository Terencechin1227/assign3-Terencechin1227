final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24;
PImage groundhogIdle;
PImage groundhogDown;
PImage groundhogLeft;
PImage groundhogRight;
PImage life;
PImage soil0,soil1,soil2,soil3,soil4,soil5;
PImage stone1,stone2;
int x,y;
int groundhogDownX=1000,groundhogDownY=-1000;
int groundhogLeftX=1000,groundhogLeftY=-1000;
int groundhogRightX=1000,groundhogRightY=-1000;
int distance;
int soilMove=0;

final int stoneCount=8;

boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean downMove=false,rightMove=false,leftMove=false,move=false;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");
  groundhogIdle=loadImage("img/groundhogIdle.png");
  groundhogDown=loadImage("img/groundhogDown.png");
  groundhogLeft=loadImage("img/groundhogLeft.png");
  groundhogRight=loadImage("img/groundhogRight.png");
  life=loadImage("img/life.png");
  soil0=loadImage("img/soil0.png");
  soil1=loadImage("img/soil1.png");
  soil2=loadImage("img/soil2.png");
  soil3=loadImage("img/soil3.png");
  soil4=loadImage("img/soil4.png");
  soil5=loadImage("img/soil5.png");
  stone1=loadImage("img/stone1.png");
  stone2=loadImage("img/stone2.png");
  
  x=320;//groundhog
  y=80;
  
  gameState = GAME_START;
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
    rectMode(CORNERS);
		rect(0, 160 - GRASS_HEIGHT+soilMove, width, 160-GRASS_HEIGHT+15+soilMove);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
    for(int i=0; i<8;i++){
      for(int j=0;j<4;j++){
        image(soil0,80*i,160+80*j+soilMove);
      }
    }
    for(int i=0; i<8;i++){
      for(int j=4;j<8;j++){
        image(soil1,80*i,160+80*j+soilMove);
      }
    }
    for(int i=0; i<8;i++){
      for(int j=8;j<12;j++){
        image(soil2,80*i,160+80*j+soilMove);
      }
    }
    for(int i=0; i<8;i++){
      for(int j=12;j<16;j++){
        image(soil3,80*i,160+80*j+soilMove);
      }
    } 
    for(int i=0; i<8;i++){
      for(int j=16;j<20;j++){
        image(soil4,80*i,160+80*j+soilMove);
      }
    }    
    for(int i=0; i<8;i++){
      for(int j=20;j<24;j++){
        image(soil5,80*i,160+80*j+soilMove);
      }
    }

    //stone
    for(int i=0;i<stoneCount;i++){
      image(stone1,80*i,160+80*i+soilMove);
    }
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==5||i==6){image(stone1,80*i,800+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==5||i==6){image(stone1,80*i,1040+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==5||i==6){image(stone1,80*i,1120+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==5||i==6){image(stone1,80*i,1360+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==3||i==4||i==7){image(stone1,80*i,880+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==3||i==4||i==7){image(stone1,80*i,960+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==3||i==4||i==7){image(stone1,80*i,1200+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==3||i==4||i==7){image(stone1,80*i,1280+soilMove);}}      
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==4||i==5||i==7){image(stone1,80*i,1440+soilMove);}}       
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==4||i==5||i==7){image(stone1,80*i,1680+soilMove);}}    
    for(int i=0;i<stoneCount;i++){
      if(i==1||i==2||i==4||i==5||i==7){image(stone1,80*i,1920+soilMove);}}        
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==1||i==3||i==4||i==6||i==7){image(stone1,80*i,1520+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==1||i==3||i==4||i==6||i==7){image(stone1,80*i,1760+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==1||i==3||i==4||i==6||i==7){image(stone1,80*i,2000+soilMove);}}
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==2||i==3||i==5||i==6){image(stone1,80*i,1600+soilMove);}}    
    for(int i=0;i<stoneCount;i++){
      if(i==0||i==2||i==3||i==5||i==6){image(stone1,80*i,1840+soilMove);}}   
      
    for(int i=0;i<3;i++){
      image(stone2,80*(-i+2),1440+80*i+soilMove);}
    for(int i=0;i<6;i++){
      image(stone2,80*(-i+5),1440+80*i+soilMove);}
    for(int i=0;i<7;i++){
      image(stone2,80*(-i+7),1520+80*i+soilMove);}
    for(int i=0;i<4;i++){
      image(stone2,80*(-i+7),1760+80*i+soilMove);}
    for(int i=0;i<1;i++){
      image(stone2,80*(-i+7),2000+80*i+soilMove);}      
      
		// Player
    image(groundhogIdle,x,y);
    image(groundhogDown,groundhogDownX,groundhogDownY);//groundhog
    image(groundhogLeft,groundhogLeftX,groundhogLeftY);
    image(groundhogRight,groundhogRightX,groundhogRightY);   
    
    if(move){
        if(downPressed){   
          if(soilMove<=-1600){
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogDownY;
            x = groundhogDownX;
            groundhogDownX = 1000;
            distance = 0;
            downPressed = false;
          }        
         } 
        }
         if(leftPressed){
          groundhogLeftX-=5;
          groundhogLeftX=max(groundhogLeftX,0);
          distance+=5;
          if(distance==80){
            move = false;
            y = groundhogLeftY;
            x= groundhogLeftX;
            groundhogLeftX = 1000;
            distance = 0;
            leftPressed = false;
          }    
         }
          if(rightPressed){
            groundhogRightX+=5;
            groundhogRightX=min(groundhogRightX,560);
            distance+=5;
            if(distance==80){
              move = false;
              y = groundhogRightY;
              x = groundhogRightX;
              groundhogRightX = 1000;
              distance = 0;
              rightPressed=false;
            }
          }
        }
		// Health UI
    for(playerHealth=0; playerHealth<5;playerHealth++){
      image(life,10+playerHealth*70,10);
    }
		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
        x=320;
        y=80;
        soilMove=0;
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here
if(key==CODED){
    switch(keyCode){
      case DOWN:
        if(move==false){
          groundhogDownY = y;
          groundhogDownX = x;
          x=1000;
          downPressed=true;
          move = true;
          soilMove-=80;
          if(soilMove<=-1600){
          soilMove=-1600;
          groundhogDownY+=5;
          groundhogDownY=min(groundhogDownY,400);
          distance+=5;
          }
        }
      break;
      case RIGHT:
        if(move==false){
          groundhogRightY = y;
          groundhogRightX = x;
          x=1000;
          rightPressed=true;
          move = true;
        }
      break;
      case LEFT:
        if(move==false){
          groundhogLeftY = y;
          groundhogLeftX = x;
          x=1000;
          leftPressed=true;
          move = true;
        }
      break;
    }
  }
	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}
void keyReleased() {
    if (key == CODED) {
      switch(keyCode){
        case DOWN:
        if(soilMove>-1600){
        move = false;
        y = groundhogDownY;
        x = groundhogDownX;
        groundhogDownX = 1000;
        distance = 0;
        downPressed = false;
      }
    }
  }
}
