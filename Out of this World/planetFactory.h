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

@property (strong, nonatomic) NSString *name;
@property (nonatomic) float gravity;
@property (nonatomic) float diameter;
@property (nonatomic) float yearLength;
@property (nonatomic) float dayLength;
@property (nonatomic) float Temperature;
@property (nonatomic) int numberOfMoons;
@property (strong, nonatomic) NSString *nickname;
@property (strong, nonatomic) NSString *interestingFact;

@property (strong, nonatomic) UIImage *image;

-(id)initWithDictionary:(NSDictionary *)data andImage:(UIImage *)image;



-(void)creatPlanets;



@end
