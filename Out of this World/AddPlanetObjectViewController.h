//
//  AddPlanetObjectViewController.h
//  Out of this World
//
//  Created by Itamar Nakar on 11/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol AddPlanetObjectViewControllerDelegate <NSObject>

-(void)didCancel;
-(void)addPlanetObject;

@end

@interface AddPlanetObjectViewController : UIViewController

@property (weak, nonatomic) id <AddPlanetObjectViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nicknameTextField;
@property (strong, nonatomic) IBOutlet UITextField *tempertureTextField;
@property (strong, nonatomic) IBOutlet UITextField *diameterTextField;
@property (strong, nonatomic) IBOutlet UITextField *yearLengthTextField;
@property (strong, nonatomic) IBOutlet UITextField *moonsNumberTextField;

- (IBAction)cancelButtonPressed:(UIButton *)sender;
- (IBAction)addButtonPressed:(UIButton *)sender;


@end
