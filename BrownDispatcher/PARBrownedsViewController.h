//
//  PARBrownedsViewController.h
//  BrownDispatcher
//
//  Created by Pablo Parejo Camacho on 7/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PARPeople.h"

@interface PARBrownedsViewController : UITableViewController

@property (strong, nonatomic) PARPeople *model;

-(id) initWithModel:(PARPeople *) model;

@end
