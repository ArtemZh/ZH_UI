//
//  ZHObjectCache.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHObjectCache.h"

#import "ZHMacros.h"

@interface ZHObjectCache ()
@property (nonatomic, strong)   NSMapTable  *imageCache;

@end

@implementation ZHObjectCache

#pragma mark -
#pragma mark Class Methods

+ (instancetype)cache {
    ZHReturnSharedInstanceWithBlock(^{
        return [self new];
    });
}

#pragma mark -
#pragma mark Initializations and Deallocations

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.imageCache = [NSMapTable strongToWeakObjectsMapTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Public

- (id)objectForKey:(id)key {
    @synchronized (self) {
        return [self.imageCache objectForKey:key];
    }
}

- (void)addObject:(id)object forKey:(id)key {
    @synchronized (self) {
        [self.imageCache setObject:object forKey:key];
    }
}

- (void)removeObjectForKey:(id)key {
    @synchronized (self) {
        [self.imageCache removeObjectForKey:key];
    }
}

- (BOOL)containsObjectForKey:(id)key {
    return nil != [self objectForKey:key];
}

- (NSUInteger)count {
    @synchronized (self) {
        return [self.imageCache count];
    }
}

@end
