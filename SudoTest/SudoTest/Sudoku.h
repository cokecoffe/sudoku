//
//  Sudoku.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Cell_Data;

@interface Sudoku : NSObject
{
    Cell_Data *cells[9][9];
}

-(Cell_Data*)GetCellWithX:(int)x Y:(int)y;
-(void)FillCell:(Cell_Data*)cell;
-(void)ShowCells;
-(void)createMatrix;


-(bool)IsXYvalidWithCell:(Cell_Data *)c N:(int)n;
-(void)InitValidlistforCell:(Cell_Data*)cell;
@end
