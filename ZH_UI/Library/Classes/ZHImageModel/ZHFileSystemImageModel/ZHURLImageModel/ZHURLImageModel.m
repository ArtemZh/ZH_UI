//
//  ZHURLImageModel.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHURLImageModel.h"

#import "NSFileManager+ZHExtensions.h"
#import "NSString+ZHExtensions.h"

@interface ZHURLImageModel ()
@property (nonatomic, readonly)   NSURLSession              *downloadSession;
@property (nonatomic, strong)   NSURLSessionDownloadTask    *downloadTask;

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block;

@end

@implementation ZHURLImageModel

@dynamic downloadSession;

#pragma mark -
#pragma mark Accessors

- (NSURLSession *)downloadSession {
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration ephemeralSessionConfiguration]];
    
    ZHReturnSharedInstance(session);
}

- (void)setDownloadTask:(NSURLSessionDownloadTask *)downloadTask {
    if (_downloadTask != downloadTask) {
        [_downloadTask cancel];
        _downloadTask = downloadTask;
        [_downloadTask resume];
    }
}

#pragma mark -
#pragma mark Public

- (void)performLoadingWithCompletionBlock:(void (^)(UIImage *, id))block {
    if (self.cached) {
        [super performLoadingWithCompletionBlock:block];
    } else {
        [self performLoadingFromURLWithBlock:block];
    }
}

- (NSString *)filePath {
    NSString *cachePath = [[NSFileManager documentDirectoryPath] path];
    NSString *fileName = [self.url.relativePath stringByAddingPercentEncodingWithAllowedCharactersSet];
    
    return [cachePath stringByAppendingPathComponent:fileName];
}


#pragma mark -
#pragma mark Private

- (void)performLoadingFromURLWithBlock:(void (^)(UIImage *, id))block {
    ZHWeakify(self);
    NSURL *fileURL = [NSURL fileURLWithPath:self.filePath];
    self.downloadTask = [self.downloadSession downloadTaskWithURL:self.url
                                                completionHandler:^(NSURL *location,
                                                                    NSURLResponse *response,
                                                                    NSError *error)
                         {
                             ZHStrongifyAndReturnIfNil(self);
                             if (!error) {
                                 [[NSFileManager defaultManager] copyItemAtURL:location
                                                                         toURL:fileURL
                                                                         error:nil];
                                 [super performLoadingWithCompletionBlock:block];
                             }
                         }];
}

@end
