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

+ (CGFloat)heightWithCollapced:(BOOL)collapsed {
    return collapsed ? 60 : 105;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.photo.layer.cornerRadius = self.photo.frame.size.width/2;
    
    self.arrrowImageView.tintColor = [UIColor lightGrayColor];
}

- (void)configureWithObject:(KGContact *)contact{
    [self configureWithObject:contact collapsed:YES];
}

- (void)configureWithObject:(KGContact*)contact collapsed:(BOOL)collapsed {
    self.photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:contact.photoUrl]]];
    self.fullNameLabel.text = contact.fullName;
    
    self.emailTextView.text = contact.email;
    self.emailImageView.hidden = self.emailTextView.hidden = collapsed;
    self.phoneTextView.text = contact.phone;
    self.phoneImageView.hidden = self.phoneTextView.hidden = collapsed;
}

@end
