//
//  ZHFBFriendsContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFBFriendsContext.h"

#import "ZHArrayModel.h"
#import "ZHUser.h"
#import "ZHFBConstants.h"
#import "NSArray+ZHExtensions.h"

@interface ZHFBFriendsContext ()

@end

@implementation ZHFBFriendsContext

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    ZHUser *user = (ZHUser *)self.model;
    
    return [NSString stringWithFormat:@"%@/%@", user.ID, kZHFriends];
}

- (NSDictionary *)requestParameters {
    return @{kZHFields:[NSString stringWithFormat:@"%@, %@, %@, %@",
                         kZHID,
                         kZHFirstName,
                         kZHLastName,
                         kZHLargePicture]};
}

#pragma mark -
#pragma mark Public Methods

- (void)fillWithResult:(NSDictionary *)result {
    NSArray *friendsArray = [result objectForKey:kZHData];
    
    ZHUser *user = (ZHUser *)self.model;
    
    ZHArrayModel *friends = user.friends;
    
    [friendsArray performBlockWithEachObject: ^(NSDictionary *friendInfo){
        ZHUser *user = [ZHUser new];
        user.ID = friendInfo[kZHID];
        user.firstName = friendInfo[kZHFirstName];
        user.lastName = friendInfo[kZHLastName];
        user.imageURL = [NSURL URLWithString:friendInfo[kZHPicture][kZHData][kZHURL]];
        user.state = ZHModelDidLoad;
        
        [friends performBlockWithoutNotification:^{
            [friends addModel:user];
        }];
    }];
    
    [user save];
    
    friends.state = ZHModelDidLoad;
}

- (void)didFailLoadingFromInternet:(NSError *)error {
    ZHUser *user = (ZHUser *)self.model;
    
    [user performBlockWithoutNotification:^{
        [user load];
    }];
    
    ZHArrayModel *friends = user.friends;
    
    [friends.models performBlockWithEachObject:^(ZHUser *user) {
        [user load];
    }];
    
    friends.state = ZHModelDidLoad;
}

@end
