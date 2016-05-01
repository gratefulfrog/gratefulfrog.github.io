// MachineRunnerJS.pde

// window size
int mWidth  = round(conf.D + conf.Rl + conf.Rr + 2*conf.winSpace),
    mHeight = round(2*conf.winSpace + max(conf.Rl,conf.Rr) + 2*conf.Ra); 

Config conf = new Config();
App app;

void setup() {
  size(mWidth,mHeight);
  frameRate(conf.FR);  // nb steps per second
  background(conf.bg);
  background(0); 
  stroke(255);  // black lines by default at first...
  app =  new App(conf,mWidth,mHeight);
}

void draw() {
    app.draw();
}

void mouseClicked() {
    app.pause();
}
void keyPressed() {
    mouseClicked();
}
  
