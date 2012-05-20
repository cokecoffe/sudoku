//
//  Cell.m
//  SudoTest
//
//  Created by Vincent on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Cell.h"

@implementation Cell

@synthesize isBlank;
@synthesize x;
@synthesize y;
@synthesize value;
@synthesize userValue;
@synthesize noteList;
@synthesize label1;
@synthesize label2;
@synthesize label3;
@synthesize label4;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        isBlank = YES;
        x = 0;
        y = 0;
        value = 0;
        userValue = 0;
        noteList = nil;         
        [self setTitle:@"数字" forState:UIControlStateNormal];
//        noteList = [NSMutableArray arrayWithCapacity:9];
        noteList = [[NSMutableArray alloc]initWithCapacity:9];
        /*
        label1 = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 17, 17)];
        label1.font = [UIFont systemFontOfSize:12];
       // [self addSubview:label1];
        
        label2 = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x+17, frame.origin.y, 17, 17)];
        label2.font = [UIFont systemFontOfSize:12];
        //[self addSubview:label2];
        
        label3 = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x, frame.origin.y+17, 17, 17)];
        label3.font = [UIFont systemFontOfSize:12];
       // [self addSubview:label3];
        
        label4 = [[UILabel alloc]initWithFrame:CGRectMake(frame.origin.x+17, frame.origin.y+17, 17, 17)];
        label4.font = [UIFont systemFontOfSize:12];
       // [self addSubview:label4];
         */
        
    }
    return self;
}

-(void)dealloc
{
    [label1 release];
    [label2 release];
    [label3 release];
    [label4 release];
    [noteList release];
    [super dealloc];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


@end
