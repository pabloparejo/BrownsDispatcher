//
//  HomeViewController.h
//  BrownDispatcher
//
//  Created by Pablo Parejo Camacho on 7/3/15.
//  Copyright (c) 2015 Pablo Parejo Camacho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController

- (IBAction)handleBrown:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *brownedText;


@end
