//
//  GameViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "global.h"

@interface GameViewController : UIViewController
{    
    id delegate;
    Cell *cells[9][9];
}
@property (assign) id delegate;

-(IBAction)BackToHome:(id)sender;

-(void)CellButtonTouchUpInside:(id)sender;
@end
