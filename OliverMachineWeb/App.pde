// App.pde

// debugging params
final boolean showArms     = true,
              showBaseLine = false,
              showPoints   = true,
              overwrite    = true;

class App{
    Config conf;
    boolean pauseApp = false;
    // coordinate system for computation
    float originX,
   	originY;

    // global variables used in computation
    Circle C0,C1,C2;      // big, right, left disks
    Point  p1, p2, p3;    // end point of right radius, left radius, and pen point

    // current time in ticks, note: time stops when simulation is paused!
    int i = 0;

    // points array list
    ArrayList<Point> points;
    
    App(Config c, int winWidth, int winHeight){
    conf = c;
    originX = winWidth/2.0 -conf.D/2.0; // 1.5*conf.D; 
    originY = winHeight - conf.winSpace- max(conf.Rl,conf.Rr);  
	// init globals, points are just placeholders
	p1 = new Point(0,0);
	p2 = new Point(0,0);
	p3 = new Point(0,0);
	C2 =  new Circle(originX , originY,conf.Rl);
	C1 = new Circle(originX+conf.D, originY,conf.Rr);
	C0 = new Circle(C2.x+conf.D/2.0,C1.y -conf.D/2.0, conf.Ra);
	points =  new ArrayList<Point>();
	drawDisks();
	//testDraw(conf.D,conf.D);
    }
    void testDraw(float a, float b){
	background(conf.bg);
	fill(255);
	ellipse(a,b,100,100);
    }
    
    void drawDisks(){
	// draw the 3 disks
	stroke(conf.smallArmColor);
	float r = 2*conf.Rl;
	ellipse(C2.x,C2.y,r,r);
	r = 2*conf.Rr;
	ellipse(C1.x,C1.y,r,r);
	r = 2*conf.Ra;
	ellipse(C0.x,C0.y,r,r);
	//testDraw(100,500);
    }

    void updateRadiusArmPoints(int t){
      //move the point at the end of each small arm to the new position as a result
      // of the rotation of the appropriate small wheel
      p2.x = conf.Rl * cos(radians(t*conf.Vl + conf.Il)) + C2.x;
      p2.y = C2.y - conf.Rl * sin(radians(t*conf.Vl + conf.Il));
      p1.x = conf.Rr * cos(radians(t*conf.Vr + conf.Ir)) + C1.x;
      p1.y = C1.y - conf.Rr * sin(radians(t*conf.Vr + conf.Ir));
    }
    
    void drawRl(){
	// draw left small arm
	stroke(conf.smallArmColor);
	line (C2.x,C2.y,p2.x,p2.y);
    }
    
    void drawRr(){
	// draw right small arm
	stroke(conf.smallArmColor);
	line (C1.x,C1.y,p1.x,p1.y);
    }

    void drawBaseLine(){
	// draw the line between the 2 radius arms
	stroke(conf.baseLineColor);
	line(p2.x,p2.y,p1.x,p1.y);
    }

    void updatePenPoint(){
	// get a the new point where the pen is located
	//p3 = getIntersectPoint(p2, p1, conf.Al, conf.Ar);
	Circle c1 = new Circle(p2,conf.Al);
	Circle c2 = new Circle(p1, conf.Ar);
	p3 = c1.getIntersectPoint(c2);
    }
    
    void drawPenPoints(){
	// this takes the array of all points previously drawn,
	// rotates them by the angle corresponding to the big disk speed
	// and draws lines from p[i] to p[i+1],
	// this uses the matrix transformations offered in processing
	
	// first set the color
	stroke(conf.penColor);
	fill(conf.penColor);
	
	// save the current coordinate system to the matrix stack
	pushMatrix();
	// translate the coordinate system to the center of the big disk
	translate(C0.x,C0.y);
	// if there are any points already saved
	if (points.size()>0){
	    // get the first point
	    Point p = points.get(0);
	    // rotate it
	    p.rotate(radians(conf.Va));
	    // iterate over all the remaining points
	    for (int i = 1; i < points.size(); i++) { 
		// get the point, rotate it, draw a line from the previous point to this one,
		// set this point to the previous point for the next iteration
		Point pp = points.get(i);
		pp.rotate(radians(conf.Va));
		p.lineTo(pp);
		p = pp;
	    }
	}
	// go back to the original coordinate system
	popMatrix();
	// display the current pen point
	p3.display();
  
	// create a new point by translating the pen point to coordinate systems centered at the center of the big disk
	// and add it to the array of points
	points.add(p3.NewPointAtNewOrigin(C0));
	
	// turn off fill, to clean up!
	noFill();
    }
    
    void drawLeftArm(){
	stroke(conf.longArmColor);
	line(p2.x,p2.y,p3.x,p3.y);
    }
    
    void drawRightArm(){
	stroke(conf.longArmColor);
	line(p3.x,p3.y,p1.x,p1.y);
    }
    
    void draw() {
	if (pauseApp){
	    // if simulation is paused, do nothing
	    return;
	}
	
	if (overwrite){
	    // if we are overwriting, refesh display
	    background(conf.bg);
	    drawDisks();
	}
	// step the arms, and update the pen point
	updateRadiusArmPoints(i);
	updatePenPoint();
	
	if (showPoints){
	    // if showing the points
	    drawPenPoints();
	}
	if (showArms){
	    // if showing arms, draw them
	    drawRl();
	    drawRr();
	    drawLeftArm();
	    drawRightArm();
	}
	if (showBaseLine){
	    // if showing the baseline, draw it
	    drawBaseLine();
	}
	// increment the step counter
	i++;
	
    }

  void pause() {
    // pause or unpause the simulation;
    // if we pause, we save an image file of the current state
    pauseApp = ! pauseApp;
    if (conf.saveIms && pauseApp){
      String fileName = conf.imDir + 
                        "image-" + 
                        String.valueOf(year()) + "-" +
                        String.valueOf(month()) + "-" +
                        String.valueOf(day()) + "-" +
                        String.valueOf(hour()) + "-" +
                        String.valueOf(minute()) + "-" +
                        String.valueOf(second()) + ".png";
      
      save(fileName);
      println("Saved: " + fileName);
    }
  }
}
  
