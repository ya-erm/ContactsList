//
//  KGContactParametherCell.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGContactTextFieldCell : UITableViewCell

+ (NSString*)getIdentifier;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UIImageView *arrowImage;

@property (copy, nonatomic) void (^callBackBlock)(NSString *newValue);

- (IBAction)valueEditingDidEndAction:(id)sender;

@end
