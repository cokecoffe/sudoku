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


/*初始化可选值，随机1-9*/
-(void)InitValidList
{
    int i;
    int j;
    int arr[9];
    
    if (validList) 
    {
        [validList release];
    }
    validList = [[NSMutableArray alloc]init];
    
    for (i = 0; i<9; i++) 
    {
        while (TRUE) 
        {
            arr[i] = random(9);
            for (j = i-1; j>=0; j--) 
            {
                if (arr[j] == arr[i]) 
                {
                    break;
                }
            }
            if (j<0) 
            {
                break;
            }
        }
        [validList addObject:[NSNumber numberWithInt:arr[i]]];
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

