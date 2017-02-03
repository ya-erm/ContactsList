//
//  KGNetworkService.h
//  NavigationTest
//
//  Created by Ярослав Ермилов on 21.12.16.
//  Copyright © 2016 Kilograpp. All rights reserved.
//

#import <RestKit/RestKit.h>
#import <Foundation/Foundation.h>

@interface KGNetworkService : NSObject

+ (instancetype) defaultService;

- (void) loadContactsWithSuccessBlock:(void(^)(RKObjectRequestOperation *operation, RKMappingResult *mappingResult))success
                           failureBlock:(void(^)(RKObjectRequestOperation *operation, NSError *error))failure;
@end
