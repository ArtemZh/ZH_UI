//
//  NSFileManager+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSFileManager+ZHExtensions.h"

#import "ZHMacros.h"

kZHStringVariableDefinition(appCache, @"appCache")

@implementation NSFileManager (ZHExtensions)

+ (NSURL *)directoryPathWithType:(NSSearchPathDirectory)type {
    return [[[NSFileManager defaultManager] URLsForDirectory:type
                                                   inDomains:NSUserDomainMask] lastObject];
}

+ (NSURL *)documentDirectoryPath {
    ZHReturnSharedInstance(^{return ZHDirectoryPathWithType(NSDocumentDirectory); });
}

+ (NSURL *)libraryDirectoryPath {
    ZHReturnSharedInstance(^{return ZHDirectoryPathWithType(NSLibraryDirectory); });
}

+ (NSURL *)applicationDirectoryPath {
    ZHReturnSharedInstance(^{return ZHDirectoryPathWithType(NSApplicationDirectory); });
}

+ (NSURL *)cacheDirectoryPath {
    ZHReturnSharedInstance(^{return ZHDirectoryPathWithType(NSCachesDirectory); });
}

+ (NSArray *)pathsWithDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
}

+ (NSURL *)appCacheDirectoryURL {
    
    ZHReturnSharedInstance(^{
        NSURL *libaryDirectoryURL = [NSFileManager libraryDirectoryPath];
        
        NSURL *cacheDirectoryURL = [libaryDirectoryURL URLByAppendingPathComponent:appCache];
        
        NSFileManager *fileManager = [self defaultManager];
        
        [fileManager createDirectoryAtURL:cacheDirectoryURL];
        
        return cacheDirectoryURL;
    });
}

- (void)createDirectoryAtURL:(NSURL *)url {
    if (url.isFileURL) {
        NSString *path = url.path;
        if (![self fileExistsAtPath:path]) {
            [self createDirectoryAtPath:path
            withIntermediateDirectories:YES
                             attributes:nil
                                  error:NULL];
        }
    }
}

- (void)copyItemAtURL:(NSURL *)url
                toURL:(NSURL *)toURL
{
    NSError *error = nil;
    
    [self createDirectoryAtURL:[toURL URLByDeletingLastPathComponent]];
    
    [self copyItemAtURL:url toURL:toURL error:&error];
}


@end
