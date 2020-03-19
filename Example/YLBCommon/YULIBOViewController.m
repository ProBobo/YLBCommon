//
//  YULIBOViewController.m
//  YLBCommon
//
//  Created by ProBobo on 03/19/2020.
//  Copyright (c) 2020 ProBobo. All rights reserved.
//

#import "YULIBOViewController.h"
#import <YLBCommonDefines.h>

@interface YULIBOViewController ()

@end

@implementation YULIBOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    YLBDLog(@"statusBar = %f, navBarHeight = %d, tabbarHeigt = %d \n",YLBStatusBarHeight, YLBNavigationBarHeight, YLBTabBarHeight);
    YLBDLog(@"ScreenSize = (%f,%f)", YLB_SCREEN_WIDTH, YLB_SCREEN_HEIGHT);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
