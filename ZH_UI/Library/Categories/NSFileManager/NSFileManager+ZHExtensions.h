//
//  NSFileManager+ZHExtensions.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ZHExtensions)

+ (NSURL *)documentDirectoryPath;
+ (NSURL *)libraryDirectoryPath;
+ (NSURL *)applicationDirectoryPath;
+ (NSURL *)cacheDirectoryPath;

+ (NSArray *)pathsWithDirectory:(NSSearchPathDirectory)directory;

@end
