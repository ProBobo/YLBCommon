//
//  NSNumber+Formatter.h
//  YLBCommon
//
//  Created by yulibo on 2020/11/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSNumber (Formatter)
/**
 处理double数据类型的小数点显示问题，如1.0显示为1.0000...的问题
 */
- (NSString *)adaptDoubleToStringFromNumber;
@end

NS_ASSUME_NONNULL_END
