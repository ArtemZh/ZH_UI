//
//  ZHArrayChange+ZHArrayModel.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 18.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHArrayModel.h"

#import "ZHArrayChange.h"

@interface ZHArrayChange (ZHArrayModel)

//sholuld be launched from child classes
- (void)applyToModel:(id)model withObject:(id)object;

@end
