//
//  ContactDetailsViewController.m
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContactCellBuilder.h"
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
    NSArray *array = @[ @[@"firstName",  @"Имя",     kTextFieldCellType],
                        @[@"lastName",   @"Фамилия", kTextFieldCellType],
                        @[@"agesString", @"Возраст", kLabelCellType],
                        @[@"email",      @"E-mail",  kLabelCellType],
                        @[@"phone",      @"Телефон", kLabelCellType],
                        @[@"nickname",   @"Никнейм", kTextFieldCellType],
                        @[@"password",   @"Пароль",  kPasswordCellType]
                      ];
    NSString *key = array[indexPath.row][0];
    NSString *title = array[indexPath.row][1];
    NSString *type = array[indexPath.row][2];
    
    return [KGContactCellBuilder tableView:tableView contact:self.contact cellForKey:key title:title type:type];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


#pragma mark - Actions

- (IBAction)saveAction:(id)sender {    
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [realm addObject:self.contact];
    [realm commitWriteTransaction];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
