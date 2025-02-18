//
//  ZHObjectCache.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 02.05.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHObjectCache : NSObject

+ (instancetype)cache;

- (id)objectForKey:(id)key;

- (void)addObject:(id)object forKey:(id)key;

- (void)removeObjectForKey:(id)key;

@end
