//
//  YLBTransparentController.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/30.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YLBTransparentController.h"

@interface YLBTransparentController ()

@end

@implementation YLBTransparentController

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"";//设置对应标题
    NSDictionary *titleTextAttributes = @{
                                             NSForegroundColorAttributeName : [UIColor whiteColor],
                                             NSFontAttributeName : [UIFont systemFontOfSize:17],
                                             };
    self.navigationController.navigationBar.titleTextAttributes = titleTextAttributes;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    //设置导航栏透明
    [self.navigationController.navigationBar setTranslucent:true];
    //设置背景为空
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    //处理导航栏有条线的问题
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];


}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //如果不想让其他页面的导航栏变为透明，需要重置
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

@end