//
//  ZHImageView.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHImageView.h"

#import "ZHGCD.h"
#import "ZHImageModel.h"

#import "ZHMacros.h"

@interface ZHImageView ()

@end

@implementation ZHImageView

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        [self initSubviews];
    }
    
    return self;
}

- (void)initSubviews {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.bounds];
    imageView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin
    | UIViewAutoresizingFlexibleWidth
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleRightMargin
    | UIViewAutoresizingFlexibleTopMargin
    | UIViewAutoresizingFlexibleHeight;
    
    self.contentImageView = imageView;
}

#pragma mark -
#pragma mark Accessors

-  (void)setContentImageView:(UIImageView *)contentImageView {
    if (contentImageView != _contentImageView) {
        [_contentImageView removeFromSuperview];
        
        _contentImageView = contentImageView;
        
        [self addSubview:contentImageView];
    }
}

- (void)setImageModel:(ZHImageModel *)imageModel {
    if (_imageModel != imageModel) {
        [_imageModel removeObserver:self];
        
        _imageModel = imageModel;
        
        [imageModel addObserver:self];
        
        [imageModel load];
    }
}

#pragma mark -
#pragma mark ZHImageModelObserver

- (void)modelDidUnload:(ZHImageModel *)imageModel {
    ZHPerformAsyncBlockOnMainQueue(^{
        self.contentImageView.image = imageModel.image;
    });
    
    [super modelDidUnload:imageModel];
}

- (void)modelWillLoad:(ZHImageModel *)imageModel {
    [super modelWillLoad:imageModel];
}

- (void)modelDidLoad:(ZHImageModel *)imageModel {
    ZHPerformAsyncBlockOnMainQueue(^{
        self.contentImageView.image = imageModel.image;
        
        [super modelDidLoad:imageModel];
    });
}

- (void)modelDidFailLoading:(ZHImageModel *)imageModel {
    ZHPerformAsyncBlockOnMainQueue(^{
        [super modelDidFailLoading:imageModel];
    });
}

@end
