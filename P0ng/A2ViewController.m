//
//  A2ViewController.m
//  P0ng
//
//  Created by DarkCode on 11/30/13.
//  Copyright (c) 2013 Code A2. All rights reserved.
//

#import "A2ViewController.h"

@interface A2ViewController ()

@end

@implementation A2ViewController

- (void)viewDidLoad
{
    AnimatedBackground.animationImages = [NSArray arrayWithObjects:
                                          [UIImage imageNamed:@"5.png"],
                                          [UIImage imageNamed:@"p1.png"],
                                          [UIImage imageNamed:@"p2.png"],
                                          [UIImage imageNamed:@"p4.png"],
                                          [UIImage imageNamed:@"5.png"],nil];
    
    [AnimatedBackground setAnimationRepeatCount:0];
    AnimatedBackground.animationDuration = 5;
    [AnimatedBackground startAnimating];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
