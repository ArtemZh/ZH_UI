//
//  UITableView+ZHExtension.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ZHTableViewUpdateBlock)(void);

@interface UITableView (ZHExtension)

- (id)reusableCellfromNibWithClass:(Class)cls;
- (id)reusableCellWithClass:(Class)cls;
- (id)dequeueReusableCellWithClass:(Class)cls;
- (void)updateTableViewWithBlock:(ZHTableViewUpdateBlock)block;

@end
