//
//  ZHObservableObject.h
//  ZHObjectiveC
//
//  Created by Artem Zhavrotskiy on 18.07.16.
//  Copyright © 2016 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHObservableObject : NSObject <NSCopying>
@property (nonatomic, assign)   NSUInteger  state;
@property (nonatomic, readonly) NSSet       *observersSet;

- (void)addObserver:(id)observer;
- (void)removeObserver:(NSObject *)observer;
- (BOOL)containsObserver:(id)object;
- (void)addObservers:(NSArray *)observers;

- (SEL)selectorForState:(NSUInteger)state;

- (void)setState:(NSUInteger)state withObject:(id)object;
- (void)notifyOfState:(NSUInteger)state withObject:(id)object;
- (void)notifyOfState:(NSUInteger)state;

- (void)performBlockWithNotification:(void (^)(void))block;
- (void)performBlockWithoutNotification:(void (^)(void))block;


@end
