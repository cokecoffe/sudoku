//
//  RecordManager.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-17.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RecordItem;

@interface RecordManager : NSObject
{
    NSMutableArray *EasyRecords;
    NSMutableArray *MidRecords;
    NSMutableArray *HardRecords;
}

@property(retain,nonatomic) NSMutableArray *EasyRecords;
@property(retain,nonatomic) NSMutableArray *MidRecords;
@property(retain,nonatomic) NSMutableArray *HardRecords;

/*初始化排行榜管理器，如果没有本地文件存储，则记录保存为空*/
-(void)InitRecords;

/*将纪录保存至文件*/
-(void)WriteRecordsToDisk;

/*判断是不是破纪录了*/
-(BOOL)isNewRecord:(RecordItem*)record Level:(int)lv;

/*保存新纪录到数组*/
-(void)SaveTheRecord:(RecordItem*)record Level:(int)lv;

@end
