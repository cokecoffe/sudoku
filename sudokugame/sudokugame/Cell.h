//
//  Cell.h
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sudoku.h"

@interface Cell : NSObject
{
    int x;
    int y;
    int value;
    NSMutableArray *validList;
}

@property (assign,readwrite)int x;
@property (assign,readwrite)int y;
@property (assign,readwrite)int value;
@property (assign,readwrite)NSMutableArray *validList;

-(id)initWithX:(int)fx Y:(int)fy;


@end
