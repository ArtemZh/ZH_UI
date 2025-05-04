//
//  NSDictionary+ZHJSONAdapter.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSDictionary+ZHJSONAdapter.h"
#import "NSDictionary+ZHExtensions.h"

@implementation NSDictionary (ZHJSONAdapter)

- (instancetype)JSONRepresentation {
    NSMutableDictionary *dictionary = [NSMutableDictionary new];
    
    [self performBlockWithEachObject:^(id<ZHJSONAdapter> object, id key) {
        id processedObject = [object JSONRepresentation];
        
        if (processedObject) {
            dictionary[key] = object;
        }
    }];
    
    return [[self class] dictionaryWithDictionary:dictionary];
}


@end
