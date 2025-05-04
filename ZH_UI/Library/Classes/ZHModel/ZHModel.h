//
//  ZHModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHObservableObject.h"

typedef NS_ENUM(NSUInteger, ZHModelState) {
    ZHModelDidUnload,
    ZHModelWillLoad,
    ZHModelDidLoad,
    ZHModelDidFailLoading,
    ZHCount
};

@protocol ZHModelObserver <NSObject>

@optional
- (void)modelDidLoad:(id)model;
- (void)modelDidFailLoading:(id)model;

- (void)modelWillLoad:(id)model;
- (void)modelDidUnload:(id)model;

@end

@interface ZHModel : ZHObservableObject

//- (void)save;
- (void)load;

//method sould implemented in subclasses
- (void)performLoading;
- (BOOL)shouldNotifyOfState:(NSUInteger)state;

@end
