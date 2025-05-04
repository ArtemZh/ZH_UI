//
//  ZHUIView.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHModel.h"

@interface SUIView : UIView <ZHModelObserver>
@property (nonatomic, strong) ZHModel  *model;

@end
