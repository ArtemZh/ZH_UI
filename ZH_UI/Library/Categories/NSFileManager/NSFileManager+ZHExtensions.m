//
//  NSFileManager+ZHExtensions.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "NSFileManager+ZHExtensions.h"

#import "ZHMacros.h"

@implementation NSFileManager (ZHExtensions)

+ (NSString *)applicationDataPathWithFolderName:(NSString *)folderName {
    NSString *dataPath = [[self libraryDirectoryPath] stringByAppendingPathComponent:folderName];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSError *error = nil;
    
    if (![fileManager fileExistsAtPath:dataPath]) {
        [fileManager createDirectoryAtPath:dataPath
               withIntermediateDirectories:YES
                                attributes:nil
                                     error:&error];
        NSLog(@"%@", error);
    }
    
    return dataPath;
}

+ (NSString *)documentDirectoryPath {
    ZHReturnOnce(NSString, documentDirectory, ^{ return [self pathWithDirectory:NSDocumentDirectory]; });
}

+ (NSString *)libraryDirectoryPath {
    ZHReturnOnce(NSString, libraryDirectory, ^{ return [self pathWithDirectory:NSLibraryDirectory]; });
}

+ (NSString *)pathWithDirectory:(NSSearchPathDirectory)directory {
    return [[self pathsWithDirectory:directory] firstObject];
}

+ (NSArray *)pathsWithDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
}

@end
