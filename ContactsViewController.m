//
//  ContactsViewController.m
//  
//
//  Created by Ярослав Ермилов on 03.02.17.
//
//

#import "KGcontact.h"
#import "KGcontactCell.h"
#import "KGNetworkService.h"
#import "ContactsViewController.h"

@interface ContactsViewController ()

@property (nonatomic, strong) RLMResults *contacts;
@property (nonatomic, strong) RLMNotificationToken *token;

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Realm %@", [RLMRealmConfiguration defaultConfiguration].fileURL);
    
    [self loadContacts];
}

- (void)loadContacts{
    
    self.contacts = [KGContact allObjects];
    
    __weak typeof(self) wself = self;
    self.token = [self.contacts addNotificationBlock:^(RLMResults<KGContact *> * _Nullable results, RLMCollectionChange * _Nullable change, NSError * _Nullable error) {
        [wself.tableView beginUpdates];
        [wself.tableView deleteRowsAtIndexPaths:[change deletionsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        [wself.tableView insertRowsAtIndexPaths:[change insertionsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        [wself.tableView reloadRowsAtIndexPaths:[change modificationsInSection:0] withRowAnimation:UITableViewRowAnimationAutomatic];
        [wself.tableView endUpdates];
    }];
}

- (void)addContact{
    
    [[KGNetworkService defaultService] loadContactsWithSuccessBlock:
     ^(RKObjectRequestOperation *operation, RKMappingResult *mappingResult) {
         for (KGContact *contact in mappingResult.set) {
             contact.firstName = [contact.firstName capitalizedString];
             contact.lastName = [contact.lastName capitalizedString];
             RLMRealm *realm = [RLMRealm defaultRealm];
             [realm beginWriteTransaction];
             [realm addObject:contact];
             [realm commitWriteTransaction];
             NSLog(@"Контакт загружен с сервера");
         }
     }
                                                         failureBlock:
     ^(RKObjectRequestOperation *operation, NSError *error) {
         NSLog(@"Ошибка загрузки контакта c сервера");
     }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KGContactCell *cell = [tableView dequeueReusableCellWithIdentifier:[KGContactCell getIdentifier] forIndexPath:indexPath];
    
    [cell configureWithObject:self.contacts[indexPath.row]];
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}


#pragma mark - UITableViewDataDelegate

- (NSArray<UITableViewRowAction *> *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewRowAction* deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Удалить" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm beginWriteTransaction];
        [realm deleteObject:self.contacts[indexPath.row]];
        [realm commitWriteTransaction];
    }];
    deleteAction.backgroundColor = [UIColor redColor];
    return @[deleteAction];
}


#pragma mark - Actions

- (IBAction)addContactAction:(id)sender {
    [self addContact];
}

@end
