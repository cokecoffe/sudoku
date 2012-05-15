//
//  global.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-8.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#ifndef SudoTest_global_h
#define SudoTest_global_h

enum PAGEINDEX
{
    RANK_PAGE,
    MODE_PAGE,
    GAME_PAGE
};

//游戏难度
enum GAMELEVEL
{
    LEVEL_ESAY,
    LEVEL_MID,
    LEVEL_HARD
};

extern int gGameLevel;

//游戏模式
enum GAMEMODE
{
    MODE_TIME,
    MODE_CHALLENGE
};
extern int gGameMode;

extern float gsoundVolume;
extern float gmusicVolume;

#define SQUAREWIDTH 279 //九宫图的宽高
#define CELLWIDTH (SQUAREWIDTH/9)//每个小格子的宽高


#endif
