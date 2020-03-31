//
//  NSString+YLBSize.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "NSString+YLBSize.h"

@implementation NSString (YLBSize)
+ (CGFloat)ylb_stringHeight:(UIFont *)font {
    NSString *theString = @"aA自适应0123456789";
    CGSize size = [theString sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.height;
}
- (CGFloat)ylb_stringHeight:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size.height;
}
- (CGSize)ylb_stringSize:(UIFont *)font {
    CGSize size = [self sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}
@end
