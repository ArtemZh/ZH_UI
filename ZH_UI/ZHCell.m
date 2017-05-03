//
//  ZHCell.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCell.h"


@implementation ZHCell

#pragma mark -
#pragma mark Accessors

- (void)setUser:(ZHUser *)user {
    if (_user != user) {
        _user = user;
        
        [self fillWithModel:user];
    }
}

#pragma mark -
#pragma mark Public Implementations

- (void)fillWithModel:(ZHUser *)user {
    NSString * text = user.name;
    self.textLabel.text = text;
    [self.imageView setImage:user.imageModel];
}

#pragma mark -
#pragma mark Private methods




@end
