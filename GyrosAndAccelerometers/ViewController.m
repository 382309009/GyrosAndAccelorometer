


/* Notes */

// You need to import SOD_iOS_Library
//And add its required framewroks as well coreLocation, corebluetooth, coremotion frameworks.

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    [self connectToSODserver];
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
    currentAcc = 0;
    previousAcc = 0;
    previousSpeed = 0;
    currentSpeed = 0;
    
    self.motionManager = [[CMMotionManager alloc] init];
    
    /*self.motionManager.accelerometerUpdateInterval = MY_CONSTANT_TIME_INTERVAL;
    self.motionManager.gyroUpdateInterval = MY_CONSTANT_TIME_INTERVAL;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData *accelerometerData, NSError *error) {
        [self outputAccelertionData:accelerometerData.acceleration];
                                                 if(error){
                                                     
                                                     NSLog(@"%@", error);
                                                 }
    }];
    
    
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue]
                                    withHandler:^(CMGyroData *gyroData, NSError *error) {
                                        [self outputRotationData:gyroData.rotationRate];
                                    }];
     */
    
    self.motionManager.deviceMotionUpdateInterval = 0.1f; // update every 100 ms
    [self.motionManager startDeviceMotionUpdatesToQueue:[NSOperationQueue mainQueue]
                                       withHandler:^(CMDeviceMotion *motion, NSError *error)
     {
         [self outputAccelertionData:motion.userAcceleration];
     }
     ];

}



-(void)outputAccelertionData:(CMAcceleration)acceleration
{
    //Update current speed
    [self calculateCurrentSpeed:acceleration];
    
    //Update UI
    self.accX.text = [NSString stringWithFormat:@" %.2fg",acceleration.x];
    if(fabs(acceleration.x) > fabs(currentMaxAccelX))
    {
        currentMaxAccelX = acceleration.x;
    }
    self.accY.text = [NSString stringWithFormat:@" %.2fg",acceleration.y];
    if(fabs(acceleration.y) > fabs(currentMaxAccelY))
    {
        currentMaxAccelY = acceleration.y;
    }
    self.accZ.text = [NSString stringWithFormat:@" %.2fg",acceleration.z];
    if(fabs(acceleration.z) > fabs(currentMaxAccelZ))
    {
        currentMaxAccelZ = acceleration.z;
    }
    
    self.maxAccX.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelX];
    self.maxAccY.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelY];
    self.maxAccZ.text = [NSString stringWithFormat:@" %.2f",currentMaxAccelZ];


}


/*
    Update the current speed according to the new acceleration
 */
-(void)calculateCurrentSpeed:(CMAcceleration)acceleration
{
    double currentQAcce = sqrt(pow(acceleration.x, 2) + pow(acceleration.y, 2) + pow(acceleration.z, 2));
    if(currentAcc >= previousAcc){
         currentSpeed = (previousSpeed) + currentQAcce * MY_CONSTANT_TIME_INTERVAL;
    } else{
         currentSpeed = (previousSpeed) - currentQAcce * MY_CONSTANT_TIME_INTERVAL;
    }
    
    self.previousSpeed.text = [NSString stringWithFormat:@" %.2f",previousSpeed];
    self.currentSpeed.text = [NSString stringWithFormat:@" %.2f",currentSpeed];
}


-(void)outputRotationData:(CMRotationRate)rotation
{
    //Update the current rotations
    currentRotx = rotation.x;
    currentRoty = rotation.y;
    currentRotz = rotation.z;
    
    self.rotX.text = [NSString stringWithFormat:@" %.2fr/s",rotation.x];
    if(fabs(rotation.x)> fabs(currentMaxRotX))
    {
        currentMaxRotX = rotation.x;
    }
    self.rotY.text = [NSString stringWithFormat:@" %.2fr/s",rotation.y];
    if(fabs(rotation.y) > fabs(currentMaxRotY))
    {
        currentMaxRotY = rotation.y;
    }
    self.rotZ.text = [NSString stringWithFormat:@" %.2fr/s",rotation.z];
    if(fabs(rotation.z) > fabs(currentMaxRotZ))
    {
        currentMaxRotZ = rotation.z;
    }
    
    self.maxRotX.text = [NSString stringWithFormat:@" %.2f",currentMaxRotX];
    self.maxRotY.text = [NSString stringWithFormat:@" %.2f",currentMaxRotY];
    self.maxRotZ.text = [NSString stringWithFormat:@" %.2f",currentMaxRotZ];
}

/* This function will be called 30  times a second */
- (void) updateServerWithNewSpeedAndRotation
{
    //TODO
    //Send the updated SOD server with the new speed and rotations
}


/* This function will be called the first time the app is loaded */
- (void) connectToSODserver
{
    //TODO
    //Connect to server and register this client as device
    //Pair this device with Person
    //Calibrate with kinect so that the kinect can start observing locations
    //for this device
    
}

- (void) viewDidDisappear:(BOOL)animated
{
    //Stop sending the Acc. and Gyro updates
    [self.motionManager stopAccelerometerUpdates];
    [self.motionManager stopGyroUpdates];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)resetMaxValues:(id)sender {
    
    currentMaxAccelX = 0;
    currentMaxAccelY = 0;
    currentMaxAccelZ = 0;
    
    currentMaxRotX = 0;
    currentMaxRotY = 0;
    currentMaxRotZ = 0;
    
}
@end
