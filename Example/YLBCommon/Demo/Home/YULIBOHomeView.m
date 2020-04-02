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
#import <YLBCommon/UIView+YLBColor.h>

@interface YULIBOHomeView ()

@property(nonatomic, weak) IBOutlet UIView *topBgView;
@property(nonatomic, weak) IBOutlet UIView *secondBgView;
@property(nonatomic, strong) YULIBOWithImageButton* iconButton;
@property(nonatomic, weak) IBOutlet UILabel *displayLabel;


@property (nonatomic,strong)UILabel *label;
 
@property (nonatomic,strong)UIButton *btn;

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
    [self testColor];
}
- (YULIBOWithImageButton *)iconButton {
    if (!_iconButton) {
        _iconButton = [[YULIBOWithImageButton alloc] init];
        _iconButton.frame = CGRectMake(self.secondBgView.ylb_width - 80, 30, 80, 30);
        [_iconButton setImage:[UIImage imageNamed:@"emotion_01"] forState:UIControlStateNormal];
        [_iconButton setTitle:@"按钮" forState:UIControlStateNormal];
        _iconButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _iconButton.backgroundColor = UIColor.cyanColor;
        [self.secondBgView addSubview:_iconButton];
        
        UIView *gradualView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 200, 150)];
        gradualView.backgroundColor = UIColor.redColor;
        gradualView.ylb_y = YLBStatusBarHeight + YLBNavigationBarHeight + 50;
        
        NSArray *colors = @[(__bridge id)UIColor.cyanColor.CGColor,
                            (__bridge id)UIColor.lightGrayColor.CGColor
        ];
        [gradualView ylb_Set_Gradient_Color:colors startPoint:CGPointMake(0, 0) endPoint:CGPointMake(0, 1)];
        [gradualView ylb_Set_View_TopLeft_ArcCenter:CGPointMake(gradualView.ylb_height, gradualView.ylb_height) radius:gradualView.ylb_height];
        [self.secondBgView addSubview:gradualView];
    }
    return _iconButton;
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

- (void)testColor {
    
    CGFloat topSpace = CGRectGetMaxY(self.secondBgView.frame);
    /*方法1*/
    
    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, topSpace + 20, 400, 50)];
    testLabel.text = @"label上渐变方法1";
    testLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:testLabel];
    NSArray *testLabelColors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    [UIView ylbTextGradientview:testLabel bgView:self gradientColors:testLabelColors gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
    
    
    /*方法2*/
    _label=[[UILabel alloc]initWithFrame:CGRectMake(10, topSpace + 20 + 50 + 20, self.frame.size.width-20,50)];
    [self addSubview:_label];
    _label.text=@"label上渐变方法2";
    _label.textAlignment=NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:30];
    _label.textColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar_background"]];
    
    
    /*方法3*/
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(10, topSpace + 20 + 50 + 20 + 50 + 20, self.frame.size.width-20, 50)];
    [self addSubview:_btn];
    _btn.titleLabel.font=[UIFont systemFontOfSize:30];
    _btn.titleLabel.numberOfLines=0;
    [_btn setTitle:@"button上字体渐变色设置" forState:UIControlStateNormal];
    NSArray *btnColors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    [UIView ylbTextGradientControl:_btn bgView:self gradientColors:btnColors gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
}

@end
