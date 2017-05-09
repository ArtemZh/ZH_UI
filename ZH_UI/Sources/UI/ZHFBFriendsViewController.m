//
//  ZHFBFriendsViewController.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFBFriendsViewController.h"
#import "ZHFBFriendsView.h"
#import "ZHCellModel.h"
#import "ZHCell.h"

#import "ZHFBLogoutContext.h"
#import "ZHFBFriendsContext.h"
#import "ZHContextHelper.h"

#import "UITableView+ZHExtension.h"

#import "ZHMacros.h"
#import "ZHGCD.h"

kZHStringVariableDefinition(kZHLogoutButtonTitle, @"Logout");

@interface ZHFBFriendsViewController ()
@property (nonatomic, strong)   ZHUser             *user;
@property (nonatomic, strong)   ZHFBLogoutContext  *logoutContext;
@property (nonatomic, strong)   ZHFBFriendsContext *friendsContext;

- (void)loadUsers;
- (void)setupNavigationBar;
- (UITableViewCell<ZHCellModel> *)cellForTable:(UITableView *)tableView
                                 withIndexPath:(NSIndexPath *)indexPath;
- (void)pushDetailsViewContollerForUser:(ZHUser *)user;
- (void)reloadTableView;

@end

ZHViewControllerBaseViewProperty(ZHFBFriendsViewController, ZHFBFriendsView, friendsView);

@implementation ZHFBFriendsViewController

#pragma mark - Initializations and Deallocations

- (instancetype)initWithUser:(ZHUser *)user {
    self = [super init];
    
    self.user = user;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ZHArrayModel *)model {
    if ([super model] != model) {
        [super setModel:model];
        
        if (self.isViewLoaded) {
            self.rootView.model = self.model;
        }
    }
}

- (void)setFriendsContext:(ZHFBFriendsContext *)friendsContext {
    ZHContextSetter(&_friendsContext, friendsContext);
}

- (void)setLogoutContext:(ZHFBLogoutContext *)logoutContext {
    ZHContextSetter(&_logoutContext, logoutContext);
}

#pragma mark -
#pragma mark Private

- (void)loadUsers {
    self.model = self.user.friends;
    
    self.friendsContext = [ZHFBFriendsContext contextWithModel:self.user];
}

- (void)setupNavigationBar {
    UIBarButtonItem *button = [[UIBarButtonItem alloc] initWithTitle:kZHLogoutButtonTitle
                                                               style:UIBarButtonItemStylePlain
                                                              target:self
                                                              action:@selector(onLogout:)];
    self.navigationItem.leftBarButtonItem = button;
}

- (void)pushDetailsViewContollerForUser:(ZHUser *)user {
//    ZHFBUserDetailsViewController *controller = [ZHFBUserDetailsViewController new];
//    controller.model = user;
//    
//    [self.navigationController pushViewController:controller animated:YES];
}

- (UITableViewCell<ZHCellModel> *)cellForTable:(UITableView *)tableView
                                  withIndexPath:(NSIndexPath *)indexPath
{
    return [tableView reusableCellWithClass:[ZHCell class]];
}

- (void)reloadTableView {
    ZHWeakify(self);
    ZHPerformAsyncBlockOnMainQueue(^{
        ZHStrongifyAndReturnIfNil(self);
        
        [self.friendsView.tableView reloadData];
    });
}

#pragma mark -
#pragma mark View Lifecycle

- (IBAction)onLogout:(UIBarButtonItem *)button {
    ZHFBLogoutContext *logoutContext = [ZHFBLogoutContext contextWithModel:self.user];
    
    self.logoutContext = logoutContext;
    
    [logoutContext execute];
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadUsers];
}

- (void)awakeFromNib {
    [self setupNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark ZHArrayModelObserver

- (void)modelDidLoad:(ZHArrayModel *)array {
    [self reloadTableView];
}

#pragma mark -
#pragma mark UITableViewDataSource

- (NSInteger)   tableView:(UITableView *)tableView
    numberOfRowsInSection:(NSInteger)section
{
    return ((ZHArrayModel *)self.model).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell<ZHCellModel> *cell = [self cellForTable:tableView withIndexPath:indexPath];
    
    cell.model = self.model[indexPath.row];
    
    return cell;
}

- (BOOL)        tableView:(UITableView *)tableView
    canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self pushDetailsViewContollerForUser:self.model[indexPath.row]];
}

@end
