//
//  FirstViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModeSelectViewController;

@interface FirstViewController : UIViewController
{
    IBOutlet UIButton *bt_Begin;
    IBOutlet UIButton *bt_Mode;
    IBOutlet UIButton *bt_Rank;
    ModeSelectViewController *modelVC;
}

@property(retain,nonatomic) ModeSelectViewController *modelVC;

-(IBAction)ModeSelect:(id)sender;
-(IBAction)RankList:(id)sender;
-(IBAction)StartGame:(id)sender;

@end
