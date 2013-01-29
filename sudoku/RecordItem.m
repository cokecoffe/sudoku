//
//  RecordItem.m
//  SudoTest
//
//  Created by 可可 王 on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "RecordItem.h"

@implementation RecordItem
@synthesize userName;
@synthesize timeused;

-(void)setCellX:(int)x Y:(int)y Value:(int)v isBlank:(BOOL)yn
{
    cell[x][y].value = v;
    cell[x][y].isBlank = yn;
}

-(void)getCellX:(int)x Y:(int)y Value:(int*)v isBlank:(BOOL*)yn
{
    *v = cell[x][y].value;
    *yn = cell[x][y].isBlank;
}


@end
