//
//  GameViewController.m
//  SudoTest
//
//  Created by 可可 王 on 12-5-7.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GameViewController.h"
#import "AppDelegate.h"

@interface GameViewController ()

@end

@implementation GameViewController
@synthesize delegate;
@synthesize EditX;
@synthesize EditY;

-(void)CellButtonTouchUpInside:(id)sender
{
    NSLog(@"Button Pressed %d,%d",((Cell*)sender).x,((Cell*)sender).y);
    //记录要改变的Cell的坐标
    EditX = ((Cell*)sender).x;
    EditY = ((Cell*)sender).y;
    [cells[EditX][EditY] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    return;
}

-(IBAction)InputNum:(id)sender
{
    NSLog(@"Input%d",((UIButton *)sender).tag);
    //讲按下的数值更新到要改变的Cell
    cells[EditX][EditY].userValue = ((UIButton *)sender).tag;
    [cells[EditX][EditY] setTitle:[NSString stringWithFormat:@"%d",cells[EditX][EditY].userValue] forState: UIControlStateNormal];
    [cells[EditX][EditY] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
}

-(IBAction)BackToHome:(id)sender
{
    if ([delegate respondsToSelector:@selector(returnHomePageFromIndex:)])
    {
        [delegate returnHomePageFromIndex:GAME_PAGE];
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
  
        Sudoku *sudokuCreator = [[Sudoku alloc]init];//创建构造矩阵构造对象
        [sudokuCreator createMatrix];
        
        //挖洞
        //...待实现
        //
         
        for (int i=0;i<9; i++) 
        {
            for (int j=0; j<9; j++) 
            {
                //在此构造每一个矩阵，根据难度设置不同个数的空格
                cells[i][j] = [[Cell alloc]initWithFrame:CGRectMake(21+CELLWIDTH*i,40+j*CELLWIDTH,CELLWIDTH,CELLWIDTH)];
                cells[i][j].x = i;
                cells[i][j].y = j;
                
                cells[i][j].value = [[sudokuCreator GetCellWithX:i Y:j] value];
                cells[i][j].userValue =  cells[i][j].value;
                
                [cells[i][j] setTitle:[NSString stringWithFormat:@"%d",cells[i][j].userValue] forState: UIControlStateNormal];
                [cells[i][j] setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
                
                [cells[i][j] addTarget:self action:@selector(CellButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:cells[i][j]];                
            }
        }
        
        [sudokuCreator release];

        
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

@end
