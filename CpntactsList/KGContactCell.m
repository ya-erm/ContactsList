//
//  KGContactCell.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactCell.h"

@implementation KGContactCell

+ (NSString*)getIdentifier{
    return @"KGContactCellIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photo.layer.cornerRadius = self.photo.frame.size.width/2;
}

- (void)configureWithObject:(KGContact *)contact{
    self.photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:contact.photoUrl]]];
    self.fullNameLabel.text = [NSString stringWithFormat:@"%@ %@", contact.firstName, contact.lastName];
    
}

@end
