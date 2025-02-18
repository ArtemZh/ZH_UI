//
//  UITableView+ZHExtension.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "UITableView+ZHExtension.h"
#import "UINib+ZHExtension.h"
#import "ZHMacros.h"

@implementation UITableView (ZHExtension)

- (id)reusableCellfromNibWithClass:(Class)cls {
    NSString *identifier = NSStringFromClass(cls);
    UITableViewCell *cell = [self dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        UINib *nib = [UINib nibWithClass:cls];
        cell = [nib objectWithClass:[cls class]];
        
    }
    
    return cell;
}

- (id)dequeueReusableCellWithClass:(Class)cls {
    return [self dequeueReusableCellWithIdentifier:NSStringFromClass(cls)];
}

- (id)reusableCellWithClass:(Class)cls {
    id cell = [self dequeueReusableCellWithClass:cls];
    if (!cell) {
        cell = [UINib objectWithClass:cls];
    }
    
    return cell;
}

- (void)updateTableViewWithBlock:(ZHTableViewUpdateBlock)block {
    if (!block) {
        return;
    }
    
    [self beginUpdates];
    ZHPerformBlock(block);
    [self endUpdates];
}


@end
