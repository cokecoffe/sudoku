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

@synthesize EditX;
@synthesize EditY;
@synthesize sudokuCreator;
@synthesize panelView;

- (IBAction)ReturnToHomepage:(id)sender 
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)RestartGame:(id)sender
{
    sudokuCreator = [[Sudoku alloc]init];//创建构造矩阵构造对象
    [sudokuCreator createMatrix];
    [sudokuCreator FillBlankInMatrixWithLevel:gGameLevel];
    
    for (int i=0;i<9; i++) 
    {
        for (int j=0; j<9; j++) 
        {
            cells[i][j].x = i;
            cells[i][j].y = j;
            cells[i][j].value = [sudokuCreator GetCellWithX:i Y:j];
            
            if ([sudokuCreator isBlankCellWithX:i Y:j] == NO) //显示数字的
            {                    
                cells[i][j].userValue =  cells[i][j].value;
                [cells[i][j] setTitle:[NSString stringWithFormat:@"%d",cells[i][j].userValue] forState: UIControlStateNormal];
                [cells[i][j]setBackgroundColor:[UIColor colorWithRed:(float)(211.0/255.0) green:(float)(211.0/255.0) blue:(float)(211.0/255.0) alpha:1.0]];
            }
            else //待填的
            {
                [cells[i][j] setTitle:nil forState: UIControlStateNormal];
                [cells[i][j] setBackgroundColor:[UIColor clearColor]];
            }
            [cells[i][j] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
        }
    }
    
    [sudokuCreator release];
    
    [panelView removeFromSuperview];
    [blocker removeFromSuperview];
}

- (IBAction)GameOptionPanelShow:(id)sender 
{
    [self addBlocker];
    [self.view addSubview:blocker];
    
    panelView.frame = CGRectMake(80,237,panelView.bounds.size.width,panelView.bounds.size.height);
    [self.view addSubview:panelView];
    
}

 //记录要改变的Cell的坐标
-(void)CellButtonTouchUpInside:(id)sender
{
   
    if ([(Cell*)sender isBlank] == YES) {
       // NSLog(@"Button Pressed %d,%d",((Cell*)sender).x,((Cell*)sender).y);
        EditX = ((Cell*)sender).x;
        EditY = ((Cell*)sender).y;
        [cells[EditX][EditY] setBackgroundColor:[UIColor darkGrayColor]];
        return;
    }    
}

//将按下的数值更新到要改变的Cell
-(IBAction)InputNum:(id)sender
{
   // NSLog(@"Input%d",((UIButton *)sender).tag);
    if (EditX == -1||EditY == -1) {
        return;
    }
    
    cells[EditX][EditY].userValue = ((UIButton *)sender).tag;
    [cells[EditX][EditY] setTitle:[NSString stringWithFormat:@"%d",cells[EditX][EditY].userValue] forState: UIControlStateNormal];
    [cells[EditX][EditY] setBackgroundColor:[UIColor clearColor]];    
    [cells[EditX][EditY] setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    
}

-(void)showAlert:(NSString *)message
{
    UIAlertView *av = [[[UIAlertView alloc]initWithTitle:@"结果" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil]autorelease];
    [av show];
}

- (IBAction)CommitAnswer:(id)sender
{
    int i,j;
    
    for (i=0; i<9; i++) 
    {
        for (j=0; j<9; j++) 
        {
            if (cells[i][j].userValue!=cells[i][j].value) 
            {
                [self showAlert:@"抱歉，未做对"];
                return;
            }
        }
    }
    [self showAlert:@"完全正确"];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"GameTopPanel" owner:self options:nil];
        panelView = [array objectAtIndex:0];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    EditX = -1;
    EditY = -1;
    sudokuCreator = [[Sudoku alloc]init];//创建构造矩阵构造对象
    [sudokuCreator createMatrix];
    [sudokuCreator FillBlankInMatrixWithLevel:gGameLevel];
   
    for (int i=0;i<9; i++) 
    {
        for (int j=0; j<9; j++) 
        {
            //在此构造每一个矩阵，根据难度设置不同个数的空格
            cells[i][j] = [[Cell alloc]initWithFrame:CGRectMake(2+(CELLWIDTH+1)*i+1*(i/3),32+j*(CELLWIDTH+1)+(j/3)*1,CELLWIDTH,CELLWIDTH)];
            cells[i][j].x = i;
            cells[i][j].y = j;
            
            cells[i][j].value = [sudokuCreator GetCellWithX:i Y:j];
            
            if ([sudokuCreator isBlankCellWithX:i Y:j] == NO) //显示数字的
            {                    
                cells[i][j].userValue =  cells[i][j].value;
                [cells[i][j] setTitle:[NSString stringWithFormat:@"%d",cells[i][j].userValue] forState: UIControlStateNormal];
                [cells[i][j]setBackgroundColor:[UIColor colorWithRed:(float)(211.0/255.0) green:(float)(211.0/255.0) blue:(float)(211.0/255.0) alpha:1.0]];
            }
            
            
            [cells[i][j] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [cells[i][j] addTarget:self action:@selector(CellButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:cells[i][j]];       

        }
    }
    
    [sudokuCreator release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    //[sudokuCreator release];
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            [cells[i][j] release];
            cells[i][j] = nil;
        }
    }
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)closeTopView {
    [panelView removeFromSuperview];
    [blocker removeFromSuperview];
}

- (void)addBlocker {
    blocker = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 320.0f, 480.0f)];
    [blocker addTarget:self action:@selector(closeTopView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:blocker];
    
    [blocker release];
}

@end
