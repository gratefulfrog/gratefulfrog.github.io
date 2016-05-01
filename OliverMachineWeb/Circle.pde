class Circle{
  float r,
        x,
        y;
        
  Circle(float xx, float yy,float rr){
     x = xx;
     y = yy;
     r = rr;
  }
  Circle(Point p, float rr){
     x = p.x;
     y = p.y;
     r = rr;
  }
  void display(){
    stroke(#C4BCBC);
    ellipse(x,y, 2*r,2*r);
  }
  ////////////////////////////////////////////////////////////////
  // circle intersection methods
  // based on http://ambrsoft.com/TrigoCalc/Circles2/Circle2.htm
  ////////////////////////////////////////////////////////////////

  float DD(Circle c2){
    // return the distance between the circle centers
    // raise an exception if there is no intersection!
    float res = sqrt(sq(c2.x-x) + sq(c2.y - y));
    if (res > (r + c2.r)){
      throw new RuntimeException("Arms have been torn apart!"); //Circles do not intersect!
    }
    else if (res < abs(r -c2.r)){
      throw new RuntimeException("Arms cannot connect to the pen!"); //One circle is inside the other!
    }
    return res;
  }
    
  float Delta(Circle c2, float D){
     float p1 =  D + r + c2.r ;
     float p2 =  D + r - c2.r ;
     float p3 =  D - r + c2.r ;
     float p4 =  -D + r + c2.r ;;
     float res = sqrt(p1*p2*p3*p4)/4.0;
     return res;
  }
  
  // 2016 04 30 : Simplification of the computations, no need for both intersection points!
  float X(Circle c2, float D,float delta){
    float p1 = (x +c2.x)/2.0;
    float p2 = ((c2.x-x)*(sq(r) - sq(c2.r)))/(2.0*sq(D));
    float p3 = 2.0*(y-c2.y)*delta/sq(D);
    float xMinus = p1+p2-p3;
    return xMinus;
  }
  
  float Y(Circle c2,float D,float delta){
    float p1 = (y +c2.y)/2.0;
    float p2 = ((c2.y-y)*(sq(r) - sq(c2.r)))/(2.0*sq(D));
    float p3 = 2.0*(x-c2.x)*delta/sq(D);
    float yPlus = p1+p2+p3;
    return yPlus;
  }
  
  Point getIntersectPoint(Circle cR){
    float D = this.DD(cR);
    // errors are caught by the App instance
    float delt = Delta(cR,D);
    Point res =  new Point(this.X(cR,D,delt),this.Y(cR,D,delt));
    return res;
  }
}
