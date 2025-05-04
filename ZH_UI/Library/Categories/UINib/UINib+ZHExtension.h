//
//  UINib+ZHExtension.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINib (Extension)

+ (UINib *)nibWithClass:(Class)cls;
+ (UINib *)nibWithClass:(Class)cls bundle:(NSBundle *)bundle;

+ (id)objectWithClass:(Class)cls;
+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle;
+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle withOwner:(id)owner withOptions:(NSDictionary *)options;

- (id)objectWithClass:(Class)cls;
- (id)objectWithClass:(Class)cls withOwner:(id)owner;
- (id)objectWithClass:(Class)cls withOwner:(id)owner withOptions:(NSDictionary *)options;


@end
