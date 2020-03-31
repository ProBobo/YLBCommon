//
//  YULIBOHomeView.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOHomeView.h"
#import "YULIBOWithImageButton.h"
#import <YLBCommon/NSString+YLBAttribute.h>

@interface YULIBOHomeView ()

@property(nonatomic, weak) IBOutlet UIView *topBgView;
@property(nonatomic, weak) IBOutlet UIView *secondBgView;
@property(nonatomic, weak) IBOutlet YULIBOWithImageButton* iconButton;
@property(nonatomic, weak) IBOutlet UILabel *displayLabel;

@end

@implementation YULIBOHomeView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+ (instancetype)createView {
    YULIBOHomeView *currentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    return currentView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.topBgView.backgroundColor = YLBHexColor(0x2de7e2);
    [self.iconButton ylb_Set_View_Corner:CGSizeMake(self.iconButton.ylb_height/2.0, self.iconButton.ylb_height/2.0) corners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)];
    
    [self userAttributedText];
}

- (void)userAttributedText {
    NSDictionary *attributesPrice0 = @{NSFontAttributeName:[UIFont systemFontOfSize:21],//字号25
                                       NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attributesPrice1 = @{NSFontAttributeName:[UIFont systemFontOfSize:28],//字号28
                                       NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attributesPrice2 = @{NSFontAttributeName:[UIFont systemFontOfSize:15],//字号15
                                       NSForegroundColorAttributeName:[UIColor blackColor]};
    
    NSAttributedString *attributedString = [NSString attributedText:@[@"¥", @"2021", @" ≈ ¥12.49"]
                                                 attributeAttay:@[attributesPrice0, attributesPrice1, attributesPrice2]];
    UILabel *price = self.displayLabel;
    price.adjustsFontSizeToFitWidth = YES;
    price.attributedText = attributedString;
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(self.ylb_width / 2, 100) options:NSStringDrawingUsesLineFragmentOrigin context:nil];//此方法获取到的是自适应的Rect，而不是CGSize，最大Size值为CGSizeMake(self.width / 2, 100)
    rect = CGRectMake(0, 0, 100, 50);
    price.ylb_size = CGSizeMake(rect.size.width, rect.size.height);
}

@end
