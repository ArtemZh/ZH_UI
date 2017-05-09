//
//  NSArray+ZHJSONAdapter.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSArray+ZHJSONAdapter.h"
#import "NSArray+ZHExtensions.h"

@protocol ZHSafeArrayAdapter

+ (instancetype)safeArrayWithArray:(id)array;

@end

@interface NSArray  (ZHJSONAdapterPrivate) <ZHSafeArrayAdapter>

@end

@interface NSMutableArray (ZHJSONAdapterPrivate) <ZHSafeArrayAdapter>

@end


@implementation NSArray (ZHJSONAdapter)

- (instancetype)JSONRepresentation {
    NSMutableArray *array = [NSMutableArray new];
    
    [self performBlockWithEachObject:^(id<ZHJSONAdapter> object) {
        id processedObject = [object JSONRepresentation];
        
        if (processedObject) {
            [array addObject:processedObject];
        }
    }];
    
    return [[self class] safeArrayWithArray:array];
}

@end

@implementation NSArray (ZHJSONAdapterPrivate)

+ (instancetype)safeArrayWithArray:(NSArray *)array {
    return [NSArray arrayWithArray:array];
}

@end

@implementation NSMutableArray (ZHJSONAdapterPrivate)

+ (instancetype)safeArrayWithArray:(NSMutableArray *)array {
    return [NSMutableArray arrayWithArray:array];
}



@end
