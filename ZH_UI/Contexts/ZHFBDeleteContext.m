//
//  ZHFBDeleteContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 09.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFBDeleteContext.h"

#import "ZHMacros.h"

kZHStringVariableDefinition(kZHHTTPMethodDelete, @"DELETE");

@implementation ZHFBDeleteContext

#pragma mark -
#pragma mark Public Methods

- (NSString *)httpMethod {
    return kZHHTTPMethodDelete;
}


@end
