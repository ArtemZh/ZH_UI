//
//  NSDictionary.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSDictionary+ZHExtensions.h"

@implementation NSDictionary (ZHExtentions)

#pragma mark -
#pragma mark Public Methods

- (void)performBlockWithEachObject:(void (^)(id object, id key))block {
    if (!block) {
        return;
    }
    
    [[self allKeys] enumerateObjectsUsingBlock:^(id key, NSUInteger index, BOOL *stop) {
        block(self[key], key);
    }];
}

@end
