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
  }
  
  void display(){
    fill(0,255,0);
    rectMode(CENTER); 
    rect(x,y,length,thickness);  
  }
  
  
  //contructor
  
    Brick(float x,float y,float length,float thickness,float ySpeed){
      this.x=x;
      this.y=y;
      this.length=length;
      this.thickness=thickness;
      this.ySpeed=ySpeed;
    }
}
