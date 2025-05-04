//
//  ZHFBLoginContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ZHFBLoginContext.h"

#import "ZHUser.h"
#import "ZHGCD.h"
#import "ZHFBConstants.h"

#import "ZHMacros.h"

@interface ZHFBLoginContext ()
@property (nonatomic, strong)   UIViewController    *viewController;

- (NSArray *)readPermissions;

@end

@implementation ZHFBLoginContext

@dynamic graphPath;
@dynamic requestParameters;

#pragma mark -
#pragma mark Class Methods

+ (instancetype)loginContextWithUser:(ZHUser *)user
                      viewController:(UIViewController *)viewController
{
    return [[self alloc] initWithUser:(ZHUser *)user
                       viewController:(UIViewController *)viewController];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithUser:(ZHUser *)user
              viewController:(UIViewController *)viewController
{
    self = [super initWithModel:user];
    self.viewController = viewController;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return kZHMe;
}

- (NSDictionary *)requestParameters {
    return @{kZHFields: kZHID};
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithResult:(NSDictionary *)result {
    ZHUser *user = (ZHUser *)self.model;
    
    user.ID = (NSString *)result[kZHID];
    user.state = ZHModelDidLoad;
}

- (void)load {
    id handler = ^void(FBSDKLoginManagerLoginResult *result, NSError *error) {
        if (error) {
            NSLog(@"Process error");
        } else if (result.isCancelled) {
            NSLog(@"Cancelled");
        } else {
            [super load];
        }
    };
    
    ZHPerformAsyncBlockOnMainQueue(^{
        [[FBSDKLoginManager new] logInWithReadPermissions:[self readPermissions]
                                       fromViewController:self.viewController
                                                  handler:handler];
    });
}

#pragma mark -
#pragma mark Private

- (NSArray *)readPermissions {
    return @[kZHPublicProfile, kZHUserFriends, KZHUserLocation];
}

@end
