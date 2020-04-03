//
//  YULIBOColorLabel.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/3.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOColorLabel.h"

@implementation YULIBOColorLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSArray *)getColors {
    [super getColors];
    NSArray *colors = @[(id)UIColor.blackColor.CGColor,(id)UIColor.greenColor.CGColor];
    return colors;
}

@end
