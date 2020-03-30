//
//  YULIBOViewController.m
//  YLBCommon
//
//  Created by ProBobo on 03/19/2020.
//  Copyright (c) 2020 ProBobo. All rights reserved.
//

#import "YULIBOViewController.h"
#import <YLBCommon/YLBCommon.h>
#import <YLBCommon/YLBImaginaryLine.h>
#import <YLBProUI/YLBProUI.h>
@interface YULIBOViewController ()
@property(nonatomic, strong) NSMutableArray *dataArray;
@end

static NSString * const kNormalCell = @"kNormalCell";

@implementation YULIBOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    YLBDLog(@"statusBar = %f, navBarHeight = %d, tabbarHeigt = %d \n",YLBStatusBarHeight, YLBNavigationBarHeight, YLBTabBarHeight);
    YLBDLog(@"ScreenSize = (%f,%f)", YLB_SCREEN_WIDTH, YLB_SCREEN_HEIGHT);
    
    self.tableView.ylb_y = YLBStatusBarHeight;
    self.tableView.ylb_height = self.view.ylb_height - (YLBStatusBarHeight);
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kNormalCell];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [@[
            @"虚线"
        ] mutableCopy];
    }
    return _dataArray;
}

- (UITableViewStyle)getUITableViewStyle {
    return UITableViewStylePlain;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kNormalCell];
    cell.textLabel.text = [self.dataArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *selectString = [self.dataArray objectAtIndex:indexPath.row];
    if ([selectString isEqualToString:@"虚线"]) {
        YLBImaginaryLine *line = [[YLBImaginaryLine alloc] initWithFrame:CGRectMake(0, 0, self.view.ylb_width, 100)];
        [line ylb_becomeCenterInSuperView:self.view];
        YLBAlertView *alertView = [YLBAlertView createAlertView];
        [alertView showView:line alignment:YLBAlertViewAlignmentCenter];
    }
}
@end
