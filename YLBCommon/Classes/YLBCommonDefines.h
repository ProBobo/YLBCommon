//
//  YLBCommonDefines.h
//  YLBCommon
//
//  Created by yulibo on 2020/3/19.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#ifndef YLBCommonDefines_h
#define YLBCommonDefines_h


#pragma mark - 判断是否为iPhoneX

#ifdef __IPHONE_11_0

// 判断是否为iPhone X 系列，这样写消除在Xcode10上的警告。
#define YLB_IPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
(isPhoneX);})

#else

#define YLB_IPHONE_X NO

#endif

#pragma mark - 导航栏高度

// 状态栏高度
#define YLBStatusBarHeight UIApplication.sharedApplication.statusBarFrame.size.height
// 导航栏高度
#define YLBNavigationBarHeight 44
// 底部栏高度
#define YLBTabBarHeight (YLB_IPHONE_X ? (49 + 34) : 49)

// 打印日志
#ifdef DEBUG //测试环境
#define YLBDLog(fmt,...) NSLog((@"%s [gLine %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else //生产环境
#define YLBDLog(...)
#endif

#pragma mark - iPhone屏幕宽高
// 屏幕宽度
#define YLB_SCREEN_WIDTH ([[UIScreen mainScreen] bounds].size.width)
//屏幕高度
#define YLB_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)


#endif /* YLBCommonDefines_h */
