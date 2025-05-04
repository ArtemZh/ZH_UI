//
//  ZHModel.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHModel.h"
#import "ZHGCD.h"
#import "ZHMacros.h"


@implementation ZHModel


#pragma mark -
#pragma mark Public imolementations

- (void)performLoading {
    
}

- (BOOL)shouldNotifyOfState:(NSUInteger)state {
    return ZHModelDidLoad == state || ZHModelWillLoad == state;
}

#pragma mark -
#pragma mark saving and restoring of state

 
- (void)load {
    NSUInteger state = self.state;
    @synchronized (self) {
        if ([self shouldNotifyOfState:state]) {
            [self notifyOfState:state];
            
            return;
        }
        
        self.state = ZHModelWillLoad;
        
        ZHWeakify(self)
        ZHPerformAsyncBlockOnBackgroundQueue(^{
            ZHStrongifyAndReturnIfNil(self)
            [self performLoading];
        });
    }
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ZHModelDidLoad:
            return @selector(modelDidLoad:);
            
        case ZHModelDidFailLoading:
            return @selector(modelDidFailLoading:);
            
        case ZHModelWillLoad:
            return @selector(modelWillLoad:);
            
        case ZHModelDidUnload:
            return @selector(modelDidUnload:);
            
        default:
            return [super selectorForState:state];
    }
}

@end
