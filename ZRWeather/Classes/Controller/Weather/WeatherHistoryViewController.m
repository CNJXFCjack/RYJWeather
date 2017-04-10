//
//  WeatherHistoryViewController.m
//  ZRWeather
//
//  Created by yijie on 2017/4/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "WeatherHistoryViewController.h"
#import "WeatherHistoryTableViewCell.h"
#import "DailyWeather+CoreDataClass.h"
#import "WeatherHistoryViewModel.h"

@interface WeatherHistoryViewController ()

@property (nonatomic,weak) UITableView *tableView;

@property (nonatomic,strong) TableViewDelegate *tDel;
@property (nonatomic,strong) TableViewDataSource *tDataSource;

@property (nonatomic,strong) NSMutableArray *dailyWeatherArr;
@property (nonatomic,strong) WeatherHistoryViewModel *weatherHistoryViewModel;

@end

@implementation WeatherHistoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Weather History";
    self.view.backgroundColor = [UIColor whiteColor];
    //拉取历史数据
    [self.weatherHistoryViewModel historyList];
}

- (void)bindViewModel {
    [self.weatherHistoryViewModel.historyListSub subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
    //执行删除操作
    [self.weatherHistoryViewModel.deleteHistory.executionSignals.switchToLatest subscribeNext:^(id x) {
        
    } error:^(NSError *error) {
        
    }];
}

- (void)configSubiews {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    self.tableView.tableFooterView = [UIView borderLineWithFrame:CGRectMake(0, 0, SCREEN.width, 0.5) withcolor:DEF_UIColorFromRGB(0xe5e5e5)];
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
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:(_tableView = tableView)];
    }
    return _tableView;
}

- (TableViewDelegate *)tDel {
    if (!_tDel) {
        _tDel = [[TableViewDelegate alloc] initWithRowHeight:^CGFloat(NSIndexPath *indexPath) {
            return 90.0f;
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
        _tDataSource = [[TableViewDataSource alloc] initWithData:self.dailyWeatherArr cellIdentifier:[WeatherHistoryTableViewCell identifier] isGroup:NO ConfigTableViewCellBlock:^(WeatherHistoryTableViewCell * cell, DailyWeather * item, NSIndexPath * indexPath) {
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            [cell configUIWithModel:item];
        }];
    }
    return _tDataSource;
}

- (NSMutableArray *)dailyWeatherArr {
    if (!_dailyWeatherArr) {
        _dailyWeatherArr = [NSMutableArray arrayWithArray:[kCoreDataManager fetchDailyWeather:kAppDelegate.persistentContainer.viewContext]];
    }
    return _dailyWeatherArr;
}

- (WeatherHistoryViewModel *)weatherHistoryViewModel {
    if (!_weatherHistoryViewModel) {
        _weatherHistoryViewModel = [[WeatherHistoryViewModel alloc] init];
    }
    return _weatherHistoryViewModel;
}

@end
