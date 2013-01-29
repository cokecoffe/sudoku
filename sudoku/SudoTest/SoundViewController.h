//
//  SoundViewController.h
//  SudoTest
//
//  Created by 可可 王 on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoundViewController : UIViewController
{
    UISlider *soundSlider;
    UISlider *musicSlider;
}

@property (retain,nonatomic) IBOutlet UISlider *soundSlider;
@property (retain,nonatomic) IBOutlet UISlider *musicSlider;

- (IBAction)SoundChanged:(id)sender;
- (IBAction)MusicVolumeChanged:(id)sender;

@end
