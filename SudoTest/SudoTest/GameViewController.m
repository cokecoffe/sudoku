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

@synthesize timeLabel;
@synthesize EditX;
@synthesize EditY;
@synthesize sudokuCreator;
@synthesize panelView;
@synthesize gameTimer;
@synthesize LevelLabel;
@synthesize inputBG;
@synthesize isInput;
@synthesize InputChangeBT;

static int h,m;

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
            cells[i][j].isBlank = [sudokuCreator isBlankCellWithX:i Y:j];
            
            if ([sudokuCreator isBlankCellWithX:i Y:j] == NO) //显示数字的
            {                    
                cells[i][j].userValue =  cells[i][j].value;
                [cells[i][j] setTitle:[NSString stringWithFormat:@"%d",cells[i][j].userValue] forState: UIControlStateNormal];
                 [cells[i][j]setBackgroundColor:[UIColor colorWithRed:(float)(211.0/255.0) green:(float)(211.0/255.0) blue:(float)(211.0/255.0) alpha:0.7]];
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
    h = 0;
    m = 0;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
}

- (IBAction)GameOptionPanelShow:(id)sender 
{
    [gameTimer invalidate];
    [self addBlocker];
    [self.view addSubview:blocker];
    
    panelView.frame = CGRectMake(64,230,panelView.bounds.size.width,panelView.bounds.size.height);
    [self.view addSubview:panelView];
}

