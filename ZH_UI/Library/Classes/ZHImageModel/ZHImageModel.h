//
//  ZHImageModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZHModel.h"

#import "ZHMacros.h"

@interface ZHImageModel : ZHModel
@property (nonatomic, readonly)     UIImage     *image;
@property (nonatomic, readonly)     NSURL       *url;

@property (nonatomic, readonly, getter=isLoaded)    BOOL    loaded;

+ (instancetype)imageWithURL:(NSURL *)url;

- (instancetype)initWithURL:(NSURL *)url;

- (void)performLoadingWithCompletionBlock:(void(^)(UIImage *image, id error))block;

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error;

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error;

@end
