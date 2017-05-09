//
//  ZHCell.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHCell.h"

#import "ZHImageModel.h"
#import "ZHUser.h"
#import "ZHImageView.h"

#import "ZHGCD.h"

#import "ZHMacros.h"

static NSString * const kZHNoImageName = @"image";
static NSString * const kZHNoImageExtension = @"jpg";

@interface ZHCell ()
@property (nonatomic, strong)   ZHImageModel *imageModel;

+ (ZHImageModel *)defaultImageModel;

@end

@implementation ZHCell

@dynamic imageModel;

#pragma mark -
#pragma mark Class Methods

+ (ZHImageModel *)defaultImageModel {
    ZHExecuteSetterOnce(^{
        NSURL *url = [[NSBundle mainBundle] URLForResource:kZHNoImageName
                                             withExtension:kZHNoImageExtension];
        
        return [ZHImageModel imageWithURL:url];
    });
}

#pragma mark -
#pragma mark Accessors

- (void)setModel:(ZHUser *)user {
    if (_model != user) {
        _model = user;
        
        [self fillWithUser:user];
    }
}

- (void)setImageModel:(ZHImageModel *)imageModel {
    if (self.userImageView.imageModel != imageModel) {
        [self.userImageView.imageModel removeObserver:self];
        
        [imageModel addObserver:self];
        
        self.userImageView.imageModel = imageModel;
    }
}

- (ZHImageModel *)imageModel {
    return self.userImageView.imageModel;
}

#pragma mark -
#pragma mark View Lifecycle

- (void)viewDidLoad {
    self.userImageView.contentMode = UIViewContentModeScaleAspectFit;
    
    self.userImageView.contentImageView.contentMode = UIViewContentModeScaleAspectFit;
}

#pragma mark -
#pragma mark Public

- (void)fillWithUser:(ZHUser *)user {
    self.fullNameLabel.text = user.fullName;
    
    self.imageModel = user.imageModel;
}

#pragma mark -
#pragma mark ZHModelObserver

- (void)modelDidFailLoading:(ZHModel *)model {
    ZHPerformAsyncBlockOnBackgroundQueue(^{
        self.imageModel = [ZHCell defaultImageModel];
    });
}

@end
