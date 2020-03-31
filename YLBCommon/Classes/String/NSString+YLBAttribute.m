//
//  NSString+YLBAttribute.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "NSString+YLBAttribute.h"

@implementation NSString (YLBAttribute)

+ (NSAttributedString *)attributedText:(NSArray*)stringArray attributeAttay:(NSArray *)attributeAttay {
    // 定义要显示的文字内容
    NSString * string = [stringArray componentsJoinedByString:@""];//拼接传入的字符串数组
    // 通过要显示的文字内容来创建一个带属性样式的字符串对象
    NSMutableAttributedString * result = [[NSMutableAttributedString alloc] initWithString:string];
    for(NSInteger i = 0; i < stringArray.count; i++){
        // 将某一范围内的字符串设置样式
        [result setAttributes:attributeAttay[i] range:[string rangeOfString:stringArray[i]]];
    }
    // 返回已经设置好的带有样式的文字
    return [[NSAttributedString alloc] initWithAttributedString:result];
}

@end
