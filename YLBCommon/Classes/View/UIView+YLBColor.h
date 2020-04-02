//
//  UIView+YLBColor.h
//  Pods-YLBCommon_Example
//
//  Created by yulibo on 2020/4/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLBColor)

/*
 view 是要设置渐变字体的控件   bgVIew是view的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
 */
+ (void)TextGradientview:(UIView *)view bgVIew:(UIView *)bgVIew gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
/*
control 是要设置渐变字体的控件   bgVIew是control的父视图  colors是渐变的组成颜色  startPoint是渐变开始点 endPoint结束点
*/
+ (void)TextGradientControl:(UIControl *)control bgVIew:(UIView *)bgVIew gradientColors:(NSArray *)colors gradientStartPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint;
@end

NS_ASSUME_NONNULL_END
