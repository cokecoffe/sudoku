//
//  AppDelegate.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sudoku.h"

@class FirstViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    FirstViewController *firstVC;
}

@property (strong, nonatomic) UIWindow *window;
@property (assign,nonatomic) FirstViewController *firstVC;

@end
