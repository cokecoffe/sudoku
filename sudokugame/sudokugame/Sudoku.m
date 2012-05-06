//
//  Sudoku.m
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Sudoku.h"
#import "Cell.h"

@implementation Sudoku

-(id)init
{
    if (self = [super init]) 
    {
        for (int i=0; i<9; i++) 
        {
            for (int j=0; j<9; j++)
            {
                cells[i][j] = [[Cell alloc]initWithX:i Y:j];
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

-(Cell*)GetCellWithX:(int)x Y:(int)y
{
    return cells[x][y];
}

/*从1-9中验证值是否可取*/
-(bool)IsXYvalidWithCell:(Cell *)c N:(int)n
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
-(void)InitValidlistforCell:(Cell*)cell
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
-(void)FillCell:(Cell*)cell
{
    if([cell.validList count] != 0)//若取值列表有值则随即选取一个并从取值列表中删除
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

-(void)ShowCells
{
    for (int i=0; i<9; i++) 
    {
        for (int j=0; j<9; j++) 
        {
            NSLog(@"%@",cells[i][j]);
        }
        NSLog(@"\n");
    }
}
@end
