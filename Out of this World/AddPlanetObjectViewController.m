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
    [self.delegate addPlanetObject];
}

@end





