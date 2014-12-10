//
//  planetFactory.h
//  Out of this World
//
//  Created by Itamar Nakar on 07/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AstronomicalData.h"


@interface planetFactory : NSObject

@property (strong, nonatomic) NSMutableArray *planets;

-(void)creatPlanets;



@end
