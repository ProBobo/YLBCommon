//
//  NSNumber+Formatter.m
//  YLBCommon
//
//  Created by yulibo on 2020/11/24.
//

#import "NSNumber+Formatter.h"

@implementation NSNumber (Formatter)
- (NSString *)adaptDoubleToStringFromNumber {
    NSNumber *num = self;
    if (num == nil) {
        return @"";
    }
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.numberStyle = NSNumberFormatterDecimalStyle;
    NSString *resultStr = [formatter stringFromNumber:num];
    return resultStr;
}
@end
