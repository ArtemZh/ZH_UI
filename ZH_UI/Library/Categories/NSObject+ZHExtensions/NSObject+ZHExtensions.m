//
//  NSObject+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSObject+ZHExtensions.h"

#import "NSArray+ZHExtensions.h"

@implementation NSObject (ITExtensions)

+ (instancetype)object {
    return [[self alloc] init];
}

+ (NSArray *)objectsWithCount:(NSUInteger)count {
    return [NSArray arrayWithObjectsFactoryWithCount:count block:^id{
        return [self object];
    }];
}

@end
