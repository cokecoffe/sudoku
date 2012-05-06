//
//  main.m
//  sudokugame
//
//  Created by 可可 王 on 12-5-6.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sudoku.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Sudoku *mySudo = [[Sudoku alloc]init];
        [mySudo ShowCells];
        [mySudo release];
        
    }
    return 0;
}

