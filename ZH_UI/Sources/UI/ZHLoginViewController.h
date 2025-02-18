//
//  ZHLoginViewController.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import <UIKit/UIKit.h>

#import "SUIViewController.h"

@interface ZHLoginViewController : SUIViewController <ZHModelObserver>

- (IBAction)onLogin:(UIButton *)sender;

@end
