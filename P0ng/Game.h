//
//  Game.h
//  P0ng
//
//  Created by DarkCode on 11/30/13.
//  Copyright (c) 2013 Code A2. All rights reserved.
//

#import <UIKit/UIKit.h>

int Y;
int X;
int ComputerScoreNumber;
int PlayerScoreNumber;

@interface Game : UIViewController

{
    IBOutlet UIImageView *Ball;
    IBOutlet UIButton *StartButton;
    IBOutlet UIImageView *Player;
    IBOutlet UIImageView *Computer;
    
    IBOutlet UILabel *PlayerScore;
    IBOutlet UILabel *ComputerScore;
    IBOutlet UILabel *WinOrLose;
    IBOutlet UIButton *Exit;
    
    NSTimer *timer;
}

-(IBAction)StartButton:(id)sender;
-(void)BallMovement;
-(void)ComputerMovement;
-(void)Collision;

@end
