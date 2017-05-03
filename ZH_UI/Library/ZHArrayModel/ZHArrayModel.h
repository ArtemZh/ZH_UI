//
//  ZHArrayModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHModel.h"

typedef NS_ENUM(NSUInteger, ZHModelChangeState) {
    ZHModelDidChange = ZHCount,
    ZHArrayModelCount
};

@protocol ZHArrayModelObserver <NSObject, ZHModelObserver>

@optional
- (void)model:(id)model didChangeWithModel:(id)changeModel;

@end

@interface ZHArrayModel : ZHModel <NSFastEnumeration>
@property (nonatomic, readonly) NSArray     *models;
@property (nonatomic, readonly) NSUInteger  count;

- (void)addModel:(id)model;
- (void)removeModel:(id)model;

- (void)addModels:(NSArray *)models;

- (id)modelAtIndex:(NSUInteger)index;

- (BOOL)containsModel:(id)model;
- (NSUInteger)indexOfModel:(id)model;

- (void)insertModel:(id)model atIndex:(NSUInteger)index;
- (void)removeModelAtIndex:(NSUInteger)index;

- (void)moveModelFromIndex:(NSUInteger)fromIndex toIndex:(NSUInteger)toIndex;

- (id)objectAtIndexedSubscript:(NSUInteger)index;

@end
