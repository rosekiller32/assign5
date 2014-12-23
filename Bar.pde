class Bar{

    float xposition;
    float yposition;
    float length;
    float thickness;



    //methods
    void move(){
      xposition=mouseX;
      yposition=height-10;      
      }
      
    
    
    void  display(){
    fill(255);
    rectMode(CENTER);   
    rect(xposition,yposition,length,thickness);
    //fill(255);
    }
    //constructor 

    
    Bar(float length){
      xposition=mouseX;
      yposition=height-10;
    this.length=length;
    thickness=10;
    }
    





}
