//
//  KGContactParametherCell.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGContactParametherCell : UITableViewCell

+ (NSString*)getIdentifier;

@property (weak, nonatomic) IBOutlet UILabel *parametherLabel;
@property (weak, nonatomic) IBOutlet UITextField *valueTextField;
@property (weak, nonatomic) IBOutlet UIButton *buttonShowPassword;

- (IBAction)showwPaswordAction:(id)sender;

@end
