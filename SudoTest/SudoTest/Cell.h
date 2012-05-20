//
//  Cell.h
//  SudoTest
//
//  Created by Vincent on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell : UIButton
{
    BOOL isBlank;//YES：需要用户输入的 NO：提供给用户的
    int x;//宫格的坐标
    int y;
    int value;//最终要验证的值
    int userValue;//用户输入的值
    UILabel *label1;
    UILabel *lable2;
    UILabel *label3;
    UILabel *label4;
    NSMutableArray *noteList;
}

@property(retain,nonatomic)  IBOutlet UILabel *label1;
@property(retain,nonatomic)  IBOutlet UILabel *label2;
@property(retain,nonatomic)  IBOutlet UILabel *label3;
@property(retain,nonatomic)  IBOutlet UILabel *label4;
@property(assign) BOOL isBlank;
@property(assign) int x;
@property(assign) int y;
@property(assign) int value;
@property(assign) int userValue;
@property(nonatomic,copy) NSMutableArray *noteList;

@end
