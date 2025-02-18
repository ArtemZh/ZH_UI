//
//  ZHImageModel.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHImageModel.h"

#import "ZHGCD.h"
#import "ZHObjectCache.h"

#import "ZHFileSystemImageModel.h"
#import "ZHURLImageModel.h"

@interface ZHImageModel ()
@property (nonatomic, strong)     UIImage     *image;
@property (nonatomic, strong)     NSURL       *url;

@end

@implementation ZHImageModel

#pragma mark -
#pragma marl Class Methods

+ (instancetype)imageWithURL:(NSURL *)url {
    Class cls = [url.scheme isEqualToString:@"file"] ? [ZHFileSystemImageModel class] : [ZHURLImageModel class];
    
    return [[cls alloc] initWithURL:url];
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)initWithURL:(NSURL *)url {
    ZHObjectCache *objectCache = [ZHObjectCache cache];
    id imageCache = [objectCache objectForKey:url];
    
    if (imageCache) {
        return imageCache;
    }
    
    self = [super init];
    if (self) {
        self.url = url;
        [objectCache addObject:self forKey:url];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void(^)(UIImage *image, id error))block {
    
}

- (void)finalizeLoadingWithImage:(UIImage *)image error:(id)error {
    self.image = image;
}

- (void)notifyOfLoadingStateWithImage:(UIImage *)image error:(id)error {
    ZHWeakify(self);
    ZHPerformAsyncBlockOnMainQueue(^{
        ZHStrongifyAndReturnIfNil(self);
        self.state = self.image ? ZHModelDidLoad : ZHModelDidFailLoading;
    });
}

- (void)performLoading {
    sleep(1);
    ZHWeakify(self);
    [self performLoadingWithCompletionBlock:^(UIImage *image, id error) {
        ZHStrongifyAndReturnIfNil(self);
        [self finalizeLoadingWithImage:image error:error];
        [self notifyOfLoadingStateWithImage:image error:error];
    }];
}

@end
