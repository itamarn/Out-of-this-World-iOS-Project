//
//  DetailTableViewController.m
//  Out of this World
//
//  Created by Itamar Nakar on 11/12/14.
//  Copyright (c) 2014 Itamar Nakar. All rights reserved.
//

#import "DetailTableViewController.h"


@interface DetailTableViewController ()

@end

@implementation DetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  8;
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentefier = @"DetailCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentefier forIndexPath:indexPath];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"Planet Name";
            cell.detailTextLabel.text = self.planet.name;
            break;
        case 1:
            cell.textLabel.text = @"Planet Nickname";
            cell.detailTextLabel.text = self.planet.nickname;
            break;
        case 2:
            cell.textLabel.text = @"Planet Gravity";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.planet.gravity];
            break;
        case 3:
            cell.textLabel.text = @"Planet Diameter";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.planet.diameter];
            break;
        case 4:
            cell.textLabel.text = @"Planet Year Length";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.planet.yearLength];
            break;
        case 5:
            cell.textLabel.text = @"Planet Day Length";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%f",self.planet.dayLength];
            break;
        case 6:
            cell.textLabel.text = @"Number Of Moons";
            cell.detailTextLabel.text = [NSString stringWithFormat:@"%i",self.planet.numberOfMoons];
            break;
        case 7:
            cell.textLabel.text = @"Interesting Fact";
            cell.detailTextLabel.text = self.planet.interestingFact;
            break;
            
        default:
            break;
    }
    
    
    //NSLog(@"%@",self.planet.name);
    
    
    return cell;
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
