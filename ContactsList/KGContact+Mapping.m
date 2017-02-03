//
//  KGCategory+Mapping.m
//  NavigationTest
//
//  Created by Ярослав Ермилов on 21.12.16.
//  Copyright © 2016 Kilograpp. All rights reserved.
//

#import "KGContact+Mapping.h"

@implementation KGContact (Mapping)

+ (RKObjectMapping *)objectMpping {
    RKObjectMapping *mapping = [RKObjectMapping mappingForClass:[KGContact class]];
    [mapping addAttributeMappingsFromDictionary: [self mappingDictionary]];
    return  mapping;
}

+ (NSDictionary *)mappingDictionary {
    return @{ @"name.first" : @"firstName",
              @"name.last" : @"lastName",
              @"picture.large" : @"photoUrl",
              @"email" : @"email",
              @"phone" : @"phone",
              @"login.username" : @"nickname",
              @"login.password" : @"password",
              @"dob" : @"birthday" };
}

@end
