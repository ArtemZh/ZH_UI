//
//  ZHUserView.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUserView.h"
#import "ZHArrayChange.h"
#import "ZHMacros.h"
#import "UITableView+ZHExtension.h"
#import "ZHUsersTableView+ZHExtensions.h"


ZHStringConstantWithValue(kZHEditingButton, Edit);
ZHStringConstantWithValue(kZHDoneButton, Done);


@implementation ZHUserView

#pragma mark -
#pragma mark Accessors

- (void)setEditing:(BOOL)editing {
    if (_editing != editing) {
        _editing = editing;
        
        [self.tableView setEditing:!self.tableView.editing animated:YES];
//        [self.editButton setTitle:editing ? kZHDoneButton : kZHEditingButton forState:UIControlStateNormal];
    }
}
//rewrite!!!
- (void)setModel:(id)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [_model addObserver:self];
    }
}
// Method must be call in viewController
- (void)updateUsersViewWithModelChange:(ZHArrayChange *)modelChange {
    [self.tableView updateTableViewWithModelChange:modelChange];
}



@end
