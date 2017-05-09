//
//  ZHImageView.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "SUIView.h"

#import "ZHImageModel.h"

@interface ZHImageView : SUIView

@property (nonatomic, strong)   IBOutlet UIImageView    *contentImageView;
@property (nonatomic, strong)   ZHImageModel           *imageModel;

@end

