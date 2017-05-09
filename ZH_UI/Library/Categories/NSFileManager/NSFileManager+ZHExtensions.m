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

//+ (NSString *)applicationDataPathWithFolderName:(NSString *)folderName {
//    NSString *path = [NSString stringWithFormat:@"%@", [self libraryDirectoryPath]];
//    NSString *dataPath = [path stringByAppendingPathComponent:folderName];
//    NSFileManager *fileManager = [NSFileManager defaultManager];
//    
//    NSError *error = nil;
//    
//    if (![fileManager fileExistsAtPath:dataPath]) {
//        [fileManager createDirectoryAtPath:dataPath
//               withIntermediateDirectories:YES
//                                attributes:nil
//                                     error:&error];
//        NSLog(@"%@", error);
//    }
//    
//    return dataPath;
//}

+ (NSURL *)directoryPathWithType:(NSSearchPathDirectory)type {
    return [[[NSFileManager defaultManager] URLsForDirectory:type
                                                   inDomains:NSUserDomainMask] lastObject];
}

//+ (NSString *)documentDirectoryPath {
//    ZHReturnOnce(NSString, documentDirectory, ^{ return [self pathWithDirectory:NSDocumentDirectory]; });
//}
//
//+ (NSString *)pathWithDirectory:(NSSearchPathDirectory)directory {
//    return [[self pathsWithDirectory:directory] firstObject];
//}


+ (NSURL *)documentDirectoryPath {
    NSURL *directoryPath = [self directoryPathWithType:NSDocumentDirectory];
    
    ZHReturnSharedInstance(directoryPath);
}

+ (NSURL *)libraryDirectoryPath {
    NSURL *directoryPath = [self directoryPathWithType:NSLibraryDirectory];
    
    ZHReturnSharedInstance(directoryPath);
}

+ (NSURL *)applicationDirectoryPath {
    NSURL *directoryPath = [self directoryPathWithType:NSApplicationDirectory];
    
    ZHReturnSharedInstance(directoryPath);
}

+ (NSURL *)cacheDirectoryPath {
    NSURL *directoryPath = [self directoryPathWithType:NSCachesDirectory];
    
    ZHReturnSharedInstance(directoryPath);
}

+ (NSArray *)pathsWithDirectory:(NSSearchPathDirectory)directory {
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES);
}



@end
