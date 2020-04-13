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
#import <YLBCommon/UIView+YLBCreateImage.h>

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
    UIImage *bgColorImg = [self getGradientColorImageWithView:self.displayLabel];
    NSDictionary *attributesPrice0 = @{NSFontAttributeName:[UIFont systemFontOfSize:21],//字号25
                                       NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attributesPrice1 = @{NSFontAttributeName:[UIFont systemFontOfSize:28],//字号28
                                       NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attributesPrice2 = @{NSFontAttributeName:[UIFont systemFontOfSize:15],//字号15
                                       NSForegroundColorAttributeName:[UIColor colorWithPatternImage:bgColorImg]};
    
    NSAttributedString *attributedString = [NSString ylb_attributedStringWithStringArray:@[@"¥", @"2021", @" ≈ ¥12.49"]
                                                 attributeArray:@[attributesPrice0, attributesPrice1, attributesPrice2]];
    UILabel *price = self.displayLabel;
//    price.adjustsFontSizeToFitWidth = YES;
    price.attributedText = attributedString;
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(self.ylb_width / 2, 100) options:NSStringDrawingUsesLineFragmentOrigin context:nil];//此方法获取到的是自适应的Rect，而不是CGSize，最大Size值为CGSizeMake(self.width / 2, 100)
//    rect = CGRectMake(0, 0, 100, 50);
    price.ylb_size = CGSizeMake(rect.size.width, rect.size.height);
    
    UILabel *testSizeLabel = [[UILabel alloc] init];
    testSizeLabel.font = [UIFont systemFontOfSize:12];
    NSString *text = @"测试字符串宽高";
    CGSize firstSize = [text ylb_stringSize:testSizeLabel.font];
    CGSize secondSize = [text ylb_sizeWithSringFont:testSizeLabel.font];
    YLBDLog(@"firstSize = %@",NSStringFromCGSize(firstSize));
    YLBDLog(@"secondSize = %@",NSStringFromCGSize(secondSize));
}

- (void)testColor {
    
    CGFloat topSpace = CGRectGetMaxY(self.secondBgView.frame);
    /*方法1：最佳方案，不会产生bug*/
    UILabel* testLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, topSpace + 20, self.frame.size.width-20, 50)];
//    testLabel.frame = firstBgView.bounds;
    testLabel.textAlignment=NSTextAlignmentCenter;
    testLabel.text = @"label上渐变方法1";
    testLabel.font = [UIFont systemFontOfSize:30];
    [self addSubview:testLabel];
    
    //2.合成图片
    UIImage *bgImage = [self getGradientColorImageWithView:testLabel];
    //3.设置文字渐变色
    testLabel.textColor = [UIColor colorWithPatternImage:bgImage];
    
    
    /*方法2*/
    _label=[[UILabel alloc]initWithFrame:CGRectMake(10, topSpace + 20 + 50 + 20, self.frame.size.width-20,50)];
    [self addSubview:_label];
    _label.text=@"label上渐变方法2";
    _label.textAlignment=NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:30];
    _label.textColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navigationbar_background"]];
    
    
    /*方法3*/
    _btn=[[UIButton alloc]initWithFrame:CGRectMake(10, topSpace + 20 + (50 + 20)*2, self.frame.size.width-20, 50)];
    [self addSubview:_btn];
    _btn.titleLabel.font=[UIFont systemFontOfSize:30];
    _btn.titleLabel.numberOfLines=0;
    [_btn setTitle:@"button上字体渐变色设置" forState:UIControlStateNormal];
    NSArray *btnColors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    [UIView ylbTextGradientControl:_btn bgView:self gradientColors:btnColors gradientStartPoint:CGPointMake(0, 1) endPoint:CGPointMake(1, 1)];
    
    
    UILabel *_lable = [[UILabel alloc] init];
    _label.ylb_maxY = 9;
    _lable.textAlignment = NSTextAlignmentCenter;
    _lable.text = @"这样写更好理解";
    [self addSubview:_lable];
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(id)[UIColor redColor].CGColor, (id)[UIColor greenColor].CGColor, (id)[UIColor blueColor].CGColor];
    //gradientLayer.locations = @[@0, @0.5, @1];// 默认就是均匀分布
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(0, 1);
    gradientLayer.frame = CGRectMake(10, topSpace + 20 + (50 + 20)*3, self.frame.size.width-20, 50);
    _lable.frame = gradientLayer.bounds;//设置_lable的坐标
    //    _lable.layer.frame = gradientLayer.bounds;//和上面的代码一个效果
    gradientLayer.mask = _lable.layer;//可以理解为([gradientLayer addSubview:_lable])
    [self.layer addSublayer:gradientLayer];
    
    
    UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, topSpace + 20 + (50 + 20)*4, self.frame.size.width-20, 50)];
    colorLabel.textAlignment = NSTextAlignmentCenter;
    colorLabel.text = @"123进123进123进123进123进123进123进";
    [self addSubview:colorLabel];
    
    //2.合成图片
    UIImage *bgImage2 = [self getGradientColorImageWithView:colorLabel];
    //3.设置文字渐变色
    colorLabel.textColor = [UIColor colorWithPatternImage:bgImage2];
    
    [self setupIntroduceLabel];
}
- (void)setupIntroduceLabel {
    CGFloat topSpace = CGRectGetMaxY(self.secondBgView.frame);
    UILabel *introduceLabel = [[UILabel alloc] init];
    introduceLabel.frame = CGRectMake(10, topSpace + 20 + (50 + 20)*5, 140, 32);
    introduceLabel.numberOfLines = 3;
    NSString *introduceString1 = @"numberOfLines为3的Label，\n显示：";
    NSString *introduceString2 = @"300000数值";
    
    UIImage *bgColorImg = [self getGradientColorImageWithView:introduceLabel];
    NSDictionary *attributesPrice0 = @{NSFontAttributeName:[UIFont systemFontOfSize:10],//字号10
                                       NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *attributesPrice1 = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:15],//字号15
                                       NSForegroundColorAttributeName:[UIColor colorWithPatternImage:bgColorImg]};
    
    NSAttributedString *attributedString = [NSString ylb_attributedStringWithStringArray:@[introduceString1, introduceString2] attributeArray:@[attributesPrice0, attributesPrice1]];
    introduceLabel.attributedText = attributedString;
    
    CGRect rect = [attributedString boundingRectWithSize:CGSizeMake(140, 50) options:NSStringDrawingUsesLineFragmentOrigin context:nil];//此方法获取到的是自适应的Rect，而不是CGSize，最大Size值为CGSizeMake
    introduceLabel.ylb_size = CGSizeMake(rect.size.width, rect.size.height);
    
    [self addSubview:introduceLabel];
    
}
- (UIImage *)getGradientColorImageWithView:(UIView *)view {
    UIImage *bgImage;
    NSArray *colors = @[(id)YLBHexColor(0x00FFD5).CGColor, (id)YLBHexColor(0x2FBFFD).CGColor];
    CGPoint startPoint = CGPointMake(0, 0);
    CGPoint endPoint = CGPointMake(1, 1);
    bgImage = [UIView createGradientColorImageWithBounds:view.bounds
                                                  colors:colors
                                              startPoint:startPoint
                                                endPoint:endPoint];
    return bgImage;
}

@end
