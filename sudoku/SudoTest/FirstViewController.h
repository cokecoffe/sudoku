//
//  FirstViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "global.h"

@class ModeSelectViewController;
@class SoundViewController;
@class AboutViewViewController;
@class MoreViewController;

@interface FirstViewController : UIViewController
{
    IBOutlet UIButton *bt_Begin;
    IBOutlet UIButton *bt_Mode;
    IBOutlet UIButton *bt_Rank;
    UIButton *blocker;
    UIView *topView;
    ModeSelectViewController *modeVC;
    SoundViewController *soundVC;
    AboutViewViewController *aboutVC;
    MoreViewController *moreVC;
}

@property (retain, nonatomic) IBOutlet UIButton *SoundSetButton;
@property(assign,nonatomic) UIView *topView;
@property(retain,nonatomic) ModeSelectViewController *modeVC;
@property(retain,nonatomic) SoundViewController *soundVC;
@property(retain,nonatomic) AboutViewViewController *aboutVC;
@property(retain,nonatomic) MoreViewController *moreVC;

-(IBAction)ModeSelect:(id)sender;
-(IBAction)RankList:(id)sender;
-(IBAction)StartGame:(id)sender;
- (IBAction)SoundSetting:(id)sender;
- (IBAction)AboutViewBT:(id)sender;

@end
