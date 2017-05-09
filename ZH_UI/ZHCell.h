//
//  ZHCell.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHCellModel.h"
#import "ZHModel.h"

@class ZHUser;
@class ZHImageView;
@class ZHImageModel;

@interface ZHCell : UITableViewCell<ZHCellModel, ZHModelObserver>
@property (nonatomic, strong)   IBOutlet UILabel        *fullNameLabel;
@property (nonatomic, strong)   IBOutlet ZHImageView   *userImageView;
@property (nonatomic, strong)   ZHImageModel           *defaultImageModel;
@property (nonatomic, strong)   ZHUser                 *model;

- (void)fillWithUser:(ZHUser *)user;

@end
