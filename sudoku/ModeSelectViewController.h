//
//  ModeSelectViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "global.h"

@interface ModeSelectViewController : UIViewController
{
    id delegate;
    IBOutlet UISegmentedControl *modeSelect;
    IBOutlet UISegmentedControl *levelSelect;
}

@property(assign) id delegate;
@property(assign) IBOutlet UISegmentedControl *modeSelect;
@property(assign) IBOutlet UISegmentedControl *levelSelect;

//-(IBAction)BackToHome:(id)sender;
-(IBAction)GameModeSelect:(id)sender;
-(IBAction)GameLevelSelect:(id)sender;

@end
