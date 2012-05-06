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
