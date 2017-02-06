//
//  KGContactPasswordCell.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 06.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGContactPasswordCell : UITableViewCell

+ (NSString*)getIdentifier;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UIButton *showPasswordButton;

@property (copy, nonatomic) void (^callBackBlock)(NSString *newValue);


- (IBAction)valueEditingDidEndAction:(id)sender;

- (IBAction)showPasswordDownAction:(id)sender;
- (IBAction)showPasswordUpAction:(id)sender;

@end
