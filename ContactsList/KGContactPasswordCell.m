//
//  KGContactPasswordCell.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 06.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactPasswordCell.h"

@implementation KGContactPasswordCell

+ (NSString*)getIdentifier {
    return @"KGContactKGContactPasswordCellIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.showPasswordButton.imageView.tintColor = [UIColor grayColor];
}

- (IBAction)valueEditingDidEndAction:(id)sender {
    self.callBackBlock(self.valueTextField.text);
}

- (IBAction)showPasswordDownAction:(id)sender {
    self.valueTextField.secureTextEntry = NO;
    self.showPasswordButton.imageView.tintColor = [UIColor blueColor];
}

- (IBAction)showPasswordUpAction:(id)sender {
    self.valueTextField.secureTextEntry = YES;
    self.showPasswordButton.imageView.tintColor = [UIColor grayColor];
    
}
@end
