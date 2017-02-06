//
//  KGContactParametherCell.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactTextFieldCell.h"


@implementation KGContactTextFieldCell

+ (NSString*)getIdentifier {
    return @"KGContactTextFieldCellIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.arrowImage.tintColor = [UIColor lightGrayColor];
}

- (IBAction)valueEditingDidEndAction:(id)sender {
    self.callBackBlock(self.valueTextField.text);
}

@end
