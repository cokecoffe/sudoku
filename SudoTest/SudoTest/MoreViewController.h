//
//  MoreViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface MoreViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,MFMailComposeViewControllerDelegate>
{
    NSArray *listData;
}
@property(nonatomic,retain) NSArray *listData;
@end
