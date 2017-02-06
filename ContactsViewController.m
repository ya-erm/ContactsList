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
#import "ContactDetailsViewController.h"

static NSString *const kShowContactDetailsSegueIdentifier = @"showContactDetailsSegueIdentifier";

@interface ContactsViewController () <UISearchResultsUpdating, UISearchBarDelegate>

@property (nonatomic, strong) RLMResults *contacts;
@property (nonatomic, strong) RLMNotificationToken *token;
@property (nonatomic, strong) UISearchController* searchController;

@property (nonatomic, assign) BOOL shouldShowSearchResults;

@end

@implementation ContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Realm %@", [RLMRealmConfiguration defaultConfiguration].fileURL);
    
    [self setupSearchBar];
    [self loadContacts];
    
}

- (void)setupSearchBar {
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchBar.delegate = self;
    self.searchController.searchResultsUpdater = self;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.searchController.searchBar.barTintColor = [UIColor groupTableViewBackgroundColor];
    self.searchController.searchBar.layer.borderColor = [UIColor groupTableViewBackgroundColor].CGColor;
    self.searchController.searchBar.layer.borderWidth = 1;
    self.searchController.searchBar.placeholder = @"Поиск";
    [self.searchController.searchBar setValue:@"Отмена" forKey:@"_cancelButtonText"];
    self.tableView.tableHeaderView = self.searchController.searchBar;
    [self.tableView setContentOffset:CGPointMake(0, self.searchController.searchBar.frame.size.height)];
}

- (void) searchContacts {
    NSString *searchString = self.searchController.searchBar.text;
    if (searchString.length > 0) {
        self.shouldShowSearchResults = YES;
    } else {
        self.shouldShowSearchResults = NO;
    }
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"firstName CONTAINS %@ OR lastName CONTAINS %@", searchString, searchString];
    self.contacts = [KGContact objectsWithPredicate:predicate];
    [self.tableView reloadData];
    
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

#pragma mark - Actions

- (IBAction)addContactAction:(id)sender {
    [self addContact];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   return self.contacts.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    KGContactCell *cell = [tableView dequeueReusableCellWithIdentifier:[KGContactCell getIdentifier] forIndexPath:indexPath];
        [cell configureWithObject:self.contacts[indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     [self performSegueWithIdentifier:kShowContactDetailsSegueIdentifier sender:self.contacts[indexPath.row]];
}

#pragma mark - Navigation

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    [self.searchController setActive:NO];
    
    if ([segue.identifier isEqualToString:kShowContactDetailsSegueIdentifier]) {
        ContactDetailsViewController *controller = segue.destinationViewController;
        controller.contact = sender;
    }
}

#pragma mark - UISearchResultsUpdating

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    [self searchContacts];
}

#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchController.searchBar resignFirstResponder];
    if (!self.shouldShowSearchResults) {
        self.shouldShowSearchResults = YES;
        [self.tableView reloadData];
    }
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self.searchController.searchBar resignFirstResponder];
    self.shouldShowSearchResults = NO;
    [self.tableView reloadData];
}

@end
