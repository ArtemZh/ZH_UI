//
//  ZHFilteredModel.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFilteredModel.h"

#import "ZHUsers.h"
#import "ZHUser.h"
#import "ZHArrayChange+ZHArrayModel.h"
#import "ZHAddingObject.h"
#import "ZHMovingObject.h"
#import "ZHRemovingObject.h"

#import "ZHGCD.h"
#import "NSArray+ZHExtensions.h"

#import "ZHMacros.h"

@interface ZHFilteredModel ()
@property (nonatomic, strong)   ZHArrayModel   *arrayModel;
@property (nonatomic, copy)     NSString        *filterString;

- (instancetype)initWithArrayModel:(id)model;

- (void)addModelsWithoutNotification:(NSArray *)array;
- (BOOL)shouldApplyWithChangeModel:(ZHArrayChange *)changeModel;

@end

@implementation ZHFilteredModel

#pragma mark -
#pragma mark Class methods

+ (instancetype)filteredModelWithArrayModel:(id)model {
    return [[self alloc] initWithArrayModel:model];
}

#pragma mark -
#pragma mark Initializations and deallocations

- (instancetype)initWithArrayModel:(id)model {
    self = [super init];
    self.arrayModel = model;
    
    return self;
}

#pragma mark -
#pragma mark Accessors

- (void)setArrayModel:(ZHArrayModel *)arrayModel {
    if (_arrayModel != arrayModel) {
        [_arrayModel removeObserver:self];
        
        _arrayModel = arrayModel;
        [_arrayModel addObserver:self];
    }
}

#pragma mark -
#pragma mark Public implementations

- (void)filterArrayWithString:(NSString *)text {
    ZHWeakify(self)
    ZHPerformAsyncBlockOnBackgroundQueue(^{
        ZHStrongifyAndReturnIfNil(self)
        self.filterString = text;
        
        [self removeAllObjects];
        NSArray *array = [[self.arrayModel.models filteredUsingBlock:^BOOL(ZHUser *user) {
            if (!text.length) {
                return YES;
            }
            
            return [user.fullName localizedCaseInsensitiveContainsString:text];
        }] mutableCopy];
        
        [self performBlockWithoutNotification:^{
            [self addModels:array];
        }];
        
        ZHPerformAsyncBlockOnMainQueue(^{
            ZHStrongifyAndReturnIfNil(self)
            [self notifyOfState:ZHModelDidFilter];
        });
    });
}

- (SEL)selectorForState:(NSUInteger)state {
    switch (state) {
        case ZHModelDidFilter:
            return @selector(modelDidFilter:);
            
        default:
            return [super selectorForState:state];
    }
}

#pragma mark -
#pragma mark Private implementations

- (void)removeAllObjects {
    for (id object in self.models) {
        ZHWeakify(self)
        [self performBlockWithoutNotification:^{
            ZHStrongifyAndReturnIfNil(self)
            [self removeModel:object];
        }];
    }
}

- (void)addModelsWithoutNotification:(NSArray *)array {
    ZHWeakify(self)
    [self performBlockWithoutNotification:^{
        ZHStrongifyAndReturnIfNil(self)
        [self addModels:array];
    }];
}

- (BOOL)shouldApplyWithChangeModel:(ZHArrayChange *)changeModel {
    ZHUser *object = changeModel.object;
    BOOL result = NO;
    NSString *filterString = self.filterString;
    
    if ([changeModel isMemberOfClass:[ZHAddingObject class]]) {
        result = filterString ? [object.fullName localizedCaseInsensitiveContainsString:filterString] : YES;
    } else if ([self containsModel:object]) {
        result = YES;
    }
    
    return result;
}

#pragma mark -
#pragma mark ZHModelObserver

- (void)modelDidLoad:(ZHArrayModel *)model {
    if (self.count) {
        [self removeAllObjects];
    }
    
    [self addModelsWithoutNotification:model.models];
    
    [self notifyOfState:model.state];
}

- (void)modelFailLoading:(ZHArrayModel *)model {
    [self notifyOfState:model.state];
}

- (void)modelWillLoad:(ZHArrayModel *)model {
    [self notifyOfState:model.state];
}

#pragma mark -
#pragma mark ZHArrayModelObserver

- (void)model:(id)model didChangeWithModel:(ZHArrayChange *)changeModel {
    if (!changeModel || ![self shouldApplyWithChangeModel:changeModel]) {
        return;
    }
    
    [changeModel applyToModel:self withObject:changeModel.object];
}

@end
