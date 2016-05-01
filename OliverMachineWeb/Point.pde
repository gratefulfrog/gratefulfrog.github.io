class Point{
  float x,y,d,a; // a is angle from 0,0 in radians
  Point(float xx,float yy){
    x = xx;
    y = yy;
    d = sqrt(sq(x)+sq(y));
    a=atan2(y,x);
  }
  Point (Point p){
    x = p.x;
    y = p.y;
    d = p.d;
    a = p.a;
  }
  void display(){
    ellipse(x,y,1,1);
  }
  void rotate(float rads){
    // rotate about 0,0
    a += rads;
    x = d*cos(a);
    y = d*sin(a);
  }
  void lineTo(Point target){
    // draw a line from point to target
    line(x,y,target.x,target.y);
  }
  Point NewPointAtNewOrigin(Circle c){
    // create a new point based on this, where the center of the circle is the origin of the coord system
    return new Point(this.x - c.x, this.y - c.y);
  }
}