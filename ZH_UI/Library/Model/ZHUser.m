//
//  ZHUser.m
//  ZH_UI
//
//  Created by Artem Zhavrotskiy on 08.04.17.
//  Copyright © 2017 Artem Zhavrotskiy. All rights reserved.
//

#import "ZHUser.h"
#import "NSArray+ZHExtensions.h"
#import "ZHObservableObject.h"
#import "NSFileManager+ZHExtensions.h"
#import "ZHFBConstants.h"

@interface ZHUser()
@property (nonatomic, strong)   ZHArrayModel  *friends;
@property (nonatomic, strong)   NSArray       *friendsIDs;

@end

kZHStringVariableDefinition(kZHRootKey, @"archive");
kZHStringKeyDefinition(kZHUserID);
kZHStringKeyDefinition(kZHUserFirstNameKey);
kZHStringKeyDefinition(kZHUserLastNameKey);
kZHStringKeyDefinition(kZHUserNameKey);
kZHStringKeyDefinition(kZHUserLocationKey);
kZHStringKeyDefinition(kZHUserHometownKey);
kZHStringKeyDefinition(kZHUserImageURLKey);
kZHStringKeyDefinition(kZHUserBigImageURLKey);
kZHStringKeyDefinition(kZHUserFriendIDsKey);

@implementation ZHUser

@dynamic imageModel;

#pragma mark -
#pragma mark Initialization and Deallocation

- (instancetype) init {
    self = [super init];
    if (self) {
        self.friends = [ZHArrayModel new];
    }
    
    return self;
}

- (instancetype) initWithID:(NSString *)ID {
    self = [self init];
    self.ID = ID;
    
    return self;
}

#pragma mark - 
#pragma mark Class Methods

+ (instancetype) userWithID:(NSString *)ID {
    return [[self alloc] initWithID:ID];
}

#pragma mark -
#pragma mark Accessors

- (void) fillWithDictionary:(NSDictionary *)dict {
    self.ID = dict[kZHID];
    self.firstName = dict[kZHFirstName];
    self.lastName = dict[kZHLastName];
    self.imageURL = [NSURL URLWithString:dict[kZHPicture][kZHData][kZHURL]];
    self.state = ZHModelDidLoad;
    
}

- (NSString *)fullName {
    
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (ZHImageModel *)imageModel {
    ZHImageModel *model = [ZHImageModel imageWithURL:self.imageURL];
    
    return model;
}

- (ZHImageModel *)bigImageModel {
    ZHImageModel *model = [ZHImageModel imageWithURL:self.bigImageURL];
    
    return model;
}

- (NSArray *)friendIDs {
    NSMutableArray *friendIDs = [NSMutableArray new];
    
    [self.friends.models performBlockWithEachObject:^(ZHUser *user) {
        [friendIDs addObject:user.ID];
    }];
    
    return [friendIDs copy];
}

- (void)setFriendIDs:(NSArray *)frinedIDs {
    [frinedIDs performBlockWithEachObject:^(NSString *ID) {
        ZHUser *user = [ZHUser userWithID:ID];
        user.state = ZHModelDidUnload;
        
        [self.friends addModel:user];
    }];
}

- (NSString *)plistName {
    return [NSString stringWithFormat:@"%@.plist", self.ID];
}

- (BOOL)isCacheExists {
    return [[NSFileManager defaultManager] fileExistsAtPath:self.cachePath];
}

- (NSString *)cachePath {
    NSString *cachePath = [[NSString alloc] initWithFormat:@"%@", [NSFileManager cacheDirectoryPath]];
    
    return [cachePath stringByAppendingPathComponent:self.plistName];
}

#pragma mark -
#pragma mark Public Methods

- (void)save {
    [NSKeyedArchiver archiveRootObject:[self JSONRepresentation]
                                toFile:self.cachePath];
    
    [self.friends.models performBlockWithEachObject:^(ZHUser *user) {
        [user save];
    }];
    
}

- (void)load {
    NSDictionary *archiver = [NSKeyedUnarchiver unarchiveObjectWithFile:self.cachePath][kZHRootKey];
    
    if (!archiver) {
        self.state = ZHModelDidFailLoading;
        
        return;
    }
    
#define ZHDecode(key, property) self.property = archiver[key];
    
    ZHDecode(kZHUserID, ID)
    ZHDecode(kZHUserFirstNameKey, firstName)
    ZHDecode(kZHUserLastNameKey, lastName)
    ZHDecode(kZHUserNameKey, name)
    ZHDecode(kZHUserLocationKey, location)
    ZHDecode(kZHUserHometownKey, hometown)
    ZHDecode(kZHUserImageURLKey, imageURL)
    ZHDecode(kZHUserBigImageURLKey, bigImageURL)
    ZHDecode(kZHUserFriendIDsKey, friendIDs)
    
#undef ZHDecode
    
    self.state = ZHModelDidLoad;
}

#pragma mark -
#pragma mark Private Methods

- (NSDictionary *)JSONRepresentation {
    NSMutableDictionary *archive = [NSMutableDictionary new];
    
#define ZHEncode(key, value) archive[key] = self.value;
    
    ZHEncode(kZHUserID, ID)
    ZHEncode(kZHUserFirstNameKey, firstName)
    ZHEncode(kZHUserLastNameKey, lastName)
    ZHEncode(kZHUserNameKey, name)
    ZHEncode(kZHUserLocationKey, location)
    ZHEncode(kZHUserHometownKey, hometown)
    ZHEncode(kZHUserImageURLKey, imageURL)
    ZHEncode(kZHUserBigImageURLKey, bigImageURL)
    ZHEncode(kZHUserFriendIDsKey, friendIDs)
    
#undef ZHEncode
    
    return [NSDictionary dictionaryWithObject:archive forKey:kZHRootKey];
}

@end
