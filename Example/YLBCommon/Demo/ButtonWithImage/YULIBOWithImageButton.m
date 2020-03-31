//
//  YULIBOWithImageButton.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOWithImageButton.h"

@implementation YULIBOWithImageButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    CGFloat x = 38;
    CGFloat width = contentRect.size.width - x - 10;
    CGRect frame = CGRectMake(x, 0, width, contentRect.size.height);
    return frame;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    CGFloat width = 24;
    CGFloat height = 24;
    CGFloat x = 4;
    CGFloat y = (contentRect.size.height - height)/2.0;
    CGRect frame = CGRectMake(x, y, width, height);
    return frame;
}
@end
