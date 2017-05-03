//
//  ViewController.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHViewController.h"
#import "ZHCell.h"
#import "ZHUsers.h"
#import "ZHMacros.h"
#import "ZHUserView.h"
#import "ZHModel.h"
#import "UINib+ZHExtension.h"
#import "UITableView+ZHExtension.h"



NSString *cellIdentifier = @"cellId";

ZHViewControllerBaseViewPropertyWithGetter(ZHViewController, ZHUserView, userView);

@interface ZHViewController ()

@end

@implementation ZHViewController


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.userView.model = self.usersModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ZHUsers *usersModel = self.usersModel;
    
    [usersModel addObserver:self];
    [usersModel load];
    
    [self.userView.tableView reloadData];
}




- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.usersModel.count;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHCell *cell = [tableView reusableCellWithClass:[ZHCell class]];
    
    [cell setUser:self.usersModel[indexPath.row]];
    
    return cell;
}


#pragma mark -
#pragma mark Interface Handling


- (IBAction)addCell:(id)sender {
    [self.usersModel addUser];
    [self.userView.tableView reloadData];
}

- (IBAction)Editing:(id)sender {
    self.userView.editing = !self.userView.editing;
}

-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    ZHUsers *users = self.usersModel;
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [users removeModelAtIndex:indexPath.row];
    }
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma mark
- (void)model:(ZHUsers *)model didChangeWithModel:(ZHArrayChange *)changeModel {
    [self.userView updateUsersViewWithModelChange:changeModel];
}

- (void)arrayModel:(ZHUsers *)model didUpdateWithModelChange:(ZHArrayChange *)modelChange {
    NSLog(@"%@", NSStringFromSelector(_cmd));
    [self.userView updateUsersViewWithModelChange:modelChange];
}


@end
