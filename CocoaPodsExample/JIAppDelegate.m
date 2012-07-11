//
//  JIAppDelegate.m
//  CocoaPodsExample
//
//  Created by Jose Ibanez on 7/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "JIAppDelegate.h"
#import "JIMainViewController.h"

//#import "SHK.h"
//#import "SHKConfiguration.h"
//#import "JISHKConfigurator.h"

@implementation JIAppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    DefaultSHKConfigurator *configurator = [[JISHKConfigurator alloc] init];
//    [SHKConfiguration sharedInstanceWithConfigurator:configurator];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *vc = [[JIMainViewController alloc] initWithNibName:nil bundle:nil];
    self.window.rootViewController = vc;
    
    [self.window makeKeyAndVisible];
    return YES;
}

@end
