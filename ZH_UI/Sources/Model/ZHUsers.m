//
//  ZHUsers.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUsers.h"
#import "ZHUser.h"

static ZHUsers* __usersList;

@implementation ZHUsers

+(ZHUsers*)usersList {
    if (__usersList == nil) {
        __usersList =  [ZHUsers new];
        __usersList.ZHUsersArray = [NSMutableArray new];
    }
    
 //   [__usersList generateUsers];
    
    return __usersList;
}

-(void)generateUsers {
    int i = 0;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZHUserDefaultImage" ofType:@"png"];

    while (i < 10) {
        ZHUser *user = [ZHUser new];
        NSString *userName = [[NSString alloc] initWithFormat:@"test %i", i];
        [user setName:userName];
        user.image = [[UIImage alloc] initWithContentsOfFile:path];
        [self.ZHUsersArray addObject:user];
        i++;
    }
}

-(void)addUser {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"ZHUserDefaultImage" ofType:@"png"];
    NSUInteger userCount = [self.ZHUsersArray count];
    ZHUser *user = [ZHUser new];
    NSString *userName = [[NSString alloc] initWithFormat:@"test %lu", userCount];
    [user setName:userName];
    user.image = [[UIImage alloc] initWithContentsOfFile:path];
    [self.ZHUsersArray addObject:user];
}

@end
