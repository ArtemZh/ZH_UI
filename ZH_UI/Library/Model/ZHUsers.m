//
//  ZHUsers.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUsers.h"

#import "ZHUser.h"

#import "NSFileManager+ZHExtensions.h"
#import "NSObject+ZHExtensions.h"


static const NSUInteger kZHUsersCount = 5;

@implementation ZHUsers

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    return self;
}
- (NSString *)path {
    NSString *fileName = [NSString stringWithFormat:@"%@.plist", NSStringFromClass([self class])];
    NSURL *appDirectory = [NSFileManager documentDirectoryPath];
    
    return [[appDirectory path]stringByAppendingString:fileName];
}

#pragma mark -
#pragma mark Private Methods

- (void)save {
    [NSKeyedArchiver archiveRootObject:self.models toFile:self.path];
}

- (NSArray *)savedUsers {
    return [NSKeyedUnarchiver unarchiveObjectWithFile:self.path];
}

- (NSArray *)randomUsers {
    return [ZHUser objectsWithCount:kZHUsersCount];
}

- (void)performLoading {
    NSArray *users = self.savedUsers;
    users = users ?: self.randomUsers;
    
    [self performBlockWithoutNotification:^{
        [self addModels:users];
    }];
    
    self.state = ZHModelDidLoad;
}

- (void)subscribeToAppNotifications:(NSArray *)notifications {
    [self performBlockWithNotification:^{
        [self save];
    }];
    
}

@end
