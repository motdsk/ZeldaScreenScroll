import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Animation extends PApplet {

Player link;
Field field1;
Field fieldUp, fieldRight;
Scroll scroll;
int scrollx, scrolly;
int center=0;
int up=1;
int right=2;
int scrollup=3;
int scrollright=4;
int scrolldown=5;
int scrollleft=6;

public void setup() {
  size(800, 600);
  link=new Player();
  field1=new Field(-2300, -2000, "zelda_field1.jpg");
  fieldUp=new Field(field1.x+65, field1.y-1480, "zelda_field_up.png");
  fieldRight=new Field(field1.x+field1.img.width, -2000, "zelda_field_right.png");
  scroll=new Scroll();
  ellipseMode(CENTER);
}



public void draw() {
  fieldMove();
}


public void fieldMove() {

  if (scroll.mapstatus==center) {
    field1.move();
    field1.display();
    link.move();
    link.display();
  }
  if (scroll.mapstatus==up) {
    fieldUp.move();
    fieldUp.display();
    link.move();
    link.display();
  }
  if (scroll.mapstatus==right) {
    fieldRight.move();
    fieldRight.display();
    link.move();
    link.display();
  }
  if (scroll.mapstatus==scrollup || scroll.mapstatus==scrolldown) {
    scroll.mapscroll();
    field1.display();
    fieldUp.display();
    link.display();
  }
   if (scroll.mapstatus==scrollright || scroll.mapstatus==scrollleft) {
    scroll.mapscroll();
    field1.display();
    fieldRight.display();
    link.display();
  }
}
class Field {
  int x, y;
  PImage img;
  Field(int xx,int yy,String name) {
    x=xx;
    y=yy;
    img=loadImage(name);
  }


  public void move() {
    if (link.flagy==false) {
      if (keyPressed) {
        if (key=='w') y+=4;
        if (key=='s') y-=4;
      }
    }
    if (link.flagx==false) {
      if (keyPressed) {
        if (key=='a') x+=4;
        if (key=='d') x-=4;
      }
    }
    hantei();
  }

  public void display() {   
    image(img, x, y);
    
  }


  public void hantei() {
    //\u30de\u30c3\u30d7\u30b9\u30af\u30ed\u30fc\u30eb\u3057\u304d\u308c\u306a\u3044\u5834\u5408\u30ad\u30e3\u30e9\u30af\u30bf\u3092\u52d5\u304b\u3059
    if (x>0) x =0;
    if (x<-img.width+width) x=-img.width+width;
    if (y>0) y=0;
    if (y<-img.height+height) y=-img.height+height;
    //\u30ea\u30f3\u30af\u3092\u52d5\u3051\u308b\u3088\u3046\u306b
    if (x==-img.width+width || x ==0) link.flagx=true;
    if (y ==-img.height+height||  y==0) link.flagy=true;
  }
}
class Player {
  int x, y;
  boolean flagx, flagy;

  Player() {
    x=width/2;
    y=height/2;
    flagx=false;
    flagy=false;
  }


  public void move() {
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
    //\u30b9\u30af\u30ed\u30fc\u30eb\u3059\u308b\u304b\u3069\u3046\u304b\u306e\u5224\u5b9a
    scrollHantei();
  }
  public void scrollHantei() {
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

  public void display() {
    fill(180);
    ellipse(x, y, 50, 50);
  }
}
class Scroll {
  int mapstatus;
  int x, y;

  Scroll() {
    mapstatus=center;
    x=width;
    y=0;
  }



  public void mapscroll() {
    if (mapstatus==scrollup) {
      y+=13;
      link.y=y;
      field1.y=y;
      fieldUp.y=y-fieldUp.img.height;
      if (y>=height) {
        y=height;
        link.y=y-4;
        field1.y=y;
        fieldUp.y=y-fieldUp.img.height;
        mapstatus=up;
      }
    }
    if (mapstatus==scrolldown) {
      y-=13;
      link.y=y;
      field1.y=y;
      fieldUp.y=y-fieldUp.img.height;
      if (y<=0) {
        y=0;
        link.y=y+4;
        field1.y=y;
        fieldUp.y=y-fieldUp.img.height;
        mapstatus=center;
      }
    }
    if (mapstatus==scrollright) {
      x-=17;
      link.x=x;
      field1.x=x-field1.img.width;
      fieldRight.x=x;
      if (x<=0) {
        x=0;
        link.x=x+4;
        field1.x=x-field1.img.width;
        fieldRight.x=x;
        mapstatus=right;
      }
    }
    if (mapstatus==scrollleft) {
      x+=17;
      link.x=x;
      field1.x=x-field1.img.width;
      fieldRight.x=x;
      if (x>=width) {
        x=width;
        link.x=x-4;
        field1.x=x-field1.img.width;
        fieldRight.x=x;
        mapstatus=center;
      }
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "Animation" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
