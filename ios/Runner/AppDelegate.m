#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"

@import UIKit;
#import "GoogleMaps/GoogleMaps.h"
#import<FirebaseCore/FirebaseCore.h>


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [FIRApp configure];
     [GMSServices provideAPIKey:@"AIzaSyC5cXcdfY3d2Nm9JvGKi0w1gq3kmWBtON8"];
     [GeneratedPluginRegistrant registerWithRegistry:self];
    return YES;
}

@end

