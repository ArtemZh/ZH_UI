//
//  NSString+ZHExtensions.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (ZHExtensions)

+ (instancetype)alphanumericAlphabet;
+ (instancetype)numericAlphabet;
+ (instancetype)lowercaseLetterAlphabet;
+ (instancetype)uppercaseLetterAlphabet;
+ (instancetype)letterAlphabet;

+ (instancetype)alphabetWithUnicodeRange;
+ (instancetype)randomString;
+ (instancetype)randomStringWithLength:(NSUInteger)length;
+ (instancetype)randomStringWithLength:(NSUInteger)length alphabet:(NSString *)alphabet;

+ (instancetype)randomName;

- (NSArray *)symbols;

@end
