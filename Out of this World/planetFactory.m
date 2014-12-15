//
//  planetFactory.m
//  Out of this World
//
//  Created by Itamar Nakar on 07/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "PlanetFactory.h"

@implementation PlanetFactory


-(id)initWithDictionary:(NSDictionary *)data andImage:(UIImage *)image
{
    self = [super init];

    self.name = data[PLANET_NAME];
    self.gravity = [data[PLANET_GRAVITY] floatValue];
    self.diameter = [data[PLANET_DIAMETER] floatValue];
    self.yearLength = [data[PLANET_YEAR_LENGTH] floatValue];
    self.dayLength = [data[PLANET_DAY_LENGTH] floatValue];
    self.Temperature = [data[PLANET_TEMPERATURE] floatValue];
    self.numberOfMoons = [data[PLANET_NUMBER_OF_MOONS] intValue];
    self.nickname = data[PLANET_NICKNAME];
    self.interestingFact = data[PLANET_INTERESTING_FACT];
    
    self.image = image;
    
    return self;
}











-(void)creatPlanets
{
//    NSMutableArray *planets = [NSMutableArray array];
//    
//    NSString *planet1 = @"Mercury";
//    NSString *planet2 = @"Venus";
//    NSString *planet3 = @"Earth";
//    NSString *planet4 = @"Mars";
//    NSString *planet5 = @"Jupiter";
//    NSString *planet6 = @"Saturn";
//    NSString *planet7 = @"Uranus";
//    NSString *planet8 = @"Neptune";
    
//    [self.planets addObject:planet1];
//    [self.planets addObject:planet2];
//    [self.planets addObject:planet3];
//    [self.planets addObject:planet4];
//    [self.planets addObject:planet5];
//    [self.planets addObject:planet6];
//    [self.planets addObject:planet7];
//    [self.planets addObject:planet8];
    
}

@end





