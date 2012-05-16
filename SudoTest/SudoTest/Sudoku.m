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
-(void)InitValidlistforCell:(Cell_Data*)cell
{
    for(int i = 1;i <= 9;i++)
    {
        if([self IsXYvalidWithCell:cell N:i])
        {   
            [cell.validList addObject:[NSNumber numberWithInt:i]];
        }
    }
}

// 用经典的深度搜索来生成一个可行解
-(void)FillCell:(Cell_Data*)cell
{
    if([cell.validList count] != 0)//若取值列表有值则随机选取一个并从取值列表中删除
    {   
        int size = [cell.validList count];
        srand((unsigned)time(NULL));
        int n = rand()%size;
        
        cell.value = [[cell.validList objectAtIndex:n]intValue];
        [cell.validList removeObjectAtIndex:n];
    }
    else//若无值可取，那么它之前的Cell要重新再填一个，尝试，然后继续填充自己
    {
        if(cell.y != 0)
        {
            [self FillCell:cells[cell.x][cell.y-1]];
        }
        else 
        {
            [self FillCell:cells[cell.x-1][8]];
        }
        
        [self InitValidlistforCell:cell];
        
        [self FillCell:cell];
    }
}

/*构造数独矩阵*/
-(void)createMatrix
{
    for (int i = 0;i < 9;i++)
    {
        for (int j = 0;j < 9;j++)
        {
            [self InitValidlistforCell:cells[i][j]];//为每个Cell构造可取值的列表
            
            [self FillCell:cells[i][j]];//从可取值列表中取值填入Cell
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
    
    for(nLoop=0;nLoop<9; nLoop++)//为每个宫挖去blankCount个洞，共blankCount*9个 
    {
        subCount = 0;
        while (subCount < blankCount) 
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
