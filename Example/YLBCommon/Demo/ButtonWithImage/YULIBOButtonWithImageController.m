//
//  YULIBOButtonWithImageController.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOButtonWithImageController.h"
#import "YULIBOButtonWithImageView.h"

@interface YULIBOButtonWithImageController ()

@end

@implementation YULIBOButtonWithImageController

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
    YULIBOButtonWithImageView *currentView = [YULIBOButtonWithImageView createView];
    currentView.ylb_y = 0;
    currentView.ylb_height = self.view.ylb_height;
    [self.view addSubview:currentView];
}

@end
