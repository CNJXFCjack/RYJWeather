//
//  WeatherHistoryViewController.m
//  ZRWeather
//
//  Created by yijie on 2017/4/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "WeatherHistoryViewController.h"
#import "WeatherHistoryTableViewCell.h"
@interface WeatherHistoryViewController ()

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) TableViewDelegate *tDel;
@property (nonatomic,strong) TableViewDataSource *tDataSource;

@property (nonatomic,strong) NSMutableArray *dailyWeatherArr;

@end

@implementation WeatherHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Weather History";
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- Lazy load

- (UITableView *)tableView {
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]init];
        tableView.delegate = self.tDel;
        tableView.dataSource = self.tDataSource;
        [tableView registerClass:[WeatherHistoryTableViewCell class] forCellReuseIdentifier:[WeatherHistoryTableViewCell identifier]];
        [self.view addSubview:(_tableView = tableView)];
    }
    return _tableView;
}

- (TableViewDelegate *)tDel {
    if (!_tDel) {
        _tDel = [[TableViewDelegate alloc] initWithRowHeight:^CGFloat(NSIndexPath *indexPath) {
            return 100.0f;
        } HeadHeight:^CGFloat(NSInteger section) {
            return 0.001f;
        } FootHeight:^CGFloat(NSInteger section) {
            return 0.001f;
        }];
    }
    return _tDel;
}

- (TableViewDataSource *)tDataSource {
    if (!_tDataSource) {
        _tDataSource = [[TableViewDataSource alloc] initWithData:self.dailyWeatherArr cellIdentifier:[WeatherHistoryTableViewCell identifier] isGroup:NO ConfigTableViewCellBlock:^(WeatherHistoryTableViewCell * cell, DailyWeatherModel * item, NSIndexPath * indexPath) {
            [cell configUIWithModel:item];
        }];
    }
    return _tDataSource;
}

@end
