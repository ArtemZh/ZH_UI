//
//  ZHUser.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUser.h"


static NSString * const kZHImageName = @"image";
static NSString * const kZHImageType = @"jpg";
static NSString * const kZHCoderName = @"CoderName";
static NSString * const kZHCoderImageURL = @"CoderNameImageURL";
static NSString * const kZHImageURL = @"https://lh3.googleusercontent.com/P8xsQbL2TR22Hqobz3xjxA7MIsCJJGEkWwoxNLFGeDT6esrBd0lPSS155UZmQAdA0G-pdcb29WPQZl8=w1439-h778";

@implementation ZHUser

@dynamic imageModel;

- (instancetype) init {
    self = [super init];
    if (self) {
        self.name = [NSString randomName];
    }
    
    return self;
}



- (ZHImageModel *)imageModel {
    NSURL *url = [NSURL URLWithString:kZHImageURL];
    
    return [ZHImageModel imageWithURL:url];
}


#pragma mark -
#pragma mark NSCoding

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        _name = [aDecoder decodeObjectForKey:kZHCoderName];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_name forKey:kZHCoderName];
}

@end
