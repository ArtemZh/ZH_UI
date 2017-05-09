//
//  ZHURLImageModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFileSystemImageModel.h"

@interface ZHURLImageModel : ZHFileSystemImageModel
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

@end
