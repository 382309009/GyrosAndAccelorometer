#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>


double currentMaxAccelX;
double currentMaxAccelY;
double currentMaxAccelZ;
double currentMaxRotX;
double currentMaxRotY;
double currentMaxRotZ;

double currentAcc;
double previousAcc;

double currentSpeed;
double previousSpeed;

double currentRotx;
double currentRoty;
double currentRotz;

static const double MY_CONSTANT_TIME_INTERVAL = 1/30 ;

@interface ViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *accX;
@property (strong, nonatomic) IBOutlet UILabel *accY;
@property (strong, nonatomic) IBOutlet UILabel *accZ;

@property (strong, nonatomic) IBOutlet UILabel *maxAccX;
@property (strong, nonatomic) IBOutlet UILabel *maxAccY;
@property (strong, nonatomic) IBOutlet UILabel *maxAccZ;

@property (strong, nonatomic) IBOutlet UILabel *rotX;
@property (strong, nonatomic) IBOutlet UILabel *rotY;
@property (strong, nonatomic) IBOutlet UILabel *rotZ;

@property (strong, nonatomic) IBOutlet UILabel *maxRotX;
@property (strong, nonatomic) IBOutlet UILabel *maxRotY;
@property (strong, nonatomic) IBOutlet UILabel *maxRotZ;

@property (weak, nonatomic) IBOutlet UILabel *previousSpeed;
@property (weak, nonatomic) IBOutlet UILabel *currentSpeed;


- (IBAction)resetMaxValues:(id)sender;

@property (strong, nonatomic) CMMotionManager *motionManager;

@end
