//
//  NSArray+ZHExtensions.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 14.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^ZHArrayFiltredUsingBlock)(id object);

@interface NSArray (ZHExtensions)

+ (instancetype)arrayWithObjectsFactoryWithCount:(NSUInteger)count block:(id(^)())block;

- (NSArray *)filteredUsingBlock:(ZHArrayFiltredUsingBlock)block;
- (id)objectWithClass:(Class)cls;
- (void)performBlockWithEachObject:(void (^)(id object))block;

@end
