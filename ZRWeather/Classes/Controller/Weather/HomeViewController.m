//
//  HomeViewController.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"
#import "DailyWeather+CoreDataClass.h"
#import "Location+CoreDataClass.h"
#import "LocationModel.h"
#import "DailyWeatherModel.h"
#import "NowWeather.h"
#import "NowWeatherView.h"
#import "HomeWeatherTableViewCell.h"
#import "WeatherHistoryViewController.h"

@interface HomeViewController ()<UIScrollViewDelegate>{
    CGFloat contentOffSetX;
}

@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIView *containerView;
@property (nonatomic,weak) NowWeatherView *nowWeatherView;
@property (nonatomic,weak) UITableView *tableView;
@property (nonatomic,weak) UILabel *reminderLB;

@property (nonatomic,strong) HomeViewModel *homeViewModel;
@property (nonatomic,strong) LocationModel *locationModel;

@property (nonatomic,strong) TableViewDelegate *tDel;
@property (nonatomic,strong) TableViewDataSource *tDataSource;

@property (nonatomic,strong) NSMutableArray *dailyWeatherArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"苏州";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.homeViewModel getNowWeatherWithLocation:@"suzhou"];
    [self.homeViewModel getDailyWeatherWithLocation:@"suzhou"];
    
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
}

- (void)configSubiews{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
 
    [self.nowWeatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.containerView.mas_top);
        make.left.equalTo(self.containerView.mas_left);
        make.width.mas_equalTo(SCREEN.width);
        make.height.mas_equalTo(120);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(- SCREEN.height + 64 + 120);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.containerView);
        make.top.equalTo(self.nowWeatherView.mas_bottom).offset(10);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(-40);
    }];
    
    [self.reminderLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.containerView);
        make.top.equalTo(self.tableView.mas_bottom).offset(5);
        make.bottom.equalTo(self.containerView.mas_bottom).offset(-5);
    }];
}

- (void)bindViewModel{
    @weakify(self);
    [self.homeViewModel.nowWeatherSub subscribeNext:^(id x) {
        @strongify(self);
        if ([x isKindOfClass:[NSArray class]]) {
            NSDictionary *param = [[x firstObject] objectForKey:@"location"];
            LocationModel *locationModel = [LocationModel mj_objectWithKeyValues:param];
            self.locationModel = locationModel;
            [kCoreDataManager insertLocation:kAppDelegate.persistentContainer.viewContext LocationModel:locationModel];
            
            [self.nowWeatherView configDataWithNowWeather:[NowWeather mj_objectWithKeyValues:[[x firstObject] objectForKey:@"now"]]];
            
        }else if ([x isKindOfClass:[NSString class]]){
            [SVProgressHUD showErrorWithStatus:x];
        }
    } error:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    
    [self.homeViewModel.dailyWeatherSub subscribeNext:^(id x) {
        @strongify(self);
        if ([x isKindOfClass:[NSArray class]]) {
            NSArray *results = (NSArray *)x;
            if (results.count > 0) {
                [self.dailyWeatherArr addObjectsFromArray: [DailyWeatherModel mj_objectArrayWithKeyValuesArray:[[results firstObject] objectForKey:@"daily"]]];
                [kCoreDataManager insertDailyWeather:kAppDelegate.persistentContainer.viewContext WithResult:[self.dailyWeatherArr copy] locId:self.locationModel.locationId locName:self.locationModel.name];
            }
            [self.tableView reloadData];
        }else if ([x isKindOfClass:[NSString class]]){
            [SVProgressHUD showErrorWithStatus:x];
        }
    } error:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    //监听拖拽的长度
    [[self rac_signalForSelector:@selector(scrollViewDidScroll:) fromProtocol:@protocol(UIScrollViewDelegate)] subscribeNext:^(RACTuple * x) {
        @strongify(self);
        self -> contentOffSetX = ((UIScrollView *)x.first).mj_offsetX;
    }];
    //当结束拖拽的时候  判断 拖拽的contentOffSetX
    [[self rac_signalForSelector:@selector(scrollViewDidEndDragging:willDecelerate:) fromProtocol:@protocol(UIScrollViewDelegate)] subscribeNext:^(RACTuple * xb) {
        if (contentOffSetX > 60) {
            @strongify(self);
            WeatherHistoryViewController *weatherHistoryVC = [[WeatherHistoryViewController alloc] init];
            [self.navigationController pushViewController:weatherHistoryVC animated:YES];
        }
    }];
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleDefault;
}

#pragma mark --- Lazy load

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc]init];
        scrollView.pagingEnabled = YES;
        scrollView.alwaysBounceHorizontal = YES;
        [self.view addSubview:(_scrollView = scrollView)];
    }
    return _scrollView;
}

- (UIView *)containerView{
    if (!_containerView) {
        UIView *containerView = [[UIView alloc]init];
        [self.scrollView addSubview:(_containerView = containerView)];
    }
    return _containerView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc]init];
        tableView.dataSource = self.tDataSource;
        tableView.delegate = self.tDel;
        [tableView registerClass:[HomeWeatherTableViewCell class] forCellReuseIdentifier:[HomeWeatherTableViewCell identifier]];
        tableView.scrollEnabled = NO;
        [self.containerView addSubview:(_tableView = tableView)];
    }
    return _tableView;
}

- (UILabel *)reminderLB {
    if (!_reminderLB) {
        UILabel *reminderLB = [[UILabel alloc]init];
        reminderLB.text = @"Slider left to load history ~ ";
        [self.containerView addSubview:(_reminderLB = reminderLB)];
    }
    return _reminderLB;
}

- (HomeViewModel *)homeViewModel{
    if (!_homeViewModel) {
        _homeViewModel = [[HomeViewModel alloc]init];
    }
    return _homeViewModel;
}

- (NowWeatherView *)nowWeatherView{
    if (!_nowWeatherView) {
        NowWeatherView *nowWeatherView = [[[NSBundle mainBundle] loadNibNamed:@"NoWeatherView" owner:self options:nil] firstObject];
        [self.containerView addSubview:(_nowWeatherView = nowWeatherView)];
    }
    return _nowWeatherView;
}

- (TableViewDelegate *)tDel {
    if (!_tDel) {
        _tDel = [[TableViewDelegate alloc]initWithRowHeight:^CGFloat(NSIndexPath *indexPath) {
            return 140;
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
        _tDataSource = [[TableViewDataSource alloc]initWithData:self.dailyWeatherArr cellIdentifier:[HomeWeatherTableViewCell identifier] isGroup:NO ConfigTableViewCellBlock:^(HomeWeatherTableViewCell *  cell, DailyWeatherModel * item, NSIndexPath * indexPath) {
            [cell configUIWithModel:item];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }];
    }
    return _tDataSource;
}

- (NSMutableArray *)dailyWeatherArr {
    if (!_dailyWeatherArr) {
        _dailyWeatherArr = [NSMutableArray array];
    }
    return _dailyWeatherArr;
}

@end
