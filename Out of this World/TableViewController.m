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

#define DEFAULT_ARRAY_OF_ADDED_PLANETS @"default array of added planets"

@interface TableViewController (){
    NSUserDefaults *defaultArrayOfAddedPlanets;
}


@end

@implementation TableViewController

#pragma mark lasy instantuation
-(NSMutableArray *)addedPlanets{
    if (!_addedPlanets) _addedPlanets = [[NSMutableArray alloc] init];
    return _addedPlanets;
}
-(NSMutableArray *)planets{
    if (!_planets) _planets = [NSMutableArray array];
    return _planets;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    for (NSDictionary *planetDictionary in [AstronomicalData allKnownPlanets]) {
        NSString *imageName = [NSString stringWithFormat:@"%@.jpg", planetDictionary[PLANET_NAME]];
        PlanetFactory *planet = [[PlanetFactory alloc] initWithDictionary:planetDictionary andImage:[UIImage imageNamed:imageName]];
        [self.planets addObject:planet];
    }
    
    defaultArrayOfAddedPlanets = [NSUserDefaults standardUserDefaults];
    
    if ([defaultArrayOfAddedPlanets arrayForKey:DEFAULT_ARRAY_OF_ADDED_PLANETS]){
        for (NSDictionary *planetDictionary in [[NSUserDefaults standardUserDefaults] arrayForKey:DEFAULT_ARRAY_OF_ADDED_PLANETS])
        {
            PlanetFactory *addedPlanet = [self planetObjectFromPropertyList:planetDictionary];
            [self.addedPlanets addObject:addedPlanet];
        }
    }
    
    // Seting an Edit Bar Button for Editing TableView
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)] ;
}

// Logic of Edit Bar Button for Editing TableView
- (void) editButtonSelected: (id) sender
{
    if (self.tableView.editing) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(editButtonSelected:)];
        [self.tableView setEditing:NO animated:YES];
    } else {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(editButtonSelected:)];
        [self.tableView setEditing:YES animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - AddPlanetObjectViewController Delegate

-(void) didCancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"didCancel");
}

-(void)addPlanetObject:(PlanetFactory *)planetObject
{
    self.addedPlanet = planetObject;
    [self.addedPlanets addObject:self.addedPlanet];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    NSLog(@"addPlanetObject");
    
    // Retriving Array data from Property List, lazy Instantiation, Adding a new Object, Setting an Object for key, and sycronizing
    NSMutableArray *planetObjectsAsPropertyList = [[defaultArrayOfAddedPlanets arrayForKey:DEFAULT_ARRAY_OF_ADDED_PLANETS] mutableCopy];
    if (!planetObjectsAsPropertyList) planetObjectsAsPropertyList = [[NSMutableArray alloc]init];
    
    [planetObjectsAsPropertyList addObject:[self planetObjectAsPropertyList:planetObject]];

    [defaultArrayOfAddedPlanets setObject:planetObjectsAsPropertyList forKey:DEFAULT_ARRAY_OF_ADDED_PLANETS];
    [defaultArrayOfAddedPlanets synchronize];
    
    // And Finaly, Reloading TableView Data
    [self.tableView reloadData];
}

#pragma mark - Helper Methodes
// Creat a Dictionary Obj from a Planet Obj
-(NSDictionary *)planetObjectAsPropertyList:(PlanetFactory *)planet
{
    NSData*dataOfImage = UIImagePNGRepresentation(planet.image);
    ////////////// Test Log
    //NSLog(@"%@, %f, %f, %f, %f, %f, %d, %@, %@",planet.name, planet.gravity, planet.diameter, planet.yearLength, planet.dayLength, planet.Temperature,planet.numberOfMoons, planet.nickname,planet.interestingFact);
    //////////////
    NSDictionary *dictionary = @{PLANET_NAME : planet.name, PLANET_GRAVITY : @(planet.gravity), PLANET_DIAMETER : @(planet.diameter), PLANET_YEAR_LENGTH : @(planet.yearLength), PLANET_DAY_LENGTH : @(planet.dayLength), PLANET_TEMPERATURE : @(planet.Temperature), PLANET_NUMBER_OF_MOONS : @(planet.numberOfMoons), PLANET_NICKNAME : planet.nickname, PLANET_INTERESTING_FACT : planet.interestingFact, PLANET_IMAGE : dataOfImage };
    return dictionary;
}

