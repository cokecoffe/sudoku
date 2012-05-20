//
//  Sudoku.m
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Sudoku.h"
#import "Cell_Data.h"

@implementation Sudoku

-(id)init
{
    if (self = [super init]) 
    {
        for (int i=0; i<9; i++) 
        {
            for (int j=0; j<9; j++)
            {
                cells[i][j] = [[Cell_Data alloc]initWithX:i Y:j];
            }
        }    
        return self;
    }
    else
    {
        return nil;
    }
}

-(void)dealloc
{
    for (int i=0; i<9; i++) 
    {
        for (int j=0; j<9; j++)
        {
            [cells[i][j] release];
        }
    }
    
    [super dealloc];
}
-(BOOL)isBlankCellWithX:(int)x Y:(int)y
{
    return cells[x][y].isBlank;
}

-(int)GetCellWithX:(int)x Y:(int)y
{
    return cells[x][y].value;
}

/*从1-9中验证值是否可取*/
-(bool)IsXYvalidWithCell:(Cell_Data *)c N:(int)n
{
    for (int i = 0; i< 9; i++)
    {
        if(i!=c.y)
        {
            if (n == cells[c.x][i].value)
                return 0;
        }
    }
    for (int i = 0; i< 9; i++)
    {
        if(i!=c.x)
        {
            if (n == cells[i][c.y].value)
                return 0;
        }
    }
    int cx = c.x/3*3+1;
    int cy = c.y/3*3+1;
    for (int i = -1;i<2;i++)
    {
        for (int j = -1;j<2;j++)
        {
            if(!((cx+i)== c.x&&(cy+j)== c.y))
            {
                if (cells[cx+i][cy+j].value == n)
                    return 0;
            }
            
        }
    }
    return 1;
    
}

/*构造可取值列表*/
-(void)InitValidlistforCellX:(int)x Y:(int)y;
{
  //  NSLog(@"%d %d的可取列表为:",x,y);
    for(int i = 1;i <= 9;i++)
    {
        if([self IsXYvalidWithCell:cells[x][y] N:i])
        {   
          //  printf("%d\t",i);
            [cells[x][y].validList addObject:[NSNumber numberWithInt:i]];
        }
    }
    //printf("\n");
    
    
}

// 用经典的深度搜索来生成一个可行解
-(int)FillCellX:(int)x Y:(int)y
{
    
    if([cells[x][y].validList count] != 0)//若取值列表有值则随机选取一个并从取值列表中删除
    {   
        int size = [cells[x][y].validList count];
        srand((unsigned)time(NULL));
        int n = rand()%size;
        
        cells[x][y].value = [[cells[x][y].validList objectAtIndex:n]intValue];
        [cells[x][y].validList removeObjectAtIndex:n];
        
        //NSLog(@"%d %d尝试填充为,v = %d",x,y,cells[x][y].value);
    }
    else//若无值可取，那么它之前的Cell要重新再填一个，尝试，然后继续填充自己
    {
        if (x==0 && y==0)//递归到最终00也没得出矩阵！ 
        {
            return -1;
        }
        cells[x][y].value = 0;//非常关键的一步，在回填之前，先把自己的值抹掉！！！
        if(y != 0)
        {
           // NSLog(@"没有可选值，要填它的上一个%d %d",x,y-1);
            if (-1 == [self FillCellX:x Y:y-1]) {
                return -1;
            }
        }
        else 
        {
           // NSLog(@"没有可选值，要填它的上一个%d %d",x-1,8);
            if (-1 == [self FillCellX:x-1 Y:8]) {
                return -1;
            }
        }
        
        [self InitValidlistforCellX:x Y:y];
        
        if (-1 == [self FillCellX:x Y:y]) {
            return -1;
        }

    }
    return  0;
}

/*构造数独矩阵*/
-(void)createMatrix
{
    for (int i = 0;i < 9;i++)
    {
        for (int j = 0;j < 9;j++)
        {
           // NSLog(@"准备构造%d,%d",i,j);
            [self InitValidlistforCellX:i Y:j];//为每个Cell构造可取值的列表
           // NSLog(@"准备填充%d,%d",i,j);
            if (-1 == [self FillCellX:i Y:j]) //从可取值列表中取值填入Cell
            {
           //     NSLog(@"填充失败");
                return;
            }
        }
    }
}


/*根据难度设置不同的空*/
-(void)FillBlankInMatrixWithLevel:(int)level
{
    int i=0;
    int j=0;
    int nLoop = 0;
    int blankCount = 0;
    int subCount=0;
 
    switch (level)
    {
        case 0:
            blankCount = 2;           
            break;
        case 1:
            blankCount = 4;           
            break;
        case 2:
            blankCount = 6;            
            break;
        default:
            blankCount = 3;
            break;
    }
    
    for(nLoop=0;nLoop<9; nLoop++)//为每个宫挖去blankCount(+1)个洞，共blankCount*9个 
    {
        subCount = 0;
        
        srand((unsigned)time(NULL)+nLoop);
        
        while (subCount < (blankCount+rand()%2)) 
        {
            srand((unsigned)time(NULL)+nLoop);
            do {
                i = 3*(nLoop%3)+rand()%3;
                j = 3*(nLoop/3)+rand()%3;
            } while (cells[i][j].isBlank == YES);
            
            subCount++;
            cells[i][j].isBlank = YES;
        }
    } 
    
}

-(void)ShowCells
{
    for (int i=0; i<9; i++) 
    {
        for (int j=0; j<9; j++) 
        {
            if (cells[i][j].isBlank == NO) 
            {
                NSLog(@"%@",cells[i][j]);
            }
            else {
                NSLog(@"0");
            }

        }
        NSLog(@"\n");
    }
}
@end
