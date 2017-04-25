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

ZHViewControllerBaseViewPropertyWithGetter(ZHViewController, userView, ZHUserView);

@interface ZHViewController ()

@end

@implementation ZHViewController


- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.userView.model = self.usersModel;
}

- (void)viewDidLoad {
// https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/CreateConfigureTableView/CreateConfigureTableView.html
    
    [super viewDidLoad];
    
    self.usersModel = [self.usersModel usersList];
    [self.usersModel addObserver:self];
    NSLog(@"%@", self.usersModel.ZHUsersArray);

    self.userView.tableView.delegate = self;
    self.userView.tableView.dataSource = self;

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
    
    NSLog(@"%@", cell.user);
    return cell;
}


#pragma mark -
#pragma mark Interface Handling


- (IBAction)addCell:(id)sender {
    [self.usersModel addUser];
    NSLog(@"%lu", [self.usersModel.ZHUsersArray count]);
}

- (IBAction)Editing:(id)sender {
    [self setEditing:!self.userView.editing animated:YES];
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


-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
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
