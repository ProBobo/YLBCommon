//
//  YLBAlertView.h
//  YLBProUI_Example
//
//  Created by yulibo on 2020/3/27.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, YLBAlertViewAlignment) {
    YLBAlertViewAlignmentNone = 0,
    YLBAlertViewAlignmentCenter
};

@interface YLBAlertView : UIView
/**
 点击空白处是否移除弹框
 */
@property(nonatomic, assign) BOOL isTouchEnable;
/**
 创建弹框
 */
+ (instancetype)createAlertView;
/**
 显示弹框
 */
- (void)showView:(UIView *)view alignment:(YLBAlertViewAlignment)alignment;
/**
 移除弹框
 */
- (void)hideView;
/**
 设置背景颜色及透明度
 */
- (void)setBackgroundViewColor:(UIColor *)color;
@end

NS_ASSUME_NONNULL_END
