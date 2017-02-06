//
//  KGContactParametherCellBuilder.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 06.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KGContact.h"

// typedef enum typeOfCellEnum { labelCell, textFieldCell, passwordCell } TypeOfCell;

static NSString *const kLabelCellType = @"labelCell";
static NSString *const kTextFieldCellType = @"textFieldCell";
static NSString *const kPasswordCellType = @"passwordCell";

@interface KGContactCellBuilder : NSObject

+ (UITableViewCell *)tableView:(UITableView *)tableView contact:(KGContact *)contact cellForKey:(NSString *)key title:(NSString *)title type:(NSString *)type;

@end
