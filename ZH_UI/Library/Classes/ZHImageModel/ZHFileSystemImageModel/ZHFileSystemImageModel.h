//
//  ZHFileSystemImageModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHImageModel.h"

@interface ZHFileSystemImageModel : ZHImageModel
@property (nonatomic, readonly)                     NSString    *filePath;
@property (nonatomic, readonly, getter=isCached)    BOOL        cached;

@end
