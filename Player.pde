class Player {
  int x, y;
  boolean flagx, flagy;
  int attack;
  int swordrho;
  Player() {
    x=width/2;
    y=height/2;
    flagx=false;
    flagy=false;
    attack=0;
  }


  void move() {
    if (keyPressed) {
      if (key=='a') {
        attack=slush;
        swordrho=180;
      }
      if (key=='s') {
        attack=kaitenSlush;
        swordrho=180;
      }
      if (flagy) {
        if (keyCode==UP) y-=4;
        if (keyCode==DOWN) y+=4;
        if (link.y==height/2) link.flagy=false;
      }
      if (flagx) {
        if (keyCode==LEFT) x-=4;
        if (keyCode==RIGHT) x+=4;
        if (link.x==width/2) link.flagx=false;
      }
      //スクロールするかどうかの判定
      scrollHantei();
    }
    //attackがtrueなら攻撃
    if (attack==slush) slush();
    if (attack==kaitenSlush) kaitenSlush();
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
//斬り
  void slush() {
    pushMatrix();
    fill(100);
    translate(x+15, y+10);
    rotate(radians(swordrho));
    rect(-10, 10, 10, 50);
    swordrho+=30;
    popMatrix();
    //吹っ飛び処理1
    if (dist(x, y, burin.x, burin.y)<80) {
      println(dist(x, y, burin.x, burin.y));
      burin.huttobiX+=5;
    }

    if (swordrho==300) {
      attack=0;
      swordrho=180;
    }
  }
  //回転切り
  void kaitenSlush() {
    pushMatrix();
    fill(100);
    translate(x+15, y+10);
    rotate(radians(swordrho));
    rect(-10, 10, 10, 50);
    swordrho+=30;
    popMatrix();
    //吹っ飛び処理2
    if (dist(x, y, burin.x, burin.y)<140) {
      burin.huttobiX+=10;
    }

    if (swordrho==540) {
      attack=0;
      swordrho=180;
    }
  }

  void display() {
    fill(50, 205, 50);
    rect(x, y, 30, 50);
  }
}
