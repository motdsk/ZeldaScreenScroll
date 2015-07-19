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

void setup() {
  size(800, 600);
  link=new Player();
  field1=new Field(-2000, -1000, "zelda_field1.jpg");
  fieldUp=new Field(field1.x+65, field1.y-1480, "zelda_field_up.png");
  fieldRight=new Field(field1.x+field1.img.width, -2000, "zelda_field_right.png");
  scroll=new Scroll();
  ellipseMode(CENTER);
}



void draw() {
  fieldMove();
}


void fieldMove() {

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
