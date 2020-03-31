//
//  YULIBOImaginaryLineViewController.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOImaginaryLineViewController.h"
#import <YLBCommon/YLBImaginaryLine.h>
#import <YLBProUI/YLBProUI.h>
@interface YULIBOImaginaryLineViewController ()

@end

@implementation YULIBOImaginaryLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    YLBImaginaryLine *line = [[YLBImaginaryLine alloc] initWithFrame:CGRectMake(8, 0, self.view.ylb_width - 8*2, 8)];
    [line ylb_becomeCenterInSuperView:self.view];
    [self.view addSubview:line];
//    YLBAlertView *alertView = [YLBAlertView createAlertView];
//    [alertView showView:line alignment:YLBAlertViewAlignmentCenter];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
