//
//  FirstViewController.m
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "ModeSelectViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize modelVC;

#pragma mark - ButtonAction

/*游戏模式选择*/
-(IBAction)ModeSelect:(id)sender
{
    ModeSelectViewController *modeController =
    [[ModeSelectViewController alloc]initWithNibName:@"ModeSelectViewController"                  
                                              bundle:nil];
    self.modelVC = modeController;
    [modeController release];
    
    [self.view addSubview:self.modelVC.view];
    
}
/*游戏排行*/
-(IBAction)RankList:(id)sender
{
    
}
/*游戏开始*/
-(IBAction)StartGame:(id)sender
{
    
}

#pragma mark -

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
