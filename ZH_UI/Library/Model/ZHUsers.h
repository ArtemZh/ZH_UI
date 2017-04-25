//
//  ZHUsers.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHArrayModel.h"

@interface ZHUsers : ZHArrayModel
@property(nonatomic,strong) NSMutableArray *ZHUsersArray;

- (ZHUsers*) usersList;
- (void) addUser;
- (void) generateUsers;

@end
