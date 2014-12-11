//
//  TableViewController.m
//  Out of this World
//
//  Created by Itamar Nakar on 07/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "TableViewController.h"
#import "PlanetViewController.h"
#import "DetailTableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    
    
    self.planets = [NSMutableArray array];
    for (NSDictionary *planetDictionary in [AstronomicalData allKnownPlanets]) {
        
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetDictionary[PLANET_NAME]];
        planetFactory *planet = [[planetFactory alloc] initWithDictionary:planetDictionary andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    // = [NSMutableArray arrayWithArray:[AstronomicalData allKnownPlanets]];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.planets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *reuseIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    planetFactory *cellPlanet = self.planets[indexPath.row];
    
    cell.textLabel.text = cellPlanet.name;
    cell.detailTextLabel.text = cellPlanet.nickname;
    cell.imageView.image = cellPlanet.image;
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    
    return cell;
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"Planet Image Segue"]) {
        
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            
            if ([segue.destinationViewController isKindOfClass:[PlanetViewController class]]) {
            
            PlanetViewController* nextViewController = segue.destinationViewController;
            
            NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
            
            planetFactory *selectedPlanet = self.planets[indexPath.row];
            nextViewController.planet = selectedPlanet;
            }
        }
    }
    if ([segue.identifier isEqualToString:@"Planet Details Segue"]) {
        
         if ([sender isKindOfClass:[NSIndexPath class]]) {
             
             if ([segue.destinationViewController isKindOfClass:[DetailTableViewController class]]) {
                 
                 DetailTableViewController* nextViewController = segue.destinationViewController;
                 
                 NSIndexPath *indexPath = sender;
                 
                 planetFactory *selectedPlanet = self.planets[indexPath.row];
                 nextViewController.planet = selectedPlanet;
             }
         }
    }
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Planet Details Segue" sender:indexPath];
}

#pragma mark - AddPlanetObjectViewController Delegate

-(void) didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"didCancel");
}

-(void)addPlanetObject
{
    [self dismissViewControllerAnimated:YES completion:nil];    
    NSLog(@"addPlanetObject");
}

@end










