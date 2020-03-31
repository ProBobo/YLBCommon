//
//  YULIBOButtonWithImageView.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/31.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOButtonWithImageView.h"
#import "YULIBOWithImageButton.h"

@interface YULIBOButtonWithImageView ()

@property(nonatomic, weak) IBOutlet UIView *topBgView;
@property(nonatomic, weak) IBOutlet YULIBOWithImageButton* iconButton;
@end

@implementation YULIBOButtonWithImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (instancetype)createView {
    YULIBOButtonWithImageView *currentView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
    return currentView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.topBgView.backgroundColor = YLBHexColor(0x2de7e2);
    [self.iconButton ylb_Set_View_Corner:CGSizeMake(self.iconButton.ylb_height/2.0, self.iconButton.ylb_height/2.0) corners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)];
}

@end
