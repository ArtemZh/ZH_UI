//
//  AppDelegate.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHAppDelegate.h"
#import "ZHViewController.h"
#import "UIWindow+ZHExtensions.h"

@interface ZHAppDelegate ()

@property (nonatomic,strong) ZHViewController *controller;

@end

@implementation ZHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [UIWindow makeWindow];
    self.window = window;
    
    self.controller = [[ZHViewController alloc] initWithNibName:@"ZHUserView" bundle:nil];
    self.controller.usersModel = [ZHUsers new];
    window.rootViewController = self.controller;
    
    [window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end
