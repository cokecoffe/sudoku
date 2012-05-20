//
//  RecordItem.h
//  SudoTest
//  用来表示一个纪录
//
//  Created by 可可 王 on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct CELL 
{
    BOOL isBlank;
    int value;
};

@interface RecordItem : NSObject
{
    NSString *userName;
    int      timeused;
    struct CELL cell[9][9];
}

@property(nonatomic,copy) NSString *userName;
@property(assign,nonatomic) int timeused;

-(void)setCellX:(int)x Y:(int)y Value:(int)v isBlank:(BOOL)yn;
-(void)getCellX:(int)x Y:(int)y Value:(int*)v isBlank:(BOOL*)yn;

@end
