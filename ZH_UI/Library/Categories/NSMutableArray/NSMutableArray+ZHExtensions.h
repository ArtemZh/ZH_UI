//
//  NSMutableArray+ZHExtensions.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableArray (ZHExtensions)

- (void)moveObjectFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

@end
