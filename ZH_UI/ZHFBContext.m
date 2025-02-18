//
//  ZHFBContext.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.05.17..
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHFBContext.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>

#import "ZHModel.h"

#import "ZHJSONAdapter.h"

#import "ZHMacros.h"

@interface ZHFBContext ()
@property (nonatomic, strong) FBSDKGraphRequestConnection   *connection;

@end

@implementation ZHFBContext

@dynamic graphPath;
@dynamic requestParameters;

#pragma mark -
#pragma mark Initializations and Deallocations

- (void)dealloc {
    self.connection = nil;
}

#pragma mark -
#pragma mark Accessors

- (NSString *)graphPath {
    return nil;
}

- (NSDictionary *)requestParameters {
    return nil;
}

- (void)setConnection:(FBSDKGraphRequestConnection *)connection {
    if (_connection != connection) {
        [_connection cancel];
        
        _connection = connection;
    }
}

#pragma mark -
#pragma mark Public

- (void)load {
    ZHWeakify(self);
    id handler = ^(FBSDKGraphRequestConnection *connection,
                   id<ZHJSONAdapter> result,
                   NSError *error)
    {
        ZHStrongify(self);
        
        if (!error) {
            NSLog(@"%@", [result JSONRepresentation]);
            [self fillWithResult:[result JSONRepresentation]];
        } else {
            [self didFailLoadingFromInternet:error];
        }
    };
    
    FBSDKGraphRequest *request = [[FBSDKGraphRequest alloc] initWithGraphPath:self.graphPath
                                                                   parameters:self.requestParameters
                                                                   HTTPMethod:self.httpMethod];
    
    self.connection = [request startWithCompletionHandler:handler];
}

- (void)fillWithResult:(id)result {
    
}

- (void)didFailLoadingFromInternet:(NSError *)error {
    ZHModel *model = self.model;
    
    model.state = ZHModelDidFailLoading;
}

- (void)cancel {
    self.connection = nil;
    
}

@end
