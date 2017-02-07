//
//  KGContactCell.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContact.h"
#import <UIKit/UIKit.h>

@interface KGContactCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photo;
@property (weak, nonatomic) IBOutlet UILabel *fullNameLabel;
@property (weak, nonatomic) IBOutlet UITextView *emailTextView;
@property (weak, nonatomic) IBOutlet UITextView *phoneTextView;
@property (weak, nonatomic) IBOutlet UIImageView *emailImageView;
@property (weak, nonatomic) IBOutlet UIImageView *phoneImageView;

@property (weak, nonatomic) IBOutlet UIImageView *arrrowImageView;


+ (NSString *)getIdentifier;

+ (CGFloat)heightWithCollapced:(BOOL)collapsed;

- (void)configureWithObject:(KGContact*)contact;
- (void)configureWithObject:(KGContact*)contact collapsed:(BOOL)collapsed;


@end


