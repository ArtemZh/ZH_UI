//
//  NSMutableArray+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSMutableArray+ZHExtensions.h"

@implementation NSMutableArray (ZHExtensions)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex  toIndex:(NSUInteger)toIndex {
    @synchronized (self) {
        id object = self[fromIndex];
        
        NSLog(@"Before moving object:%@ at index:%lu", object, (unsigned long)[self indexOfObject:object]);
        NSLog(@"Moving %@ fromIntdex:%lu toIndex:%lu", object, (unsigned long)fromIndex, (unsigned long)toIndex);
        
        [self removeObjectAtIndex:fromIndex];
        [self insertObject:object atIndex:toIndex];
        
        NSLog(@"After moving object at index:%@. Moved object index:%lu",
              self[toIndex],
              (unsigned long)[self indexOfObject:object]);
    }
}

@end
