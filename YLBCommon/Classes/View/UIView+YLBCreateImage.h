//
//  UIView+YLBCreateImage.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/3.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBCreateImage)

/**
 将View上的控件合成image
 */
+ (UIImage *)imageWithView:(UIView *)view;

@end

NS_ASSUME_NONNULL_END
