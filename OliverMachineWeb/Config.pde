class Config {
    // All user config data goes here!
    
    // Small disk sizes
    float LeftRadius = 70;  // radius of left short arm in pixels
    float RightRadius = 50;  // radius of left short arm in pixels
    
    // Radial Arm starting postion, in degrees, 0 degrees is due East, positive is counter clockwise
    float InitRight = 0, // right arm init
	InitLeft = 180;  // left arm init
    
    // distance between the small disks (center to center) in pixels
    float SmallDiskDistance = 340;
    
    // big wheel size
    float BigRadius = 150;  // radius of the wheel that is the canvas
    
    // wheel speeds
    float LeftSpeed  = 1;   // Wheel rotational speeds in Degrees per frame (frameRate is set elsewhere to get a nice result!)
    float RightSpeed = 2;   // Wheel rotational speeds in Degrees per frame (frameRate is set elsewhere to get a nice result!)
    float BigSpeed   = 1.3; // Wheel rotational speeds in Degrees per frame (frameRate is set elsewhere to get a nice result!)
    
    // pen holder arm lengths
    float LeftArmlength = 270;  // length of arm in pixels
    float RightArmlength = 247;  // length of arm in pixels
    
    // pen color
    color PenColor = #F50C2F;  // RGB value of the pen color
    
    // simulation speed
    float SimSpeed = 100;  // simulation speed in Frames Per Second, Note: the software will do its best to get that speed, but may fail!
    
    // image directory, where the saved images will go! Don't forget the slash at the end!
    String imageDir = "/home/bob/MiscProjects/OliverMachine/MachineRunner/Images/";
    boolean saveImages = false; // true;  // set to true to durn on image saving
    
////////////////////////////
// end of User Config Data
///////////////////////////


     // frames per second
    float FR = SimSpeed;
    
    // Distance between centers of small wheels
    float D = SmallDiskDistance;
    
    // Radii of small wheels
    float Rl = LeftRadius, // left wheel radius
          Rr = RightRadius; // right wheel radius
          
    // initial position of radius arms in degrees, 0 is due East
    float Ir = InitRight, // right arm init
          Il = InitLeft;  // left arm init
    
    // Radius of Big Wheel
    float Ra = BigRadius;
    
    // Pen Holder Arm lengths
    float Al = LeftArmlength, // left arm length
          Ar =  RightArmlength; // right arm length
    
    // Wheel rotational speeds in Degrees per frame (frameRate is set elsewhere to get a nice result!)
    float Va =  BigSpeed,  // big wheel speed
          Vl = LeftSpeed,    // left wheel speed
          Vr = RightSpeed;    // right wheel speed
    // colors
    color penColor = PenColor,
          smallArmColor = #B0BAC6,
          longArmColor = #DDD0E8,
          baseLineColor = #D7EADD,
          bg = #0F0606;
     // window spacing
     float winSpace = 100;
    // image dir
    String imDir = imageDir; 
    boolean saveIms = saveImages;
    
    Config(){};
}
