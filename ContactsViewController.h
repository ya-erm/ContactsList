//
//  ContactsViewController.h
//  
//
//  Created by Ярослав Ермилов on 03.02.17.
//
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)addContactAction:(id)sender;

@end
