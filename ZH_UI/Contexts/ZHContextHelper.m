//
//  ZHContextHelper.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHContextHelper.h"
#import "ZHContext.h"

void ZHContextSetter(ZHContext * __strong *contextField, ZHContext *context) {
    if (*contextField != context) {
        [*contextField cancel];
        
        *contextField = context;
        
        [context execute];
    }
}
