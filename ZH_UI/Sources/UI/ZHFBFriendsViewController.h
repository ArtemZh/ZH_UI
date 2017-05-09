//
//  ZHFBFriendsViewController.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "SUIViewController.h"

#import "ZHModel.h"
#import "ZHUser.h"

#import "ZHContext.h"
#import "ZHMacros.h"

@interface ZHFBFriendsViewController : SUIViewController <
    UITableViewDelegate,
    UITableViewDataSource>

- (instancetype)initWithUser:(ZHUser *)user;

@end
