//
//  ZHUser.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZHUser : NSObject

@property (nonatomic, copy)     NSString *name;
@property (nonatomic, copy)     NSString *surname;
@property (nonatomic, copy) NSString *fullName;
@property (nonatomic, copy) UIImage  *image;


@end
