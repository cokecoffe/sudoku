//
//  ModeSelectViewController.m
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ModeSelectViewController.h"

@interface ModeSelectViewController ()

@end

@implementation ModeSelectViewController
@synthesize delegate;
@synthesize modeSelect;
@synthesize levelSelect;

/*
-(IBAction)BackToHome:(id)sender
{
    if ([delegate respondsToSelector:@selector(returnHomePageFromIndex:)])
    {
        [delegate returnHomePageFromIndex:MODE_PAGE];
    }
}
*/

-(IBAction)GameModeSelect:(id)sender
{
    UISegmentedControl *modeSelect = (UISegmentedControl *)sender;
    NSInteger Index = modeSelect.selectedSegmentIndex;
    
    if (Index == 0) 
    {
        gGameMode = MODE_TIME;
    }
    else 
    {
        gGameMode = MODE_CHALLENGE;
    }
}

-(IBAction)GameLevelSelect:(id)sender
{
    UISegmentedControl *levelSelect = (UISegmentedControl *)sender;
    NSInteger Index = levelSelect.selectedSegmentIndex;

    switch (Index) {
        case 0:
            gGameLevel = LEVEL_ESAY;
            break;
        case 1:
            gGameLevel = LEVEL_MID;
            break;
        case 2:
            gGameLevel = LEVEL_HARD;
            break;            
        default:
            gGameLevel = LEVEL_ESAY;
            break;
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
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    levelSelect.selectedSegmentIndex = gGameLevel;
    modeSelect.selectedSegmentIndex = gGameMode;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
