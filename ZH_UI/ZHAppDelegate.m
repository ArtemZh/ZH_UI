//
//  AppDelegate.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHAppDelegate.h"

#import "UIWindow+ZHExtensions.h"
#import "UIViewController+ZHExtensions.h"

#import "ZHLoginViewController.h"

@interface ZHAppDelegate ()

@property (nonatomic,strong) ZHLoginViewController *controller;

@end

@implementation ZHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [UIWindow window];
    self.window = window;
    
    self.controller = [[ZHLoginViewController alloc] initWithNib];
    UINavigationController *navigationController = [[UINavigationController alloc]
                                             initWithRootViewController:self.controller];
    window.rootViewController = navigationController;
    
    [window makeKeyAndVisible];
    
    
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
            options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options {

    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:options[UIApplicationOpenURLOptionsSourceApplicationKey]
                                                       annotation:options[UIApplicationOpenURLOptionsAnnotationKey]
            ];

}

- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    [self saveModel];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveModel];
}

- (void)saveModel {

}

@end
