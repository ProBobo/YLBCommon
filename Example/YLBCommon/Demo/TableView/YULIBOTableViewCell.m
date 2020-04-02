//
//  YULIBOTableViewCell.m
//  YLBCommon_Example
//
//  Created by yulibo on 2020/4/2.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import "YULIBOTableViewCell.h"

@interface YULIBOTableViewCell ()

@end

NSString * const kYULIBOTableViewCell = @"YULIBOTableViewCell";

@implementation YULIBOTableViewCell

//+ (instancetype)getWithTableView:(UITableView *)tableView {
//    id cell = [tableView dequeueReusableCellWithIdentifier:kYULIBOTableViewCell];
//    if (!cell) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
//    }
//    return cell;
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
