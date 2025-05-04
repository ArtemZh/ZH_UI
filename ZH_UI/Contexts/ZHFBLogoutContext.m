//
//  ZHFBLogoutContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 09.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ZHFBLogoutContext.h"

#import "ZHUser.h"

#import "ZHFBConstants.h"

@implementation ZHFBLogoutContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    ZHUser *user = (ZHUser *)self.model;
    
    return [NSString stringWithFormat:@"%@/%@", user.ID, kZHPermissions];
}

- (NSDictionary *)requestParameters {
    return nil;
}

#pragma mark -
#pragma mar Public Methods

- (void)load {
    [[FBSDKLoginManager new] logOut];
}

@end
