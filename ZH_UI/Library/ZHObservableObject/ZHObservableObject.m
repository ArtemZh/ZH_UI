//
//  ZHObservableObject.m
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHObservableObject.h"

#import "ZHMacros.h"



@interface ZHObservableObject ()
@property (nonatomic, retain) NSHashTable       *observersTable;
@property (nonatomic, assign) BOOL              shouldNotify;

- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object;

- (void)performBlock:(void (^)(void))block
        shouldNotify:(BOOL)shouldNotify;


@end

@implementation ZHObservableObject

@dynamic observersSet;

#pragma mark -
#pragma mark Initialisations / Deallocations

//- (void)dealloc {
//    self.observersTable = nil;
//    
//    [super dealloc];
//}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.observersTable = [NSHashTable weakObjectsHashTable];
    }
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (NSSet *)observersSet {
    @synchronized (self) {
        return self.observersTable.setRepresentation;
    }
}

#pragma mark -
#pragma mark Public implementations

- (void)addObserver:(id)observer {
    @synchronized (self) {
        if (observer) {
            [self.observersTable addObject:observer];
        }
    }
}

- (void)removeObserver:(NSObject *)observer {
    @synchronized (self) {
        [self.observersTable removeObject:observer];
    }
}

- (BOOL)containsObserver:(id)object {
    return [self.observersTable containsObject:object];
}

- (void)addObservers:(NSArray *)observers {
    @synchronized (self) {
        for (id observer in observers) {
            [self addObserver:observer];
        }
    }
}

- (void)setState:(NSUInteger)state {
    @synchronized (self) {
        [self setState:state withObject:nil];
    }
}

- (void)setState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        if (_state != state) {
            _state = state;
            
            [self notifyOfState:state withObject:object];
        }
    }
}

- (void)notifyOfState:(NSUInteger)state {
    @synchronized (self) {
        [self notifyOfState:state withObject:nil];
    }
}

- (void)notifyOfState:(NSUInteger)state withObject:(id)object {
    @synchronized (self) {
        [self notifyOfStateWithSelector:[self selectorForState:state] object:object];
    }
}

- (void)performBlockWithNotification:(void (^)(void))block {
    [self performBlock:block shouldNotify:YES];
}

- (void)performBlockWithoutNotification:(void (^)(void))block {
    [self performBlock:block shouldNotify:NO];
}


#pragma mark -
#pragma mark Private implementations

- (SEL)selectorForState:(NSUInteger)state {
    return NULL;
}

- (void)notifyOfStateWithSelector:(SEL)selector object:(id)object {
    NSHashTable *observers = self.observersTable;
    @synchronized (self) {
        for (id observer in observers) {
            if ([observer respondsToSelector:selector]) {
                [observer performSelector:selector withObject:self withObject:object];
            }
        }
    }
}

- (void)performBlock:(void (^)(void))block
        shouldNotify:(BOOL)shouldNotify
{
    BOOL state = self.shouldNotify;
    
    self.shouldNotify = shouldNotify;
    
    ZHPerformBlock(block);
    
    self.shouldNotify = state;
}

#pragma mark -
#pragma mark NSCopying

- (id)copyWithZone:(NSZone *)zone {
    ZHObservableObject *objectCopy = [[self class] new];
    objectCopy.observersTable = [self.observersTable copyWithZone:zone];
    
    return objectCopy;
}

@end

