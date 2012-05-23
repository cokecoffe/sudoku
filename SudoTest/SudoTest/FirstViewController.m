//
//  FirstViewController.m
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "FirstViewController.h"
#import "ModeSelectViewController.h"
#import "RankViewController.h"
#import "GameViewController.h"
#import "SoundViewController.h"
#import "AboutViewViewController.h"
#import "MoreViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

@synthesize SoundSetButton;
@synthesize topView;
@synthesize modeVC;
@synthesize soundVC;
@synthesize aboutVC;
@synthesize moreVC;

#pragma mark - ButtonAction

/*游戏模式选择*/
-(IBAction)ModeSelect:(id)sender
{
    modeVC.view.frame = CGRectMake(57, 137,modeVC.view.bounds.size.width,modeVC.view.bounds.size.height);
    [self addBlocker];
    [self.view addSubview:modeVC.view];    
}
/*游戏排行*/
-(IBAction)RankList:(id)sender
{
    RankViewController *rankController =  [[RankViewController alloc]initWithNibName:@"RankViewController" 
                                                                              bundle:nil];
 
    [self.navigationController pushViewController:rankController animated:YES];
    
    [rankController release];
}
/*游戏开始*/
-(IBAction)StartGame:(id)sender
{
    GameViewController *gameController = [[GameViewController alloc]initWithNibName:@"GameViewController" 
                                                                             bundle:nil];
    
    [self.navigationController pushViewController:gameController animated:YES];
    
    [gameController release];
}
//关于
- (IBAction)AboutViewBT:(id)sender
{
    /*
    AboutViewViewController *aboutviewController = [[AboutViewViewController alloc]initWithNibName:@"AboutViewViewController" bundle:nil];
    
    [self.navigationController pushViewController:aboutviewController animated:YES];
    
    [aboutviewController release];
    */
    
    MoreViewController *moreviewController = [[MoreViewController alloc]initWithNibName:@"MoreViewController" bundle:nil];
    
    [self.navigationController pushViewController:moreviewController animated:YES];
    
    [moreviewController release];
}



/*声音设置*/
- (IBAction)SoundSetting:(id)sender
{
     soundVC.view.frame = CGRectMake(10, 250, soundVC.view.bounds.size.width, soundVC.view.bounds.size.height);
    [self addBlocker];
    [self.view addSubview:soundVC.view];    
}


- (void)closeTopView {
    [modeVC.view removeFromSuperview];
    [soundVC.view removeFromSuperview];
    [blocker removeFromSuperview];
}

- (void)addBlocker {
    blocker = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [blocker addTarget:self action:@selector(closeTopView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blocker];
    
    [blocker release];
}


#pragma mark -

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        modeVC = [[ModeSelectViewController alloc]initWithNibName:@"ModeSelectViewController" bundle:nil];
        soundVC = [[SoundViewController alloc]initWithNibName:@"SoundViewController" bundle:nil];
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

    [self setSoundSetButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
    
	//[self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [modeVC release];
    [soundVC release];
    [SoundSetButton release];
    [super dealloc];
}
@end
