//
//  ZHFileSystemImageModel.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFileSystemImageModel.h"

#import "NSFileManager+ZHExtensions.h"

@implementation ZHFileSystemImageModel

@dynamic filePath;

#pragma mark -
#pragma mark Accessors

- (NSString *)filePath {
    return self.url.path;
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *image, id error))block {
    block([UIImage imageWithContentsOfFile:self.filePath], nil);
}

@end
