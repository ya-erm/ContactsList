//
//  KGContact.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContact.h"

@implementation KGContact

- (NSString *)fullName{
    return [NSString stringWithFormat:@"%@ %@", self.firstName, self.lastName];
}

- (NSInteger)ages{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitYear fromDate:self.birthday toDate:[NSDate date] options:0];
    return components.year;
}

- (NSString *)agesString{
    NSString *prefix = @"лет";
    switch (self.ages % 10) {
            case 1:
            prefix = @"год";
            break;
            case 2:
            case 3:
            case 4:
            prefix = @"года";
            break;
    }
    return [NSString stringWithFormat:@"%ld %@",self.ages, prefix];
}

@end
