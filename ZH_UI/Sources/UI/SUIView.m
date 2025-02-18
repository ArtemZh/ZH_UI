//
//  ZHUIView.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "SUIView.h"

#import "ZHGCD.h"
#import "ZHMacros.h"

@implementation SUIView

#pragma mark -
#pragma mark Class Methods

+ (SUIView *)viewWithFrame:(CGRect)frame {
    SUIView *view = [[self alloc] initWithFrame:frame];
    
    return view;
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];

}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ZHModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [model addObserver:self];
    }
}

#pragma mark -
#pragma mark ZHModelObserver
//
//- (void)modelDidLoad:(ZHModel *)model {
//    ZHAsyncPerformInMainQueue(^{
//        self.loadingViewVisible = NO;
//    });
//}
//
//- (void)modelWillLoad:(ZHModel *)model {
//    ZHAsyncPerformInMainQueue(^{
//        self.loadingViewVisible = YES;
//    });
//}
//
//- (void)modelDidFailLoading:(ZHModel *)model {
//    ZHAsyncPerformInMainQueue(^{
//        self.loadingViewVisible = NO;
//    });
//}

@end
