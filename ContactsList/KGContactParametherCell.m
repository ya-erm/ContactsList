//
//  KGContactParametherCell.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactParametherCell.h"

@implementation KGContactParametherCell

+ (NSString*)getIdentifier {
    return @"KGContactParametherCellIdentifier";
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (IBAction)showwPaswordAction:(id)sender {
    self.valueTextField.secureTextEntry = !self.valueTextField.secureTextEntry;
}


@end
