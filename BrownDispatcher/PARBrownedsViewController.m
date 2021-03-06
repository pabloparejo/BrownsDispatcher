//
//  PARBrownedsViewController.m
//  BrownDispatcher
//
//  Created by Pablo Parejo Camacho on 7/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import "PARBrownedsViewController.h"

#define CELL_ID @"cellID"

@interface PARBrownedsViewController ()

@end

@implementation PARBrownedsViewController


-(id) initWithModel:(PARPeople *) model{
    if (self = [super init]) {
        _model = model;
        self.title = @"Pick the next browned";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:CELL_ID];
    
    
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"cerrar"
                                                                    style:UIBarButtonItemStyleDone
                                                                   target:self
                                                                   action:@selector(closeButtonClick:)];
    self.navigationItem.leftBarButtonItem = closeButton;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.model count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_ID forIndexPath:indexPath];

    [cell.textLabel setText:[self.model nameForPersonAtIndex:indexPath.row]];
    
    if ([self.model brownedForPersonAtIndex:indexPath.row]) {
        cell.backgroundColor = [UIColor colorWithRed:1 green:0.7 blue:0.1 alpha:1];
        cell.textLabel.textColor =  [UIColor whiteColor];
    }else{
        cell.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:1];
        cell.textLabel.textColor =  [UIColor blackColor];
    }
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.model brownedForPersonAtIndex:indexPath.row]) {
        NSString *title = [NSString stringWithFormat:@"%@ was already browned", [self.model nameForPersonAtIndex:indexPath.row]];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"cancel"
                                                         style:UIAlertActionStyleDefault
                                                       handler:nil];
        __weak typeof(self) weakSelf = self;
        UIAlertAction *free = [UIAlertAction actionWithTitle:@"set free"
                                                       style:UIAlertActionStyleDestructive
                                                     handler:^(UIAlertAction *action) {
                                                         [weakSelf.model setPersonAtIndex:indexPath.row browned:NO];
                                                         [tableView reloadData];
                                                     }];
        [alert addAction:free];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
        NSString *title = [NSString stringWithFormat:@"%@ has been browned!", [self.model nameForPersonAtIndex:indexPath.row]];
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
                                                                       message:nil
                                                                preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"OK"
                                                         style:UIAlertActionStyleCancel
                                                       handler:nil];

        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];

        [self.model setPersonAtIndex:indexPath.row browned:YES];
        [tableView reloadData];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(IBAction)closeButtonClick:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
