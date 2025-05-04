//
//  ZHArrayChange.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 11.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "UIKit/UIKit.h"

#import <Foundation/Foundation.h>

@interface ZHArrayChange : NSObject
@property (nonatomic, strong)   id  object;

+ (instancetype)addingObjectWithIndex:(NSUInteger)index object:(id)object;
+ (instancetype)removingObjectWithIndex:(NSUInteger)index object:(id)object;
+ (instancetype)movingObjectwithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex object:(id)object;

@end
