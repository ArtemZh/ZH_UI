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



@interface ZHUser : NSObject <NSCoding>

@property (nonatomic, copy) NSString        *name;
@property (nonatomic, copy) NSString        *surname;
@property (nonatomic, copy) NSString        *fullName;
@property (nonatomic, copy) ZHImageModel    *imageModel;


@end