- (IBAction)CommitAnswer:(id)sender
{
    int i,j;
    [gameTimer invalidate];
    
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

- (IBAction)ChangeInputMode:(id)sender 
{
    if (isInput == YES) 
    {
        [inputBG setImage:[UIImage imageNamed:@"input-square_ye.png"]];
        [InputChangeBT setBackgroundImage:[UIImage imageNamed:@"demo-change.png"] forState:UIControlStateNormal];
    
        isInput = NO;
    }
    else 
    {
        [inputBG setImage:[UIImage imageNamed:@"input-square.png"]];
        [InputChangeBT setBackgroundImage:[UIImage imageNamed:@"demo.png"] forState:UIControlStateNormal];
        isInput = YES;
    }

}

 //记录要改变的Cell的坐标
-(void)CellButtonTouchUpInside:(id)sender
{
   
    if ([(Cell*)sender isBlank] == YES) {
        if (EditX!=-1&&EditY!=-1) {
            [cells[EditX][EditY] setBackgroundColor:[UIColor clearColor]];
        }
        
        EditX = ((Cell*)sender).x;
        EditY = ((Cell*)sender).y;
        [cells[EditX][EditY] setBackgroundColor:[UIColor colorWithRed:(float)(216.0/255.0) green:(float)(234.0/255.0) blue:(float)(255.0/255.0) alpha:1.0]];
        return;
    }    
}

//将按下的数值更新到要改变的Cell
-(IBAction)InputNum:(id)sender
{
    int loop=0;
    int LoopCOUNT = 0;
    int num = ((UIButton *)sender).tag;
    NSMutableString *note = [NSMutableString string];
    
    if (EditX == -1||EditY == -1) {
        return;
    }
    if (isInput == YES)//如果是输入状态再确定更改数字 
    {
        cells[EditX][EditY].userValue = num;
        cells[EditX][EditY].titleLabel.font = [UIFont systemFontOfSize:19];
        [cells[EditX][EditY] setTitle:[NSString stringWithFormat:@"%d",cells[EditX][EditY].userValue] forState: UIControlStateNormal];
        [cells[EditX][EditY] setBackgroundColor:[UIColor clearColor]];    
        [cells[EditX][EditY] setTitleColor:[UIColor colorWithRed:(float)(23.0/255.0) green:(float)(106.0/255.0) blue:(float)(165.0/255.0) alpha:1.0] forState:UIControlStateNormal];
    }
    else//备忘记忆状态
    {        
        if ([cells[EditX][EditY].noteList containsObject:[NSNumber numberWithInt:num]]) //如果输入的备选已存在，则删除
        {
            [cells[EditX][EditY].noteList removeObject:[NSNumber numberWithInt:num]];
        }
        else 
        {
            [cells[EditX][EditY].noteList addObject:[NSNumber numberWithInt:num]];
        }
        
        //对备选列表排序
        NSSortDescriptor *lowTohigh = [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES];
        [cells[EditX][EditY].noteList sortUsingDescriptors:[NSArray arrayWithObject:lowTohigh]];
         
        if ([cells[EditX][EditY].noteList count]<5) 
        {
            LoopCOUNT = 2;
            cells[EditX][EditY].titleLabel.font = [UIFont fontWithName:@"SinhalaSangamMN"size:15];
            cells[EditX][EditY].titleLabel.numberOfLines = 2;
        }
        else 
        {
            LoopCOUNT = 3;
            cells[EditX][EditY].titleLabel.font = [UIFont fontWithName:@"SinhalaSangamMN"size:11];
            cells[EditX][EditY].titleLabel.numberOfLines = 3;
        }
        
        for (NSNumber *n in cells[EditX][EditY].noteList)
        {
            [note appendFormat:@"%d",[n intValue]];
            loop++;
            if (loop%LoopCOUNT == 0) 
            {
                [note appendFormat:@"\n"];
            }
            else {
                [note appendFormat:@"  "];
            }
        }
        
        [cells[EditX][EditY] setTitle:note forState:UIControlStateNormal];
        [cells[EditX][EditY] setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    }
    
}

-(void)showAlert:(NSString *)message
{
    UIAlertView *av = [[[UIAlertView alloc]initWithTitle:@"结果" message:message
                                                delegate:self 
                                       cancelButtonTitle:@"返回"
                                       otherButtonTitles:@"玩下一局", nil]autorelease];
    [av show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0://back
            gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
            break;
        case 1://new game
            [self RestartGame:nil];
            break;
            
        default:
            break;
    }
}


-(void)updateTimeLabel
{    
    NSMutableString *hourstr,*minstr;
    
    if (h<10) 
    {
        hourstr = [NSMutableString stringWithFormat:@"0%d",h];
    }
    else
    {
        hourstr = [NSMutableString stringWithFormat:@"%d",h];
    }
    
    if (m<10) 
    {
        minstr = [NSString stringWithFormat:@":0%d",m];
    }
    else 
    {
        minstr = [NSString stringWithFormat:@":%d",m];
    }
    
    
    [hourstr appendString:minstr];
    
    [timeLabel setText:hourstr];
    
    
    m++;
    if (m == 60) {
        h++;
        m = 0;
    }
}

- (IBAction)ResumeGame:(id)sender 
{
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
    [panelView removeFromSuperview];
    [blocker removeFromSuperview];
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

#pragma mark - Life

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    switch (gGameLevel) {
        case LEVEL_ESAY:
            LevelLabel.text = @"难度:易";
            break;
        case LEVEL_MID:
            LevelLabel.text = @"难度:中";
            break;
        case LEVEL_HARD:
            LevelLabel.text = @"难度:难";
            break;
        default:
            break;
    }
    isInput = YES;
    
    EditX = -1;
    EditY = -1;
 
    
}

-(void)viewDidAppear:(BOOL)animated
{
    sudokuCreator = [[Sudoku alloc]init];//创建构造矩阵构造对象
    [sudokuCreator createMatrix];
    [sudokuCreator FillBlankInMatrixWithLevel:gGameLevel];
    
    for (int i=0;i<9; i++) 
    {
        for (int j=0; j<9; j++) 
        {
#if 1
            //在此构造每一个矩阵，根据难度设置不同个数的空格
            cells[i][j] = [[Cell alloc]initWithFrame:CGRectMake(2+(CELLWIDTH+1)*i+1*(i/3),32+j*(CELLWIDTH+1)+(j/3)*1,CELLWIDTH,CELLWIDTH)];
            
#else      
            NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"CellView" owner:self options:nil];
            cells[i][j] = [array objectAtIndex:0];
            cells[i][j].frame = CGRectMake(2+(CELLWIDTH+1)*i+1*(i/3),32+j*(CELLWIDTH+1)+(j/3)*1,CELLWIDTH,CELLWIDTH);
#endif
            cells[i][j].x = i;
            cells[i][j].y = j;            
            cells[i][j].value = [sudokuCreator GetCellWithX:i Y:j];
            cells[i][j].isBlank = [sudokuCreator isBlankCellWithX:i Y:j];
            
            
            if ([sudokuCreator isBlankCellWithX:i Y:j] == NO) //已知的数字
            {                    
                cells[i][j].userValue =  cells[i][j].value;
                [cells[i][j] setTitle:[NSString stringWithFormat:@"%d",cells[i][j].userValue] forState: UIControlStateNormal];
                [cells[i][j]setBackgroundColor:[UIColor colorWithRed:(float)(211.0/255.0) green:(float)(211.0/255.0) blue:(float)(211.0/255.0) alpha:0.7]];
            }
            
            
            [cells[i][j] setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            
            [cells[i][j] addTarget:self action:@selector(CellButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:cells[i][j]];       
            
        }
    }
    
    [sudokuCreator release];
    h = 0;
    m = 0;
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
}

- (void)viewDidUnload
{
    [self setTimeLabel:nil];
    [self setLevelLabel:nil];
    [InputChangeBT release];
    InputChangeBT = nil;
    
    for (int i=0; i<9; i++) {
        for (int j=0; j<9; j++) {
            //[cells[i][j] release];
            cells[i][j] = nil;
        }
    }
    [super viewDidUnload];
    //[sudokuCreator release];
  
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [timeLabel release];
    [LevelLabel release];
    [InputChangeBT release];
    [super dealloc];
}
- (void)closeTopView {
    gameTimer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTimeLabel) userInfo:nil repeats:YES];
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
