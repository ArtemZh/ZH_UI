//
//  NSArray+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 14.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSArray+ZHExtensions.h"

@implementation NSArray (ZHExtensions)

+ (instancetype)arrayWithObjectsFactoryWithCount:(NSUInteger)count block:(id(^)())block {
    if (!block) {
        return nil;
    }
    
    NSMutableArray *array = [NSMutableArray new];
    
    for (NSUInteger index = 0; index < count; index++) {
        [array addObject:block()];
    }
    
    return [self arrayWithArray:array];
}

- (NSArray *)filteredUsingBlock:(ZHArrayFiltredUsingBlock)block {
    if (!block) {
        return nil;
    }
    
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return block(evaluatedObject);
    }];
    
    return [self filteredArrayUsingPredicate:predicate];
}

- (id)objectWithClass:(Class)class {
    for (id object in self) {
        if ([object isMemberOfClass:class]) {
            return object;
        }
    }
    
    return nil;
}

- (void)performBlockWithEachObject:(void (^)(id object))block {
    if (!block) {
        return;
    }
    
    [self enumerateObjectsUsingBlock:^(id object, NSUInteger idex, BOOL *stop) {
        block(object);
    }];
}


@end
