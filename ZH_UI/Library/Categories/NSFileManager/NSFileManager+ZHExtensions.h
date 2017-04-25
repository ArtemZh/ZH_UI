//
//  NSFileManager+ZHExtensions.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (ZHExtensions)

+ (NSString *)applicationDataPathWithFolderName:(NSString *)folderName;

+ (NSString *)documentDirectoryPath;
+ (NSString *)libraryDirectoryPath;

+ (NSString *)pathWithDirectory:(NSSearchPathDirectory)directory;
+ (NSArray *)pathsWithDirectory:(NSSearchPathDirectory)directory;

@end
