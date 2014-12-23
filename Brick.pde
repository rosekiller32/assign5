class Brick {

  float size;
  float x;
  float y;
  float ySpeed;
  float length;
  float thickness;
  
  //methods
  void move() {
      y+=ySpeed;
      //if(y+thickness/2>height){
          //status=GAME_LOSE;
      //}
  }
  
  void display(){
    fill(0,255,0);
    rectMode(CENTER); 
    rect(x,y,length,thickness);  
  }
  
  
  //contructor
  
    Brick(int x,int y,float length,float thickness,float ySpeed){
      this.x=x;
      this.y=y;
      this.length=length;
      this.thickness=thickness;
      this.ySpeed=ySpeed;
    }
}
