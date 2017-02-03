//
//  ContactDetailsViewController.h
//  ContactsList
//
//  Created by Ярослав Ермилов on 03.02.17.
//  Copyright © 2017 Kilograpp. All rights reserved.
//

#import "KGContact.h"
#import <UIKit/UIKit.h>

@interface ContactDetailsViewController : UIViewController <UITableViewDataSource>

@property(nonatomic, strong) KGContact *contact;

@property (weak, nonatomic) IBOutlet UIImageView *photo;

- (IBAction)saveAction:(id)sender;

@end
