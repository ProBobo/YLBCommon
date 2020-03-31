//
//  NSString+YLBAttribute.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLBAttribute)
/**
 获取带有不同样式的文字内容
 @param stringArray 字符串数组
 @param attributeAttay 样式数组
 */
+ (NSAttributedString *)attributedText:(NSArray*)stringArray attributeAttay:(NSArray *)attributeAttay;
@end

NS_ASSUME_NONNULL_END
