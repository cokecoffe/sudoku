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
    Cell *cells[9][9];
    int EditX;
    int EditY;
    Sudoku *sudokuCreator;
    UIView *panelView;
    UIButton *blocker;
    UIImageView *inputBG;
    NSTimer *gameTimer;
    BOOL isInput;
    UIButton *InputChangeBT;
}
@property (retain, nonatomic) IBOutlet UIButton *InputChangeBT;
@property (retain, nonatomic) IBOutlet UILabel *timeLabel;
@property (retain, nonatomic) IBOutlet UIImageView *inputBG;
@property (assign) int EditX;
@property (assign) int EditY;
@property (retain,nonatomic) Sudoku *sudokuCreator;
@property (retain,nonatomic) IBOutlet UIView *panelView;
@property (retain, nonatomic) IBOutlet UILabel *LevelLabel;
@property (retain,nonatomic) NSTimer *gameTimer;
@property (assign,nonatomic) BOOL isInput;

- (IBAction)ChangeInputMode:(id)sender;
-(void)CellButtonTouchUpInside:(id)sender;
-(IBAction)InputNum:(id)sender;
- (IBAction)CommitAnswer:(id)sender;
- (IBAction)ResumeGame:(id)sender;
- (IBAction)inputBTDown:(id)sender; 
@end
