//
//  Sudoku.h
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cell;

@interface Sudoku : NSObject
{
    Cell *cells[9][9];
}

-(void)FillCellWithX:(int)x Y:(int)y;
-(void)ShowCells;
-(void)createMatrix;

-(bool)IsXYvalidWithCell:(Cell *)c N:(int)n;
-(void)InitValidlistforCell:(Cell*)cell;

@end