// Creating a planet Obj from Dictionary
-(PlanetFactory *)planetObjectFromPropertyList:(NSDictionary *)dictionaty
{
    UIImage *newPlanetImage = [UIImage imageWithData:dictionaty[PLANET_IMAGE]];
    PlanetFactory *newPlanet = [[PlanetFactory alloc] initWithDictionary:dictionaty andImage:newPlanetImage];
    return newPlanet;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{// Return the number of sections.
    if (self.addedPlanets) {
        return 2;
    } else {
        return 1;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{// Return the number of rows in the section.
    if (section == 1) {
        return [self.addedPlanets count];
    } else {
        return [self.planets count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *reuseIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    if (indexPath.section == 1) {
        PlanetFactory *cellAddedPlanet = self.addedPlanets[indexPath.row];
        cell.textLabel.text = cellAddedPlanet.name;
        cell.detailTextLabel.text = cellAddedPlanet.nickname;
        cell.imageView.image = cellAddedPlanet.image;
    } else {
        PlanetFactory *cellPlanet = self.planets[indexPath.row];
        cell.textLabel.text = cellPlanet.name;
        cell.detailTextLabel.text = cellPlanet.nickname;
        cell.imageView.image = cellPlanet.image;
      }
    
    cell.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.detailTextLabel.textColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    
    return cell;
}

// Managing the Reordering of Rows - data model
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NSString *stringToMove = [self.addedPlanets objectAtIndex:sourceIndexPath.row];
        [self.addedPlanets removeObjectAtIndex:sourceIndexPath.row];
        [self.addedPlanets insertObject:stringToMove atIndex:destinationIndexPath.row];
}

#pragma mark - Table view Delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
     if (indexPath.section == 1) return YES;
      else return NO;
 }

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.addedPlanets removeObjectAtIndex:indexPath.row];
        
        NSMutableArray *planetObjectsAsPropertyList = [[defaultArrayOfAddedPlanets arrayForKey:DEFAULT_ARRAY_OF_ADDED_PLANETS] mutableCopy];
        [planetObjectsAsPropertyList removeObjectAtIndex:indexPath.row];
        
        [defaultArrayOfAddedPlanets setObject:planetObjectsAsPropertyList forKey:DEFAULT_ARRAY_OF_ADDED_PLANETS];
        [defaultArrayOfAddedPlanets synchronize];
        //Delete the row from the View
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
}

// // Managing the Reordering of Rows - View legality of 'proposed Destination'
- (NSIndexPath *)tableView:(UITableView *)tableView targetIndexPathForMoveFromRowAtIndexPath:(NSIndexPath *)sourceIndexPath toProposedIndexPath:(NSIndexPath *)proposedDestinationIndexPath
{
    if (sourceIndexPath.section != proposedDestinationIndexPath.section) { //Allowing only domestic section destenation
        return sourceIndexPath;
    } else {
        return proposedDestinationIndexPath;// Allow the proposed destination.
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    if ([segue.identifier isEqualToString:@"Planet Image Segue"]) {
        
        if ([sender isKindOfClass:[UITableViewCell class]]) {
            
            if ([segue.destinationViewController isKindOfClass:[PlanetViewController class]]) {
                
                PlanetViewController* nextViewController = segue.destinationViewController;
                NSIndexPath *indexPath = [self.tableView indexPathForCell:sender];
                PlanetFactory *selectedPlanet;
                
                if (indexPath.section == 1) {
                    selectedPlanet = self.addedPlanets[indexPath.row];
                } else {
                    selectedPlanet = self.planets[indexPath.row];
                    
                }
                nextViewController.planet = selectedPlanet;
            }
        }
    }
    if ([segue.identifier isEqualToString:@"Planet Details Segue"]) {
        
        if ([sender isKindOfClass:[NSIndexPath class]]) {
            
            if ([segue.destinationViewController isKindOfClass:[DetailTableViewController class]]) {
                
                DetailTableViewController* nextViewController = segue.destinationViewController;
                NSIndexPath *indexPath = sender;
                PlanetFactory *selectedPlanet;
                
                if (indexPath.section == 1) {
                    selectedPlanet = self.addedPlanets[indexPath.row];
                } else {
                    selectedPlanet = self.planets[indexPath.row];
                }
                nextViewController.planet = selectedPlanet;
            }
        }
    }
    
    if ([segue.destinationViewController isKindOfClass:[AddPlanetObjectViewController class]]) {
        
        AddPlanetObjectViewController* nextViewController = segue.destinationViewController;
        nextViewController.delegate = self;
    }
}


-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"Planet Details Segue" sender:indexPath];
}


@end










