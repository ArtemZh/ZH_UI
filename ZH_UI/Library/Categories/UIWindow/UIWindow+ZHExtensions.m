//
//  UIWindow+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "UIWindow+ZHExtensions.h"

@implementation UIWindow (ZHExtensions)

#pragma mark -
#pragma mark Class Methods

+ (instancetype)makeWindow {
    return [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
}

@end
