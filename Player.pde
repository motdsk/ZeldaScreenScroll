class Player {
  int x, y;
  boolean flagx, flagy;

  Player() {
    x=width/2;
    y=height/2;
    flagx=false;
    flagy=false;
  }


  void move() {
    if (flagy) {
      if (keyPressed) {
        if (key=='w') y-=4;
        if (key=='s') y+=4;
      }
      if (link.y==height/2) link.flagy=false;
    }
    if (flagx) {
      if (keyPressed) {
        if (key=='a') x-=4;
        if (key=='d') x+=4;
      }
      if (link.x==width/2) link.flagx=false;
    }
    //スクロールするかどうかの判定
    scrollHantei();
  }
  void scrollHantei() {
    if (y==0) {
      fieldUp.x=field1.x+50;
      scroll.mapstatus=scrollup;
      delay(30);
    }
    if (x==width) {
      fieldRight.y=field1.y-20;
      scroll.mapstatus=scrollright;
      delay(30);
    }
    if (y==height) {
      field1.x=fieldUp.x-50;
      scroll.mapstatus=scrolldown;
      delay(30);
    }
    if (x==0) {
      field1.y=fieldRight.y+20;
      scroll.mapstatus=scrollleft;
      delay(20);
    }
  }

  void display() {
    fill(180);
    ellipse(x, y, 50, 50);
  }
}
