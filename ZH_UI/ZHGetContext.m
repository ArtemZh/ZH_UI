//
//  ZHGetContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHGetContext.h"

#import "ZHMacros.h"

kZHStringVariableDefinition(kZHHTTPMethodGet, @"GET");

@implementation ZHGetContext

#pragma mark -
#pragma mark Public Methods

- (NSString *)httpMethod {
    return kZHHTTPMethodGet;
}


@end
