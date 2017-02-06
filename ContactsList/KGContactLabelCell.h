//
//  KGContactLabelCell.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 06.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KGContactLabelCell : UITableViewCell

+ (NSString*)getIdentifier;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
//@property (weak, nonatomic) IBOutlet UILabel *valueLabel;
@property (weak, nonatomic) IBOutlet UITextView *valueTextView;

@end
