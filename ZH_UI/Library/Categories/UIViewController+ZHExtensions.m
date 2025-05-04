//
//  UIViewController+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 15.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "UIViewController+ZHExtensions.h"
#import <Foundation/Foundation.h>

@implementation UIViewController (ZHExtensions)

- (id) initWithNib {
    NSString *nibName = [NSString stringWithFormat:@"%@", self.class];
    NSBundle *bundle = nil;
    id controller = [self initWithNibName:nibName bundle:bundle];
    
    return controller;
}

@end

