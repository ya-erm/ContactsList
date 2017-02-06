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

@property (weak, nonatomic) IBOutlet UIImageView *arrrowImageView;


+ (NSString*)getIdentifier;

- (void)configureWithObject:(KGContact*)contact;


@end



//[[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:www.myurl.com"]];
