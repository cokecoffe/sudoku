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

-(void)FillCellWithX:(int)x Y:(int)y;
{
    // 用经典的深度搜索来生成一个可行解
    if([cells[x][y].validList count] != 0)
    {   
        int size = [cells[x][y].validList count];
        srand((unsigned)time(NULL));
        int n = rand()%size;//产生真正随机数的方法
        
        cells[x][y].value = [[cells[x][y].validList objectAtIndex:n]intValue];
        [cells[x][y].validList removeObjectAtIndex:n];
    }
    else
    {
        if(y != 0)
        {
            [self FillCellWithX:x Y:y-1];
        }
        else 
        {
            [self FillCellWithX:x-1 Y:8];
        }
        
        [self InitValidlistforCell:cells[x][y]];
        
        [self FillCellWithX:x Y:y];
    }
}


-(void)createMatrix
{
    for (int i = 0;i < 9;i++)
    {
        for (int j = 0;j < 9;j++)
        {
            [self InitValidlistforCell:cells[i][j]];
            
            [self FillCellWithX:i Y:j];
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
