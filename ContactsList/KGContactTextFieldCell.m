//
//  KGContactParametherCell.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactTextFieldCell.h"

@interface KGContactTextFieldCell() <UITextFieldDelegate>

@end

@implementation KGContactTextFieldCell

+ (NSString*)getIdentifier {
    return @"KGContactTextFieldCellIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.arrowImage.tintColor = [UIColor lightGrayColor];
    self.valueTextField.delegate = self;
}

- (IBAction)valueEditingDidEndAction:(id)sender {
    self.callBackBlock(self.valueTextField.text);
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.valueTextField resignFirstResponder];
    return YES;
}

@end
