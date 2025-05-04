//
//  ZHOneIndexArrayChange.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHOneIndexArrayChange.h"
#import "NSIndexPath+ZHExtensions.h"

@implementation ZHOneIndexArrayChange

@dynamic indexPath;

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)initWithIndex:(NSUInteger)index object:(id)object {
    self = [super init];
    if (self) {
        self.index = index;
        self.object = object;
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSIndexPath *)indexPath {
    return [NSIndexPath indexPathForRow:self.index];
}

@end
