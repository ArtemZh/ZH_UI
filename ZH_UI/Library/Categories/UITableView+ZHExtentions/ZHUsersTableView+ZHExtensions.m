//
//  ZHUsersTableView+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUsersTableView+ZHExtensions.h"
#import "ZHUsersTableView+ZHExtensions.h"
#import "ZHModelChange+ZHExtensions.h"
#import "UITableView+ZHExtension.h"

@implementation UITableView (ZHExtensions)


- (void)updateTableViewWithModelChange:(ZHArrayChange *)modelChange {
    [self updateTableViewWithBlock:^{
        [modelChange changeTableView:self withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
}



@end
