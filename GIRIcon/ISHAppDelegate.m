#import "ISHAppDelegate.h"
#import "ISHView.h"

@implementation ISHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    ISHView *view = [[ISHView alloc] initWithFrame:CGRectMake(0.f, 0.f, 512.f, 512.f)];
    view.center = CGPointMake(CGRectGetMidX(self.window.bounds), CGRectGetMidY(self.window.bounds));
    [self.window addSubview:view];
    
    return YES;
}

@end
