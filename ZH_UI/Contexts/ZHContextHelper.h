//
//  ZHContextHelper.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHContext;

FOUNDATION_EXPORT
void ZHContextSetter(ZHContext * __strong *contextField, ZHContext *context);
