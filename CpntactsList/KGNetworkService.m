//
//  KGNetworkService.m
//  NavigationTest
//
//  Created by Ярослав Ермилов on 21.12.16.
//  Copyright © 2016 Kilograpp. All rights reserved.
//

#import "KGNetworkService.h"
#import "KGContact+Mapping.h"

@interface KGNetworkService()

@property (nonatomic, strong) RKObjectManager *objectManager;
@property (nonatomic, strong) NSURL *baseURL;

@end

@implementation KGNetworkService

+ (instancetype) defaultService {
    KGNetworkService *service = [[KGNetworkService alloc] initWithBaseURL:[NSURL URLWithString:@"https://randomuser.me/"]];
    [service configureRestkit];
    return service;
}

- (instancetype)initWithBaseURL:(NSURL *)baseURL {
    if (self = [super init]) {
        self.baseURL = baseURL;
    }
    return self;
}

- (void) configureRestkit {
    self.objectManager = [RKObjectManager managerWithBaseURL:self.baseURL];
    [self.objectManager addResponseDescriptor:[RKResponseDescriptor responseDescriptorWithMapping:[KGContact objectMpping]
                                                                                           method:RKRequestMethodAny
                                                                                      pathPattern:nil
                                                                                          keyPath:@"results"
                                                                                      statusCodes:RKStatusCodeIndexSetForClass(RKStatusCodeClassSuccessful)]];
}
- (void) loadContactsWithSuccessBlock:(void(^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
                           failureBlock:(void(^)(RKObjectRequestOperation *operation, NSError *error))failure {
    [self.objectManager getObjectsAtPath:@"/api/" parameters:nil success:success failure:failure];
    
}
@end
