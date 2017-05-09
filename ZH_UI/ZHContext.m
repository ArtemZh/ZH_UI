//
//  ZHContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHContext.h"
#import "ZHModel.h"
#import "ZHGCD.h"

@interface ZHContext ()
@property (nonatomic, strong)   id  model;

@end

@implementation ZHContext

#pragma mark -
#pragma mark Class Methods

+ (instancetype)contextWithModel:(id)model {
    return [[self alloc] initWithModel:model];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithModel:(id)model {
    self = [super init];
    self.model = model;
    
    return self;
}

#pragma mark -
#pragma mark Public Methods

- (void)execute {
    ZHModel *model = self.model;
    
    @synchronized(model) {
        NSUInteger state = model.state;
        if ([self contextDidExecuteState] == state
            || [self contextExecutingState] == state)
        {
            [model notifyOfState:state];
            
            return;
        }
        
        model.state = [self contextExecutingState];
        
        ZHPerformAsyncBlockOnBackgroundQueue(^{
            [self load];
        });
    }
}

- (void)cancel {
    
}

- (NSUInteger)contextExecutingState {
    return ZHModelWillLoad;
}

- (NSUInteger)contextDidExecuteState {
    return ZHModelDidLoad;
}

- (void)load {
    [(ZHModel *)self.model load];
}

@end
