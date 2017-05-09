//
//  ZHLoginViewController.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "ZHFBFriendsViewController.h"
#import "ZHUser.h"

#import "ZHGCD.h"

#import "ZHFBUserInteraction.h"
#import "ZHFBLoginContext.h"
#import "ZHContextHelper.h"

@interface ZHLoginViewController ()
@property (nonatomic, strong)   ZHFBLoginContext   *loginContext;

- (void)showFriendsViewControllerForUser:(ZHUser *)user;

@end

@implementation ZHLoginViewController

#pragma mark -
#pragma mark Accessors

- (void)setLoginContext:(ZHFBLoginContext *)loginContext {
    ZHContextSetter(&_loginContext, loginContext);
}
#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (IBAction)onLogin:(UIButton *)sender {
    ZHUser *user = [ZHUser new];
    self.model = user;
    
    self.loginContext = [[ZHFBLoginContext alloc] initWithUser:user viewController:self];
}

#pragma mark -
#pragma mark Private Methods

- (void)showFriendsViewControllerForUser:(ZHUser *)user {
    ZHFBFriendsViewController *controller = [[ZHFBFriendsViewController alloc] initWithUser:user];
    
    [self.navigationController pushViewController:controller
                                         animated:NO];
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZHUser *user = [ZHFBUserInteraction userWithID:[ZHUser new]];
    self.model = user;
    if ([ZHFBUserInteraction isUserLoggedIn:user]) {
        NSLog(@"Friends View controller user ID is %@", user.ID);
        [self showFriendsViewControllerForUser:user];
    }
}

#pragma mark -
#pragma mark ZHUserStateObserver

- (void)modelDidLoad:(ZHUser *)user {
    ZHPerformSyncBlockOnMainQueue(^{
        [self showFriendsViewControllerForUser:user];
    });
}


@end
