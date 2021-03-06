//
//  YULIBOShareController.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/5/30.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOShareController.h"
#import "UIImage+YLBSystemShareToWX.h"

@interface YULIBOShareController ()

@end

@implementation YULIBOShareController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    // Do any additional setup after loading the view.
    [self setupSubviews];
}

- (void)setupSubviews {
    UIButton *shareFromSystemButton = [[UIButton alloc] init];
    shareFromSystemButton.frame = CGRectMake(0, YLBStatusBarHeight + YLBNavigationBarHeight + 20, 200, 50);
    shareFromSystemButton.ylb_centerX = self.view.ylb_width / 2.0;
    [shareFromSystemButton setTitle:@"系统方法：分享微信" forState:UIControlStateNormal];
    shareFromSystemButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    shareFromSystemButton.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:shareFromSystemButton];
    
    [shareFromSystemButton addTarget:self action:@selector(shareFromSystemButtonMethod:) forControlEvents:UIControlEventTouchUpInside];
    
    [self setupButton];
}

- (void)setupButton {
    UIButton *shareFromSystemButton = [[UIButton alloc] init];
    shareFromSystemButton.frame = CGRectMake(0, YLBStatusBarHeight + YLBNavigationBarHeight + 20 + 100, 200, 50);
    shareFromSystemButton.ylb_centerX = self.view.ylb_width / 2.0;
    [shareFromSystemButton setTitle:@"跳转微信" forState:UIControlStateNormal];
    shareFromSystemButton.titleLabel.adjustsFontSizeToFitWidth = YES;
    shareFromSystemButton.backgroundColor = UIColor.cyanColor;
    [self.view addSubview:shareFromSystemButton];
    
    [shareFromSystemButton addTarget:self action:@selector(skipToWX:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)shareFromSystemButtonMethod:(id)sender {

    [self shareToWX];
}

- (void)skipToWX:(id)sender {
    NSString *urlStr = @"weixin://";
    NSURL * url = [NSURL URLWithString:urlStr];
    BOOL canOpen = [[UIApplication sharedApplication] canOpenURL:url];
    //先判断是否能打开该url
    if (canOpen)
    {   //打开微信
        [[UIApplication sharedApplication] openURL:url];
    }else {
        //        [MBProgressHUD showFailWithMessage:@"您的设备未安装微信" toView:SXDelegateWindow];
        urlStr = @"https://help.wechat.com/app/";
        url = [NSURL URLWithString:urlStr];
        canOpen = [[UIApplication sharedApplication] canOpenURL:url];
        if (canOpen) {
            [[UIApplication sharedApplication] openURL:url];
        }
        else {
            [[UIApplication sharedApplication] openURL:url];
            YLBDLog(@"请打开微信");
        }
    }
}

#pragma mark - 系统方法：微信分享
- (void)shareToWX {
    UIImage *imageToShare = [UIImage imageNamed:@"emotion_01"];
    UIImage *imageToShare1 = [UIImage imageNamed:@"navigationbar_background"];
    imageToShare = [UIImage getJPEGImagerImg:imageToShare];
    imageToShare1 = [UIImage getJPEGImagerImg:imageToShare1];
    NSArray *activityItems = @[imageToShare, imageToShare1];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    [self presentViewController:activityVC animated:TRUE completion:nil];
}

@end
