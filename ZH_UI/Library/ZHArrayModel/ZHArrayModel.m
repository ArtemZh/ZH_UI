//
//  ZHArrayModel.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayModel.h"

#import "ZHArrayChange.h"
#import "ZHGCD.h"

#import "NSMutableArray+ZHExtensions.h"
#import "NSFileManager+ZHExtensions.h"
#import "NSArray+ZHExtensions.h"

#import "ZHMacros.h"

@interface ZHArrayModel ()
@property (nonatomic, strong)   NSMutableArray  *mutableModels;

- (void)notifyOfArrayChangeWithObject:(id)object;

@end

@implementation ZHArrayModel

@dynamic models;
@dynamic count;

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)init {
    self = [super init];
    if (self) {
        self.mutableModels = [NSMutableArray array];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSArray *)models {
    @synchronized (self) {
        return [self.mutableModels copy];
    }
}

- (NSUInteger)count {
    @synchronized (self) {
        return [self.mutableModels count];
    }
}

#pragma mark -
#pragma mark Public implementations

- (void)addModel:(id)model {
    if (!model) {
        return;
    }
    
    @synchronized (self) {
        [self.mutableModels addObject:model];
        [self notifyOfArrayChangeWithObject:[ZHArrayChange addingObjectWithIndex:[self indexOfModel:model] object:model]];
    }
}

- (void)removeModel:(id)model {
    if (!model) {
        return;
    }
    
    @synchronized (self) {
        NSUInteger index = [self indexOfModel:model];
        [self.mutableModels removeObject:model];
        [self notifyOfArrayChangeWithObject:[ZHArrayChange removingObjectWithIndex:index object:model]];
    }
}

- (void)addModels:(NSArray *)models {
    @synchronized (self) {
        if (models) {
            for (id model in models) {
                [self addModel:model];
            }
        }
    }
}

- (id)modelAtIndex:(NSUInteger)index {
    if (!(index < self.count)) {
        return nil;
    }
    
    @synchronized (self) {
        return self.mutableModels[index];
    }
}

- (void)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex {
    if (fromIndex == toIndex) {
        return;
    }
    
    @synchronized (self) {
        [self.mutableModels moveObjectFromIndex:fromIndex toIndex:toIndex];
        [self notifyOfArrayChangeWithObject:[ZHArrayChange movingObjectwithIndex:toIndex
                                                                     fromIndex:fromIndex
                                                                        object:[self modelAtIndex:fromIndex]]];
    }
}

- (void)insertModel:(id)model atIndex:(NSUInteger)index {
    if (!model) {
        return;
    }
    
    @synchronized (self) {
        [self.mutableModels insertObject:model atIndex:index];
        [self notifyOfArrayChangeWithObject:[ZHArrayChange addingObjectWithIndex:index object:model]];
    }
}

- (BOOL)containsModel:(id)model {
    @synchronized (self) {
        return [self.mutableModels containsObject:model];
    }
}

- (void)removeModelAtIndex:(NSUInteger)index {
    @synchronized (self) {
        id object = [self modelAtIndex:index];
        [self.mutableModels removeObjectAtIndex:index];
        [self notifyOfArrayChangeWithObject:[ZHArrayChange removingObjectWithIndex:index object:object]];
    }
}

- (NSUInteger)indexOfModel:(id)model {
    @synchronized (self) {
        return [self.mutableModels indexOfObject:model];
    }
}

- (id)objectAtIndexedSubscript:(NSUInteger)index {
    return [self modelAtIndex:index];
}

#pragma mark -
#pragma mark Private implementations

- (void)notifyOfArrayChangeWithObject:(id)object {
    [self notifyOfState:ZHModelDidChange withObject:object];
}

#pragma mark -
#pragma mark NSFastEnumeration

- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state
                                  objects:(id __unsafe_unretained [])buffer
                                    count:(NSUInteger)length
{
    return [self.mutableModels countByEnumeratingWithState:state objects:buffer count:length];
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ZHModelDidChange:
            return @selector(model:didChangeWithModel:);
            
        default:
            return [super selectorForState:state];
    }
}



@end
