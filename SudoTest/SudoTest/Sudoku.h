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

-(BOOL)isBlankCellWithX:(int)x Y:(int)y;
-(int)GetCellWithX:(int)x Y:(int)y;

-(void)ShowCells;
-(void)createMatrix;
-(void)FillBlankInMatrixWithLevel:(int)level;

-(bool)IsXYvalidWithCell:(Cell_Data *)c N:(int)n;
-(void)InitValidlistforCellX:(int)x Y:(int)y;
-(int)FillCellX:(int)x Y:(int)y;

@end
