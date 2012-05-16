//
//  GameViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Cell.h"
#import "Sudoku.h"
#import "global.h"

@interface GameViewController : UIViewController
{    
    id delegate;
    Cell *cells[9][9];
    int EditX;
    int EditY;
    Sudoku *sudokuCreator;
}

@property (assign) id delegate;
@property (assign) int EditX;
@property (assign) int EditY;
@property (retain,nonatomic) Sudoku *sudokuCreator;

-(IBAction)BackToHome:(id)sender;
- (IBAction)CommitAnswer:(id)sender;

-(void)CellButtonTouchUpInside:(id)sender;
-(IBAction)InputNum:(id)sender;
@end
