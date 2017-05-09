//
//  ZHUser.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+ZHExtensions.h"

#import "ZHModel.h"
#import "ZHImageModel.h"
#import "ZHArrayModel.h"



@interface ZHUser : ZHModel
@property (nonatomic, copy)     NSString        *ID;
@property (nonatomic, copy)     NSString        *firstName;
@property (nonatomic, copy)     NSString        *lastName;
@property (nonatomic, readonly) NSString        *fullName;
@property (nonatomic, copy)     NSString        *name;
@property (nonatomic, copy)     NSString        *location;
@property (nonatomic, copy)     NSString        *hometown;
@property (nonatomic, readonly) ZHArrayModel   *friends;

@property (nonatomic, copy)     NSURL           *imageURL;
@property (nonatomic, readonly) ZHImageModel    *imageModel;

@property (nonatomic, copy)     NSURL           *bigImageURL;
@property (nonatomic, readonly) ZHImageModel    *bigImageModel;

@property (nonatomic, readonly) NSString        *plistName;
@property (nonatomic, readonly) NSString        *cachePath;
@property (nonatomic, readonly, getter=isCacheExists) BOOL cacheExists;

+ (instancetype)user;
+ (instancetype)userWithID:(NSString *)ID;

- (instancetype)initWithID:(NSString *)ID;

+ (NSArray *)usersWithCount:(NSUInteger)count;

- (void)save;


@end
