//
//  ZHFBLoginContext.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHGetContext.h"

@class ZHUser;

@interface ZHFBLoginContext : ZHGetContext
+ (instancetype)loginContextWithUser:(ZHUser *)user
                      viewController:(UIViewController *)viewController;

- (instancetype)initWithUser:(ZHUser *)user
              viewController:(UIViewController *)viewController;

@end
