//
//  ZHDeleteChange+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHDeleteChange+ZHExtensions.h"

@implementation ZHRemovingObject (ZHExtensions)

- (void)applyToTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation) animation
{
    //add method tableView with block
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:self.index inSection:0];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
}


@end
