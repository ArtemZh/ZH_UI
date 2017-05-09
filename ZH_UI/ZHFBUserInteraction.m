//
//  ZHFBUserInteraction.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>

#import "ZHFBUserInteraction.h"

#import "ZHUser.h"

@interface ZHFBUserInteraction ()
@property (nonatomic, strong) FBSDKAccessToken  *token;

@end

@implementation ZHFBUserInteraction

#pragma mark -
#pragma mark Class Methods

+ (ZHUser *)userWithID:(ZHUser *)user {
    ZHFBUserInteraction *userGetter = [self new];
    
    return [userGetter userWithID:user];
}

+ (BOOL)isUserLoggedIn:(ZHUser *)user {
    return (BOOL)user.ID;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    self.token = [FBSDKAccessToken currentAccessToken];
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (ZHUser *)userWithID:(ZHUser *)user {
    user.ID = self.token ? self.token.userID : nil;
    
    return user;
}

@end
