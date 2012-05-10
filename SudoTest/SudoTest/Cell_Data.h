//
//  Cell_Data.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-9.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cell_Data : NSObject

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
