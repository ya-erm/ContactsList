//
//  KGCategory+Mapping.h
//  NavigationTest
//
//  Created by Ярослав Ермилов on 21.12.16.
//  Copyright © 2016 Kilograpp. All rights reserved.
//

#import "KGContact.h"
#import <RestKit/RestKit.h>

@interface KGContact (Mapping)

+ (RKObjectMapping *) objectMpping;
+ (NSDictionary *) mappingDictionary;

@end
