ArrayList<Circle> circles = new ArrayList<Circle>();

static final int MAX_ITER =7;
Circle parentCircle = new Circle(400,400,800,177,3);
void setup() {
    size(800,800);
    smooth(4);
    apollo(MAX_ITER,parentCircle);
    
}

void draw() {
    background(210,160,120);
    parentCircle.display();
    for (Circle c : circles) {
        c.display();
        
    }
    save("meditate.png");
}

class Circle {
  float x;//center X
  float y;//center Y
  float r;//radius
  float c;//color
  float s;//strokeWidth
  
  Circle(float x, float y, float r, float c, float s) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.c = c;
    this.s = s;
  }
  
  void display() {
    stroke(210,160,120);
    strokeWeight(s);
    color q = color(c);
    fill(q);
    circle(x, y,r);
  }
}


float sWeight =1;
float black = 0; 
float white =255;
void apollo(int amtOfIter, Circle parent){
    // exit condition
    if (amtOfIter <=0){
        return;
    }
    Circle[] innerCircles = new Circle[10];
    float tX=parent.x;
    float tY=parent.y;
    float rad = parent.r;
    if (rad <=200){
        sWeight=0;
    }

    Circle c1= new Circle(tX - (.25*rad),tY,.5*rad,white,sWeight); //left
    Circle c2= new Circle(tX + (.25*rad),tY,rad/2,black,sWeight+.1); //right
    Circle c3 = new Circle(tX,tY -(.333*rad),rad/3,white,sWeight); //top
    Circle c4 = new Circle(tX,tY +(.333*rad),rad/3,black,sWeight+.1); //bot
    Circle c5 = new Circle(tX-(.25*rad),(tY-.333*rad),rad/6,white,sWeight*.6); //NW
    Circle c6 = new Circle(tX-(.25*rad),(tY+.333*rad),rad/6,black,sWeight*.6); //NE
    Circle c7 = new Circle(tX+(.25*rad),(tY-.333*rad),rad/6,white,sWeight*.6); //SW
    Circle c8 = new Circle(tX+(.25*rad),(tY+.333*rad),rad/6,black,sWeight*.6); //SE
    Circle c9 = new Circle(tX,tY+(.133*rad),(.06667*rad),black,0);
    Circle c10 = new Circle(tX,tY-(.133*rad),(.06667*rad),white,0);

    
    innerCircles[0] = c1;
    innerCircles[1] = c2;
    innerCircles[2] = c3;
    innerCircles[3] = c4;
    innerCircles[4] = c5;
    innerCircles[5] = c6;
    innerCircles[6] = c7;
    innerCircles[7] = c8;
    innerCircles[8] = c9;
    innerCircles[9]=c10;



    

    for (Circle babyCircle : innerCircles) {
        circles.add(babyCircle);
        apollo(amtOfIter - 1, babyCircle);
    }


}
