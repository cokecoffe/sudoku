//
//  RankViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "global.h"

@interface RankViewController : UIViewController
{
    id delegate;
}

@property(assign) id delegate;

-(IBAction)BackToHome:(id)sender;

@end
