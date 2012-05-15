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

@interface FirstViewController ()

@end

@implementation FirstViewController


@synthesize modeVC;
@synthesize rankVC;
@synthesize gameVC;
@synthesize topView;

#pragma mark - ButtonAction

-(void)returnHomePageFromIndex:(int)pageIndex
{
    switch (pageIndex) {
        case RANK_PAGE:
                [self.rankVC.view removeFromSuperview];
            break;
        case MODE_PAGE:
               // [self.modeVC.view removeFromSuperview];
            break;
        case GAME_PAGE:
                [self.gameVC.view removeFromSuperview];
            break;
            
        default:
            break;
    }

}

/*游戏模式选择*/
-(IBAction)ModeSelect:(id)sender
{
    UIView *modeView = nil;
    ModeSelectViewController *modeController =
    [[ModeSelectViewController alloc]initWithNibName:@"ModeSelectViewController"                  
                                              bundle:nil];
    modeController.delegate = self;
    
    self.modeVC = modeController;
    [modeController release];
    modeView = modeController.view;
    
    modeView.frame = CGRectMake(57, 137, modeView.bounds.size.width, modeView.bounds.size.height);
    
    [self addBlocker];
    [self.view addSubview:modeView];
 
    
}
/*游戏排行*/
-(IBAction)RankList:(id)sender
{
    RankViewController *rankController =  [[RankViewController alloc]initWithNibName:@"RankViewController" 
                                                                              bundle:nil];
    rankController.delegate = self;
    
    self.rankVC = rankController;
    [rankController release];
    
    [self.view addSubview:self.rankVC.view];

   }
/*游戏开始*/
-(IBAction)StartGame:(id)sender
{
    GameViewController *gameController = [[GameViewController alloc]initWithNibName:@"GameViewController" 
                                                                             bundle:nil];
    gameController.delegate = self;
    self.gameVC = gameController;
    [gameController release];
    
    [self.view addSubview:self.gameVC.view];
    
}
/*声音设置*/
- (IBAction)SoundSetting:(id)sender
{
    UIView *soundView;
    SoundViewController *soundController = [[SoundViewController alloc]initWithNibName:@"SoundViewController" bundle:nil];
    
    soundView = soundController.view;
    topView = soundView;
    soundView.frame = CGRectMake(10, 250, soundView.bounds.size.width, soundView.bounds.size.height);
    [self addBlocker];
    [self.view addSubview:soundView];
    
}
- (void)closeTopView {
    [self.modeVC.view removeFromSuperview];
    [self.topView removeFromSuperview];
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



- (void)dealloc {
    
    [super dealloc];
}
@end
