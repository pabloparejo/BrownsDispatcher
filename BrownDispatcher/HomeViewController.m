//
//  HomeViewController.m
//  BrownDispatcher
//
//  Created by Pablo Parejo Camacho on 7/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "HomeViewController.h"
#import "PARPeople.h"
#import "PARBrownedsViewController.h"

@interface HomeViewController ()

@property (strong, nonatomic) PARPeople *model;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.model = [PARPeople sharedInstance];
}

- (void) viewWillAppear:(BOOL)animated{
    NSString *text =[NSString stringWithFormat:@"Currently, there are %ld browneds",[self.model brownedCount]];
    [self.brownedText setText:text];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleBrown:(id)sender {
    PARBrownedsViewController *vc = [[PARBrownedsViewController alloc] initWithModel:self.model];
    UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:vc];
    [self presentViewController:navVC animated:YES completion:nil];
}
@end
