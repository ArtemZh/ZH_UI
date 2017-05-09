//
//  ZHFBContext.h
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHContext.h"

@interface ZHFBContext : ZHContext
@property (nonatomic, readonly) NSString        *graphPath;
@property (nonatomic, readonly) NSDictionary    *requestParameters;

// Methods for override
- (NSString *)httpMethod;

- (void)fillWithResult:(id)result;

- (void)didFailLoadingFromInternet:(NSError *)error;



@end
