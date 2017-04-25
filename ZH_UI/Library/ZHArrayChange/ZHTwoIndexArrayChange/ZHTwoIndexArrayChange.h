//
//  ZHTwoIndexArrayChange.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHOneIndexArrayChange.h"

@interface ZHTwoIndexArrayChange : ZHOneIndexArrayChange

@property (nonatomic, assign)   NSUInteger      fromIndex;
@property (nonatomic, readonly) NSIndexPath     *fromIndexPath;

- (instancetype)initWithIndex:(NSUInteger)index fromIndex:(NSUInteger)fromIndex object:(id)object;

@end
