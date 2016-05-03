// MachineRunner01.pde

final Config conf = new Config();

// window size
int mWidth  = round(conf.D + conf.Rl + conf.Rr + 2*conf.winSpace),
    mHeight = round(2*conf.winSpace + max(conf.Rl,conf.Rr) + 2*conf.Ra); 
    
void settings() {
  size(mWidth,mHeight);
}

App app;

void setup() {
  frameRate(conf.FR);  // nb steps per second
  background(conf.bg); 
  stroke(0);  // black lines by default at first...
  app =  new App(conf,mWidth,mHeight);
}

void draw() {  
    try {	
	app.draw();
    }
    catch (Exception e) {
	println("Arms were torn apart!");
	exit();
    }
}

void mouseClicked() {
    app.pause();
}
void keyPressed() {
    mouseClicked();
}
  
