//
//  AddPlanetObjectViewController.m
//  Out of this World
//
//  Created by Itamar Nakar on 11/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "AddPlanetObjectViewController.h"


@interface AddPlanetObjectViewController ()

@end

@implementation AddPlanetObjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.nameTextField.delegate = self;
    self.nicknameTextField.delegate = self;
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Orion.jpg"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)cancelButtonPressed:(UIButton *)sender {
    [self.delegate didCancel];
}

- (IBAction)addButtonPressed:(UIButton *)sender {
    PlanetFactory *planetObject = [self planetCreator];
    [self.delegate addPlanetObject:(PlanetFactory *)planetObject];
}

-(PlanetFactory *)planetCreator
{
    PlanetFactory *planetObject = [[PlanetFactory alloc] init];
    planetObject.name =self.nameTextField.text;
    planetObject.nickname =self.nicknameTextField.text;
    planetObject.interestingFact = @"";
    planetObject.image = [UIImage imageNamed:@"EinsteinRing.jpg"];
    
    return planetObject;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

@end





