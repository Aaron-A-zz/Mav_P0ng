//
//  Game.m
//  P0ng
//
//  Created by DarkCode on 11/30/13.
//  Copyright (c) 2013 Code A2. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

//Collision
-(void)Collision{
    if (CGRectIntersectsRect(Ball.frame, Player.frame)) {
        Y = arc4random() %6;
        Y = 0-Y;
    }
    
    if (CGRectIntersectsRect(Ball.frame, Computer.frame)) {
        Y = arc4random() %6;
    }
}

//Players
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *Drag = [[event allTouches] anyObject];
    Player.center = [Drag locationInView:self.view];
    
    if (Player.center.y > 533) {
        Player.center = CGPointMake(Player.center.x, 533);
    }
    
    if (Player.center.y < 533) {
        Player.center = CGPointMake(Player.center.x, 533);
    }
    
    //Stops Players Paddel from leaving
    if (Player.center.x < 32) {
        Player.center = CGPointMake(32, Player.center.y);
    }
    
    if (Player.center.x > 288) {
        Player.center = CGPointMake(288, Player.center.y);
    }
    
}


//Aim
-(void)ComputerMovement{
    if (Computer.center.x > Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x - 2, Computer.center.y);
    }
    
    if (Computer.center.x < Ball.center.x) {
        Computer.center = CGPointMake(Computer.center.x + 2, Computer.center.y);
    }
    
    //Stops Computer's Paddel from leaving
    if (Computer.center.x < 32) {
        Computer.center = CGPointMake(32, Computer.center.y);
    }
    
    if (Computer.center.x > 288) {
        Computer.center = CGPointMake(288, Computer.center.y);
    }
}

//Start
-(IBAction)StartButton:(id)sender{
    
    StartButton.hidden = YES;
    Exit.hidden = YES;
    
    Y = arc4random() %13;
    Y = Y - 5;
    
    X = arc4random() %13;
    X = X - 5;
    
    if (Y == 0) {
        Y = 1;
    }
    
    if (X == 0) {
        X = 1;
    }
    
    timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(BallMovement) userInfo:nil repeats:YES];
}

//Movement
-(void)BallMovement{
    
    [self ComputerMovement];
    [self Collision];
    
    Ball.center = CGPointMake(Ball.center.x + X, Ball.center.y + Y);
    
    if (Ball.center.x < 15) {
        X = 0 - X;
    }
    
    if (Ball.center.x > 305) {
        X = 0 - X;
    }
    
    //Scoreboard
    if (Ball.center.y < 0) {
        PlayerScoreNumber = PlayerScoreNumber + 1;
        PlayerScore.text = [NSString stringWithFormat:@"%i", PlayerScoreNumber];
        
        [timer invalidate];
        StartButton.hidden = NO;
        
        //Ball reset and Computer
        Ball.center = CGPointMake(160, 282);
        Computer.center = CGPointMake(160, 27);
        
        if (PlayerScoreNumber == 10) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"You Win!"];
        }
    }//END Game
    
    if (Ball.center.y > 550) {
        ComputerScoreNumber = ComputerScoreNumber + 1;
        ComputerScore.text = [NSString stringWithFormat:@"%i", ComputerScoreNumber];
        [timer invalidate];
        StartButton.hidden = NO;
        
        //Ball Reset and Computer
        Ball.center = CGPointMake(160, 282);
        Computer.center = CGPointMake(160, 27);
        
        if (ComputerScoreNumber == 10) {
            StartButton.hidden = YES;
            Exit.hidden = NO;
            WinOrLose.hidden = NO;
            WinOrLose.text = [NSString stringWithFormat:@"Try Again!"];
        }
    }
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    PlayerScoreNumber = 0;
    ComputerScoreNumber = 0;
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
