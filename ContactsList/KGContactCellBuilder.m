//
//  KGContactParametherCellBuilder.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 06.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactCellBuilder.h"

#import "KGContactLabelCell.h"
#import "KGContactTextFieldCell.h"
#import "KGContactPasswordCell.h"

@implementation KGContactCellBuilder

+ (UITableViewCell *)tableView:(UITableView *)tableView contact:(KGContact *)contact cellForKey:(NSString *)key title:(NSString *)title type:(NSString *)type{
    NSString *value = [contact valueForKey:key];
    void (^callBackBlock)(NSString *newValue) = ^void(NSString *newValue) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [contact setValue:newValue forKey:key];
        [realm commitWriteTransaction];
    };
    if ([type isEqualToString:kLabelCellType]) {
        KGContactLabelCell *cell = [tableView dequeueReusableCellWithIdentifier:[KGContactLabelCell getIdentifier]] ?: [[KGContactLabelCell alloc] init];
        cell.titleLabel.text = title;
        cell.valueTextView.text = value;
        return cell;
    } else if ([type isEqualToString:kTextFieldCellType]) {
        KGContactTextFieldCell *cell = [tableView dequeueReusableCellWithIdentifier:[KGContactTextFieldCell getIdentifier]] ?: [[KGContactTextFieldCell alloc] init];
        cell.titleLabel.text = title;
        cell.valueTextField.text = value;
        cell.callBackBlock =  callBackBlock;
        return cell;
    } else if ([type isEqualToString:kPasswordCellType]) {
        KGContactPasswordCell *cell = [tableView dequeueReusableCellWithIdentifier:[KGContactPasswordCell getIdentifier]] ?: [[KGContactPasswordCell alloc] init];
        cell.titleLabel.text = title;
        cell.valueTextField.text = value;
        cell.callBackBlock = callBackBlock;
        return cell;
    }
    return NULL;
}

@end
