//
//  YULIBOHomeController.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOHomeController.h"
#import "YULIBOHomeView.h"
#import <YLBCommon/YLBCommon.h>
@interface YULIBOHomeController ()

@end

@implementation YULIBOHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupSubviews];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setupSubviews {
    YULIBOHomeView *currentView = [YULIBOHomeView createView];
    currentView.ylb_y = 0;
    currentView.ylb_height = self.view.ylb_height;
    [self.view addSubview:currentView];
    
    /*
     //iOS核心动画内存泄漏CAKeyframeAnimation解决方案:
     1、引入代理
     YLBAnimationWeakDelegate
     
     2、创建对应实例
     CAKeyframeAnimation *moveAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
     YLBAnimationDelegateManager * manager = [YLBAnimationDelegateManager new]; //创建实例
     manager.delegate = self; //进行弱引用
     moveAnimation.delegate = manager; //进行强引用
     
     */
    
}

@end
