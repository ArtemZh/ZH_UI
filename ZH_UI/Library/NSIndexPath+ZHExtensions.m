//
//  NSIndexPath+ZHExtensions.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSIndexPath+ZHExtensions.h"

#import "UITableView+ZHExtension.h"


@implementation NSIndexPath (ZHExtensions)

+ (NSIndexPath *)indexPathForRow:(NSUInteger)index {
    return [self indexPathForRow:index inSection:0];
}

@end

