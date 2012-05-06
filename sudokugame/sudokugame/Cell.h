//
//  Cell.h
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell : NSObject
{
    int x;
    int y;
    int value;
    NSMutableArray *validList;
}
-(id)initWithX:(int)fx Y:(int)fy;
-(int)getValidValue;
-(void)InitValidList;

@end
