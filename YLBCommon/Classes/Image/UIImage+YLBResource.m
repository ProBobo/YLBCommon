//
//  UIImage+YLBResource.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/28.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "UIImage+YLBResource.h"
#import "YLBBundleManager.h"

@implementation UIImage (YLBResource)
+ (UIImage *)ylb_imageNamed:(NSString *)name {
    NSBundle *bundle = [[YLBBundleManager sharedInstance] ylb_bundle];
    UIImage *image = [UIImage imageNamed:name inBundle:bundle compatibleWithTraitCollection:nil];
    return image;
}
@end
