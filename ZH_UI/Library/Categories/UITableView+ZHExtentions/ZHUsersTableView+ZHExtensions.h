//
//  ZHUsersTableView+ZHExtensions.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//
#import "ZHArrayChange.h"
#import <UIKit/UIKit.h>

@interface UITableView (ZHExtensions)

- (void)updateTableViewWithModelChange:(ZHArrayChange *)modelChange;

@end
