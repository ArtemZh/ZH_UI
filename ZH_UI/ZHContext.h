//
//  ZHContext.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZHModel.h"

@interface ZHContext : NSObject
@property (nonatomic, readonly) ZHModel*  model;

+ (instancetype)contextWithModel:(ZHModel *)model;
- (instancetype)initWithModel:(ZHModel *)model;

- (void)execute;
- (void)cancel;

// Methods for override
- (void)load;
- (NSUInteger)contextExecutingState;
- (NSUInteger)contextDidExecuteState;

@end
