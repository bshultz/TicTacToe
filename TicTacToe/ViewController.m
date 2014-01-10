//
//  ViewController.m
//  TicTacToe
//
//  Created by Matthew Voracek on 1/10/14.
//  Copyright (c) 2014 Matthew Voracek. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>
{
    __weak IBOutlet UILabel *myLabelOne;
    __weak IBOutlet UILabel *myLabelTwo;
    __weak IBOutlet UILabel *myLabelThree;
    __weak IBOutlet UILabel *myLabelFour;
    __weak IBOutlet UILabel *myLabelFive;
    __weak IBOutlet UILabel *myLabelSix;
    __weak IBOutlet UILabel *myLabelSeven;
    __weak IBOutlet UILabel *myLabelEight;
    __weak IBOutlet UILabel *myLabelNine;
    __weak IBOutlet UILabel *whichPlayerLabel;
    
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    whichPlayerLabel.text = @"X Player";
    [whichPlayerLabel sizeToFit];
    
}
-(void)alertView:(UIAlertView *)alert clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            myLabelOne.text = @"";
            myLabelTwo.text = @"";
            myLabelThree.text = @"";
            myLabelFour.text = @"";
            myLabelFive.text = @"";
            myLabelSix.text = @"";
            myLabelSeven.text = @"";
            myLabelEight.text = @"";
            myLabelNine.text = @"";
            break;
        case 1:
            exit(0);
        default:
            break;
    }
}

-(NSString*)whoOne:(NSString *)xOrO
{
    if(([myLabelOne.text isEqualToString:xOrO]
       && [myLabelTwo.text isEqualToString:xOrO]
       && [myLabelThree.text isEqualToString:xOrO])
       || ([myLabelFour.text isEqualToString:xOrO]
           && [myLabelFive.text isEqualToString:xOrO]
           && [myLabelSix.text isEqualToString:xOrO])
        || ([myLabelSeven.text isEqualToString:xOrO]
            && [myLabelEight.text isEqualToString:xOrO]
            && [myLabelNine.text isEqualToString:xOrO])
        || ([myLabelOne.text isEqualToString:xOrO]
            && [myLabelFour.text isEqualToString:xOrO]
            && [myLabelSeven.text isEqualToString:xOrO])
        || ([myLabelTwo.text isEqualToString:xOrO]
            && [myLabelFive.text isEqualToString:xOrO]
            && [myLabelEight.text isEqualToString:xOrO])
        || ([myLabelThree.text isEqualToString:xOrO]
            && [myLabelSix.text isEqualToString:xOrO]
            && [myLabelNine.text isEqualToString:xOrO])
        || ([myLabelOne.text isEqualToString:xOrO]
            && [myLabelFive.text isEqualToString:xOrO]
            && [myLabelNine.text isEqualToString:xOrO])
        || ([myLabelThree.text isEqualToString:xOrO]
            && [myLabelFive.text isEqualToString:xOrO]
            && [myLabelSeven.text isEqualToString:xOrO]))
    {
        return xOrO;
    }
    {NSLog(@"no winner yet");}
    return nil;
}

-(void)takeATurn:(UILabel *)label
{
    if([label.text isEqualToString:@""])
    {
        if([whichPlayerLabel.text isEqualToString:@"X Player"])
        {
            label.text = @"X";
            whichPlayerLabel.text = @"O Player";
            label.textColor = [UIColor blueColor];
        }
        else if ([whichPlayerLabel.text isEqualToString:@"O Player"])    {
            label.text = @"O";
            whichPlayerLabel.text = @"X Player";
            label.textColor = [UIColor redColor];
        }
    }
    
    NSString *winner = [self whoOne:label.text];
    if([winner isEqualToString:label.text])
    {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: [NSString stringWithFormat: @"The Winner is %@ Player!",winner] message:@"Thanks for playing! Please play again soon!" delegate:self cancelButtonTitle:@"Play Again!" otherButtonTitles:@"Quit.", nil];
    [alert show];
    }
    
}

-(void)findLabelUsingPoint:(CGPoint)point
{
    
    if(CGRectContainsPoint(myLabelOne.frame, point))
        {
            [self takeATurn:myLabelOne];
        }
    if(CGRectContainsPoint(myLabelTwo.frame, point))
       {
           [self takeATurn:myLabelTwo];
       }
    if(CGRectContainsPoint(myLabelThree.frame, point))
    {
        [self takeATurn:myLabelThree];
    }
    if(CGRectContainsPoint(myLabelFour.frame, point))
    {
        [self takeATurn:myLabelFour];
    }
    if(CGRectContainsPoint(myLabelFive.frame, point))
    {
        [self takeATurn:myLabelFive];    }
    if(CGRectContainsPoint(myLabelSix.frame, point))
    {
        [self takeATurn:myLabelSix];
    }
    if(CGRectContainsPoint(myLabelSeven.frame, point))
    {
        [self takeATurn:myLabelSeven];
    }
    if(CGRectContainsPoint(myLabelEight.frame, point))
    {
        [self takeATurn:myLabelEight];
    }
    if(CGRectContainsPoint(myLabelNine.frame, point))
    {
        [self takeATurn:myLabelNine];
    }
    
    
}

-(IBAction)onLabelTapped:(UITapGestureRecognizer *)tapGestureRecognizer
{
    CGPoint point = [tapGestureRecognizer locationOfTouch:.1 inView:self.view];
    [self findLabelUsingPoint:point];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
