//
//  ZHContext.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHContext : NSObject
@property (nonatomic, readonly) id  model;

+ (instancetype)contextWithModel:(id)model;
- (instancetype)initWithModel:(id)model;

- (void)execute;
- (void)cancel;

// Methods for override
- (void)load;
- (NSUInteger)contextExecutingState;
- (NSUInteger)contextDidExecuteState;


@end
