//
//  NSDictionary.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (ZHExtensions)

- (void)performBlockWithEachObject:(void (^)(id object, id key))block;

@end
