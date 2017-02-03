//
//  ContactDetailsViewController.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactParametherCell.h"
#import "ContactDetailsViewController.h"

@interface ContactDetailsViewController ()

@end

@implementation ContactDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.contact.fullName;
    self.photo.layer.cornerRadius = self.photo.frame.size.width/2;
    self.photo.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.contact.photoUrl]]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KGContactParametherCell *cell = [tableView dequeueReusableCellWithIdentifier:[KGContactParametherCell getIdentifier] forIndexPath:indexPath];
    cell.buttonShowPassword.hidden = YES;
    NSString *param;
    NSString *value;
        switch (indexPath.row) {
        case 0:
        param = @"Имя";
        value = self.contact.firstName;
        break; case 1:
        param = @"Фамилия";
        value = self.contact.lastName;
        break; case 2:
        param = @"Возраст";       
        value = self.contact.agesString;
        break; case 3:
        param = @"E-mail";
        value = self.contact.email;
        cell.valueTextField.enabled = NO;
        break; case 4:
        param = @"Телефон";
        value = self.contact.phone;
        break; case 5:
        param = @"Никнейм";
        value = self.contact.nickname;
        break; case 6:
        param = @"Пароль";
        value = self.contact.password;
        cell.valueTextField.secureTextEntry = YES;
        cell.buttonShowPassword.hidden = NO;
        break;
    }
    cell.parametherLabel.text = param;
    cell.valueTextField.placeholder = value;
    cell.valueTextField.text = value;
    return cell;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
