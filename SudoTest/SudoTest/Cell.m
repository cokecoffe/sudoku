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
@synthesize validList;

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
        validList = [NSMutableArray array];
        
        [self setImage:[UIImage imageNamed:@"Icon.png"] forStates:UIControlStateNormal];
        
        [self setTitle:@"数字" forState:UIControlStateNormal];
        self.adjustsImageWhenHighlighted = YES;
    }
    return self;
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
