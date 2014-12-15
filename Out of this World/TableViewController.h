//
//  TableViewController.h
//  Out of this World
//
//  Created by Itamar Nakar on 07/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlanetFactory.h"
#import "AddPlanetObjectViewController.h"

@interface TableViewController : UITableViewController <AddPlanetObjectViewControllerDelegate>

@property (strong, nonatomic ) PlanetFactory *addedPlanet;
@property (strong, nonatomic ) NSMutableArray *addedPlanets;
@property (strong, nonatomic) NSMutableArray *planets;
@property (strong, nonatomic) NSMutableDictionary *planetDictionary;



@end
