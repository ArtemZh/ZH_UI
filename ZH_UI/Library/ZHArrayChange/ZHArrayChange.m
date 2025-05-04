//
//  ZHArrayChange.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 11.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayChange.h"
#import "ZHAddingObject.h"
#import "ZHRemovingObject.h"
#import "ZHMovingObject.h"

@implementation ZHArrayChange

#pragma mark -
#pragma mark Class methods

+ (instancetype)addingObjectWithIndex:(NSUInteger)index object:(id)object {
    return [[ZHAddingObject alloc] initWithIndex:index object:(id)object];
}

+ (instancetype)removingObjectWithIndex:(NSUInteger)index object:(id)object {
    return [[ZHRemovingObject alloc] initWithIndex:index object:(id)object];
}

+ (instancetype)movingObjectwithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex object:(id)object {
    return [[ZHMovingObject alloc] initWithIndex:index fromIndex:fromIndex object:(id)object];
}


@end
