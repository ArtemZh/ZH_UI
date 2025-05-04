//
//  ZHFBUserInteraction.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHUser;

@interface ZHFBUserInteraction : NSObject

+ (ZHUser *)userWithID:(ZHUser *)user;
+ (BOOL)isUserLoggedIn:(ZHUser *)user;

- (ZHUser *)userWithID:(ZHUser *)user;


@end
