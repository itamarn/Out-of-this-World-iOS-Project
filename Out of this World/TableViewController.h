//
//  TableViewController.h
//  Out of this World
//
//  Created by Itamar Nakar on 07/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "planetFactory.h"

@interface TableViewController : UITableViewController

@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableDictionary *planetDictionary;



@end
