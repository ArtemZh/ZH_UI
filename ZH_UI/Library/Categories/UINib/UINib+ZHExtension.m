//
//  UINib+ZHExtension.m
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 04.10.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "UINib+ZHExtension.h"

@implementation UINib (Extension)

// add pragma mark
#pragma mark

+ (UINib *)nibWithClass:(Class)cls {
    return [self nibWithClass:cls bundle:nil];
}

+ (UINib *)nibWithClass:(Class)cls
                 bundle:(NSBundle *)bundle
{
    return [UINib nibWithNibName:NSStringFromClass(cls)
                          bundle:bundle];
}

+ (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls
                          bundle:nil];
}

+ (id)objectWithClass:(Class)cls bundle:(NSBundle *)bundle {
    return [self objectWithClass:cls
                          bundle:bundle
                       withOwner:nil
                     withOptions:nil];
}

+ (id)objectWithClass:(Class)cls
               bundle:(NSBundle *)bundle
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    UINib *nib = [self nibWithClass:cls bundle:bundle];
//add categories for NSArray
    NSArray *objects = [nib instantiateWithOwner:owner
                                         options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}

#pragma mark

- (id)objectWithClass:(Class)cls {
    return [self objectWithClass:cls
                       withOwner:nil];
}

- (id)objectWithClass:(Class)cls
            withOwner:(id)owner
{
    return [self objectWithClass:cls
                       withOwner:owner
                     withOptions:nil];
}

- (id)objectWithClass:(Class)cls
            withOwner:(id)owner
          withOptions:(NSDictionary *)options
{
    NSArray *objects = [self instantiateWithOwner:owner
                                          options:options];
    
    for (id object in objects) {
        if ([object isMemberOfClass:cls]) {
            return object;
        }
    }
    
    return nil;
}



@end
