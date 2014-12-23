Ball[] myBall; 
Bar mybar;
Brick[] allBrick;


final int GAME_START   = 0;
final int GAME_PLAYING = 1;
final int GAME_PAUSE   = 2;
final int GAME_WIN     = 3;
final int GAME_LOSE    = 4;
final int GAME_DIE    = 5;
int status;              //Game Status
int r=-1;
int life;
int counter;


void setup() {
  status = GAME_START;
  size(640, 480);
  background(0, 0, 0);
  rectMode(CENTER);
  allBrick= new Brick[50];
  counter=allBrick.length;
  for (int j=0; j<allBrick.length; j++) {
    allBrick[j]=new Brick((float)(width/2-180)+(j%10*40), (float)40+(j/10*40), 30, 30, 0.05);
  }
  myBall= new Ball[1];
  for (int i=0; i<myBall.length; i++) {
    myBall[i] = new Ball(0, 0, 15);
  }
  life=3;
  mybar= new Bar(100);
}

void draw() {

  switch(status) {
  case GAME_START:
    background(56);
    printText(60);
    text("Pong game", width/2, 220);
    printText(20);
    text("Press Enter to Start", width/2, 280);
    r=-1;
    statusCtrl();
    break;

  case GAME_PLAYING:
    background(25);
    drawLife(life);
    float bl=mybar.yposition-(10/2);
    float bottom = myBall[0].y+(myBall[0].size/2);
    myBall[0].move(r);   
    myBall[0].display(r);
    for (int k=0; k<allBrick.length; k++) {
      allBrick[k].move();
      allBrick[k].display();
    }
    if (bottom<bl) {
      if (isHit(myBall[0].x, myBall[0].y, (myBall[0].size)/2, mybar.xposition, mybar.yposition, mybar.length, mybar.thickness)) {
        myBall[0].ySpeed*=-1;
      }
    }
    if (myBall[0].y>=height-1/2*myBall[0].size) {
      reset();
      status=GAME_LOSE;
    }

    mybar.move();
    mybar.display();
    checkDead();
    if (counter==0) {
      //status=GAME_WIN;
      status=GAME_WIN;
    }
    if(life<0){
       status=GAME_DIE;
    }
    break;

  case GAME_LOSE:
    life--;
    status=GAME_PLAYING;
    break;
    
  case GAME_WIN:
    reset();
    background(56);
    printText(60);
    text("You Win!!", width/2, 220);
    printText(20);
    text("Press Enter to Restart", width/2, 280);
    r=-1;
    counter=allBrick.length;      
    break;
    
  case GAME_DIE:
    reset();
    background(56);
    printText(60);
    text("You Lose!!", width/2, 220);
    printText(20);
    text("Press Enter to Restart", width/2, 280);
    r=-1;
    counter=allBrick.length;
    statusCtrl();
    break;
  }
}


void drawLife(int life) {
  noStroke();
  textSize(23);
  fill(230, 74, 96);
  text("LIFE:", 50, 443);
  int i;
  for (i=0; i<=life; i++) {
    ellipse(91+25*i, 446, 15, 15);
  }
}

void statusCtrl() {
if (keyPressed) {
  if (key == ENTER) {
    switch(status) {

    case GAME_START:
      status = GAME_PLAYING;
      break;

      /*-----------add things here--------*/
    case GAME_PLAYING:
      //status = GAME_PAUSE;
      break;

    case GAME_PAUSE:
      status = GAME_PLAYING;
      break;

    //case GAME_LOSE:
    //status = GAME_PLAYING;
     // reset();

      //break;
      
    case GAME_DIE:
        fullreset();
        status = GAME_START;
        reset();   
        break;
        
    case GAME_WIN:
      fullreset();
      status = GAME_START;
      reset();   
      break;
    }
  }
}
}

void reset() {
  myBall[0].x=mouseX;
  myBall[0].y=height-20;
  myBall[0].xSpeed=0;
  myBall[0].ySpeed=0;
  r=-1;
}

void fullreset(){
  size(640, 480);
  background(0, 0, 0);
  rectMode(CENTER);
  allBrick= new Brick[50];
  counter=allBrick.length;
  for (int j=0; j<allBrick.length; j++) {
    allBrick[j]=new Brick((width/2-180)+(j%10*40), 40+(j/10*40), 30, 30, 0.1);
  }
  myBall= new Ball[1];
  for (int i=0; i<myBall.length; i++) {
    myBall[i] = new Ball(0, 0, 15);
  }
  life=3;
  mybar= new Bar(100);
}


void mousePressed() {
  if (status ==GAME_PLAYING && myBall[0].xSpeed==0 && myBall[0].ySpeed==0) {
    myBall[0].xSpeed=random(-5, 5);
    myBall[0].ySpeed=-5;
    r=0;
  }
}


void printText(int SIZE) {
  noStroke();
  fill(95, 194, 226);
  textAlign(CENTER, CENTER);
  textSize(SIZE);
}

void checkDead() {
  for (int j=0; j<allBrick.length; j++) {
    if ((allBrick[j].x-allBrick[j].length/2)<=myBall[0].x&&(allBrick[j].x+allBrick[j].length/2)>=myBall[0].x&&(allBrick[j].y+allBrick[j].thickness/2)>=myBall[0].y&&(allBrick[j].y-allBrick[j].thickness/2)<=myBall[0].y 
      ) {
      removeBrick(allBrick[j]);
    }
  }
}
void removeBrick(Brick obj) {
  counter--;
  obj.x = 2000;
  obj.y = 2000;
}





boolean isHit(
float circleX, 
float circleY, 
float radius, 
float rectangleX, // center X
float rectangleY, // center Y
float rectangleWidth, 
float rectangleHeight)
{
  float circleDistanceX = abs(circleX - rectangleX);
  float circleDistanceY = abs(circleY - rectangleY);

  if (circleDistanceX > (rectangleWidth/2 + radius)) { 
    return false;
  }
  if (circleDistanceY > (rectangleHeight/2 + radius)) { 
    return false;
  }

  if (circleDistanceX <= (rectangleWidth/2)) { 
    return true;
  }
  if (circleDistanceY <= (rectangleHeight/2)) { 
    return true;
  }

  float cornerDistance_sq = pow(circleDistanceX - rectangleWidth/2, 2) +
    pow(circleDistanceY - rectangleHeight/2, 2);

  return (cornerDistance_sq <= pow(radius, 2));
}

