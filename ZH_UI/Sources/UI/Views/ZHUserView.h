//
//  ZHUserView.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 23.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHModel.h"
#import "ZHArrayChange.h"

#import <UIKit/UIKit.h>

@interface ZHUserView : UIView

@property (nonatomic,strong)    IBOutlet UITableView    *tableView;
@property (nonatomic,strong)    IBOutlet UIButton       *editButton;
@property (weak, nonatomic)     IBOutlet UIButton       *addButton;
@property (nonatomic, strong)   ZHModel                 *model;

@property (nonatomic,assign, getter=isEditing) BOOL      editing;

- (void)updateUsersViewWithModelChange:(ZHArrayChange *)modelChange;

@end
