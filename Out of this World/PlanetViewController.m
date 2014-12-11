//
//  PlanetViewController.m
//  Out of this World
//
//  Created by Itamar Nakar on 10/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "PlanetViewController.h"
#import "DetailTableViewController.h"


@interface PlanetViewController ()

@end

@implementation PlanetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor blackColor];
    self.planetImageView = [[UIImageView alloc]initWithImage:self.planet.image];
    
    self.scrollView.contentSize = self.planetImageView.frame.size;

    [self.scrollView addSubview:self.planetImageView];
    
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 1.0;
    self.scrollView.minimumZoomScale = 0.1;
    //self.scrollView.zoomScale = 0.2;
    
//    self.scrollView.multipleTouchEnabled = YES;
//    [self scrollViewDidEndZooming:self.scrollView withView:self.planetImageView atScale:0.5];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
   
    if ([segue.identifier isEqualToString:@"planetDetailSeque"]) {
        
   
    if ([sender isKindOfClass:[UIButton class]]) {
        if ([segue.destinationViewController isKindOfClass:[DetailTableViewController class]]) {
            
            DetailTableViewController *nextViewController = segue.destinationViewController;
            nextViewController.planet = self.planet;
      }       
        }
    }
}

#pragma mark - ScrollView Delegate
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.planetImageView;
}




@end
