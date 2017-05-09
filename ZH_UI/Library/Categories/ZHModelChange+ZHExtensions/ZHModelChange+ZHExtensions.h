//
//  ZHModelChange+ZHExtensions.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayChange.h"

@interface ZHArrayChange (ZHExtensions)

- (void)applyToTableView:(UITableView *)tableView
       withRowAnimation:(UITableViewRowAnimation) animation;

@end
