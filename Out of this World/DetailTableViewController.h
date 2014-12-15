//
//  DetailTableViewController.h
//  Out of this World
//
//  Created by Itamar Nakar on 11/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlanetViewController.h"

@interface DetailTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *detailTable;

@property (strong, nonatomic) PlanetFactory *planet;
@end
