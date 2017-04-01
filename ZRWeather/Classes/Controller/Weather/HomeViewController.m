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

@interface HomeViewController ()<UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView *scrollView;
@property (nonatomic,weak) UIView *containerView;

@property (nonatomic,strong) HomeViewModel *homeViewModel;
@property (nonatomic,strong) LocationModel *locationModel;

@property (nonatomic,weak) NowWeatherView *nowWeatherView;

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
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(64, 0, 0, 0));
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
                results = [DailyWeatherModel mj_objectArrayWithKeyValuesArray:[[results firstObject] objectForKey:@"daily"]];
                [kCoreDataManager insertDailyWeather:kAppDelegate.persistentContainer.viewContext WithResult:results locId:self.locationModel.locationId locName:self.locationModel.name];
            }
        }else if ([x isKindOfClass:[NSString class]]){
            [SVProgressHUD showErrorWithStatus:x];
        }
    } error:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
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
        scrollView.delegate = self;
        scrollView.pagingEnabled = YES;
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


@end
