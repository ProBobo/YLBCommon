//
//  YLBBaseTableViewController.h
//  YLBCommon_Example
//
//  Created by yulibo on 2020/3/23.
//  Copyright © 2020 余礼钵. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLBBaseTableViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong) UITableView *tableView;
- (UITableViewStyle)setUITableViewStyle:(UITableViewStyle)style;
- (void)setupBaseSubviews;
@end

NS_ASSUME_NONNULL_END
