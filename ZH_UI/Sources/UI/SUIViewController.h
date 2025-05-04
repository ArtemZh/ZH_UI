//
//  SUIViewController.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHModel.h"

#import "SUIView.h"
#import "ZHContext.h"

#import "ZHMacros.h"

@interface SUIViewController : UIViewController <ZHModelObserver>
@property (nonatomic, strong)   id            model;

ZHDefineBaseViewProperty(SUIView, rootView);

@end
