//
//  ZHTwoIndexArrayChange.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHTwoIndexArrayChange.h"

#import "NSIndexPath+ZHExtensions.h"

@implementation ZHTwoIndexArrayChange

@dynamic fromIndexPath;

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)initWithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex object:(id)object {
    self = [super initWithIndex:index object:object];
    if (self) {
        self.fromIndex = fromIndex;
        self.object = object;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)fromIndexPath {
    return [NSIndexPath indexPathForRow:self.fromIndex];
}

@end
