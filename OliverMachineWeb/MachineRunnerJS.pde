// MachineRunnerJS.pde

Config conf = new Config();

// window size
int mWidth  = 1000, //round(conf.D + conf.Rl + conf.Rr + 2*conf.winSpace),
    mHeight = 600; //round(2*conf.winSpace + max(conf.Rl,conf.Rr) + 2*conf.Ra); 

App app;

void setup() {    
  size(mWidth,mHeight);
  frameRate(conf.FR);  // nb steps per second
  background(conf.bg);
  stroke(255);  // black lines by default at first...
  app =  new App(conf,mWidth,mHeight);
}

float gd(String s){
    float [] vals = {conf.D,
		     conf.Rl,
		     conf.Rr,
		     conf.Ra,
		     conf.Il,
		     conf.Ir,
		     conf.Al,
		     conf.Ar,
		     conf.Vl,
		     conf.Vr,
		     conf.Va };
    return vals[int(s)];
}

void sc(String i,String v){
    switch(int(i)){
    case 0:
	conf.D = float(v);
	break;
    case 1:
	conf.Rl = float(v);
	break;
    case 2:
	conf.Rr = float(v);
	break;
    case 3:
	conf.Ra = float(v);
	break;
    case 4:
	conf.Il = float(v);
	break;
    case 5:
	conf.Ir = float(v);
	break;
    case 6:
	conf.Al = float(v);
	break;
    case 7:
	conf.Ar = float(v);
	break;
    case 8:
	conf.Vl = float(v);
	break;
    case 9:
	conf.Vr = float(v);
	break;
    case 10:
	conf.Va = float(v);
	break;
    }
    app = null;
    app = new App(conf,mWidth,mHeight);
}
    
void setD(String v){
    conf.D = float(v);
    background(conf.bg);
    stroke(255);  // black lines by default at first...
    app =  new App(conf,mWidth,mHeight);
}

void draw() {  
    try {	
	app.draw();
    }
    catch (Exception e) {
	background(conf.bg);
	stroke(conf.penColor);
	fill(conf.penColor);
	textSize(32);
	textAlign(CENTER);
	text("Arms were torn apart!\nPlease Reload this page to restart",width/2.0,height/2.0);
	exit();
    }
}

void mouseClicked() {
    app.pause();
}
void keyPressed() {
    mouseClicked();
}
  
