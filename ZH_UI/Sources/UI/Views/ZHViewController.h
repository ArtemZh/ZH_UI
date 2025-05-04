//
//  ViewController.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUsers.h"
#import "ZHUserView.h"

#import <UIKit/UIKit.h>

@interface ZHViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, ZHModelObserver>
@property (nonatomic, strong) ZHUsers *usersModel;

- (IBAction)onAdd:(id)sender;
- (IBAction)editing:(id)sender;

@end

