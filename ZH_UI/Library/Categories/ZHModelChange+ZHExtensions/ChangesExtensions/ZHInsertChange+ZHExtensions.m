//
//  ZHInsertChange+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHInsertChange+ZHExtensions.h"

@implementation ZHAddingObject (ZHExtensions)

- (void)changeTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation) animation
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    [tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}

@end
