//
//  SUIViewController.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "SUIViewController.h"

@implementation SUIViewController

#pragma mark -
#pragma mark Accessors

ZHBaseViewGetterSynthesize(SUIView, rootView);

- (void)setModel:(ZHModel *)model {
    if (_model != model) {
        [_model removeObserver:self];
        
        _model = model;
        
        [model addObserver:self];
    }
}

#pragma mark -
#pragma mark View Lifecycle

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.rootView.model = self.model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.rootView.model = self.model;
    
    [(ZHModel *)self.model load];
}

@end
