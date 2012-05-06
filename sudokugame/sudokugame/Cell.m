//
//  Cell.m
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//


#import "Cell.h"
#define random(x) (rand()%x+1)

@implementation Cell

@synthesize x;
@synthesize y;
@synthesize value;
@synthesize validList;


-(id)initWithX:(int)fx Y:(int)fy 
{
    if (self = [super init]) {
        x = fx;
        y = fy;
        value = 0;
        validList = [NSMutableArray array];
        return  self;
    }
    else 
    {
        return nil;
    }
}

-(NSString*)description
{
    NSString *des = [NSString stringWithFormat:@"[%d][%d],%d",x,y,value];
    return des;
}

-(void)dealloc
{
    [validList release];
    [super dealloc];
}

@end

