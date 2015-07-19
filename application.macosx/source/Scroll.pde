class Scroll {
  int mapstatus;
  int x, y;

  Scroll() {
    mapstatus=center;
    x=width;
    y=0;
  }



  void mapscroll() {
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
