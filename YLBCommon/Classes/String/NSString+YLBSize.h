//
//  NSString+YLBSize.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLBSize)
+ (CGFloat)ylb_stringHeight:(UIFont *)font;
- (CGFloat)ylb_stringHeight:(UIFont *)font;
- (CGSize)ylb_stringSize:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
