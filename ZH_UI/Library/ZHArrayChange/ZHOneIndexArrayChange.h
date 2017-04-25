//
//  ZHOneIndexArrayChange.h
//  iOSProject
//
//  Created by Artem Zhavrotskiy on 01.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayChange.h"

@interface ZHOneIndexArrayChange : ZHArrayChange

@property (nonatomic, assign)   NSUInteger  index;
@property (nonatomic, readonly) NSIndexPath *indexPath;

- (instancetype)initWithIndex:(NSUInteger)index object:(id)object;


@end
