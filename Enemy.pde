class Enemy {
  int x, y;
  int huttobiX, huttobiY;

  Enemy() {
    x=20;
    y=fieldRight.y+800;
    huttobiX=0;
    huttobiY=0;
  }

  void move() {
   
      x=fieldRight.x+300+huttobiX;
      y=fieldRight.y+2050+huttobiY;
    
  }




  void display() {

    if (scroll.mapstatus==right || scroll.mapstatus==scrollright) {
      
      
      fill(150);
      rect(x+10, y+10, 20, 50);
    }
  }
}
