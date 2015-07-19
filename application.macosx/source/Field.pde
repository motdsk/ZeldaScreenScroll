class Field {
  int x, y;
  PImage img;
  Field(int xx,int yy,String name) {
    x=xx;
    y=yy;
    img=loadImage(name);
  }


  void move() {
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

  void display() {   
    image(img, x, y);
    
  }


  void hantei() {
    //マップスクロールしきれない場合キャラクタを動かす
    if (x>0) x =0;
    if (x<-img.width+width) x=-img.width+width;
    if (y>0) y=0;
    if (y<-img.height+height) y=-img.height+height;
    //リンクを動けるように
    if (x==-img.width+width || x ==0) link.flagx=true;
    if (y ==-img.height+height||  y==0) link.flagy=true;
  }
}
