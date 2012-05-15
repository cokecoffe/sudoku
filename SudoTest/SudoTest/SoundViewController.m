//
//  SoundViewController.m
//  SudoTest
//
//  Created by 可可 王 on 12-5-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "SoundViewController.h"
#import "global.h"

@interface SoundViewController ()

@end

@implementation SoundViewController
@synthesize soundSlider;
@synthesize musicSlider;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    soundSlider.value = gsoundVolume;
    musicSlider.value = gmusicVolume;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)SoundChanged:(id)sender
{
    UISlider *s_slider = (UISlider*)sender;
    gsoundVolume = s_slider.value;
    NSLog(@"音效为:%f",gsoundVolume);
}

- (IBAction)MusicVolumeChanged:(id)sender 
{
    UISlider *m_slider = (UISlider*)sender;
    gmusicVolume = m_slider.value;
    NSLog(@"音乐为:%f",gmusicVolume);
}
@end
