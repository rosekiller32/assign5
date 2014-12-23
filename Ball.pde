class Ball{

    float size;
    float x;
    float y;
    float xSpeed;
    float ySpeed;



    //methods
    void move(int r){
    if(r==-1){
    x=mouseX;
    y=height-22;
    }
      x+=xSpeed;
      y+=ySpeed;
      
      if(x<=1/2*size||x>=width-1/2*size){
       xSpeed*=-1 ;
       }
       
 
      if(y<=1/2*size){
        ySpeed*=-1;          
      }
      
    }
    void display(int r){
    fill(95, 194, 226);
    if(r==0){   
    ellipse(x,y,size,size);
    }
    if(r==-1){
    ellipse(mouseX,height-22,size,size);
    }
  
    //constructor 

    }
    Ball(float xSpeed,float ySpeed,float size){
    x=mouseX;
    y=height-12;   
    this.xSpeed=xSpeed;
    this.ySpeed=ySpeed;
    this.size=size;
    
    }
    
    
}
