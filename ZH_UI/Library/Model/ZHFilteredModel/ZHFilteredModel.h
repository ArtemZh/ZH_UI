//
//  ZHFilteredModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayModel.h"

typedef NS_ENUM(NSUInteger, ZHFilteredModelState) {
    ZHModelDidFilter = ZHArrayModelCount
};

@protocol ZHFilteredModelObserver <NSObject, ZHModelObserver>

@optional
- (void)modelDidFilter:(id)model;

@end

@interface ZHFilteredModel : ZHArrayModel <ZHModelObserver, ZHArrayModelObserver>

+ (instancetype)filteredModelWithArrayModel:(id)model;

- (void)filterArrayWithString:(NSString *)text;

@end
