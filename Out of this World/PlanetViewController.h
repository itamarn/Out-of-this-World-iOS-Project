//
//  PlanetViewController.h
//  Out of this World
//
//  Created by Itamar Nakar on 10/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewController.h"

@interface PlanetViewController : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) PlanetFactory *planet;
@property (nonatomic, strong) UIImageView *planetImageView;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;


@end
