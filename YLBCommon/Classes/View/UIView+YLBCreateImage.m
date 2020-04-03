//
//  UIView+YLBCreateImage.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/3.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIView+YLBCreateImage.h"

@implementation UIView (YLBCreateImage)

//将View上的控件合成image
+ (UIImage *)imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, [[UIScreen mainScreen] scale]);//图形以选项开始图像上下文
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];/**渲染属性和方法。
                                                                *将接收器及其子处理器呈现为“ctx”。这个方法
                                                                *从图层树直接渲染。在坐标空间中呈现的层。
                                                                */
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();//*图像从当前图像上下文获取图像
    UIGraphicsEndImageContext();//结束图像上下文
    return img;
}

@end
