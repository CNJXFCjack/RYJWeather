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
#import "HomeWeatherTableViewCell.h"
#import "WeatherHistoryViewController.h"
#import "DismissAnimation.h"
#import "PresentAnimation.h"
#import "NowWeatherView.h"

@interface HomeViewController ()<UIScrollViewDelegate,UIViewControllerTransitioningDelegate>{
    CGFloat contentOffSetY;
}

@property (nonatomic,weak) UIScrollView     *   scrollView;
@property (nonatomic,weak) UIView           *   container;
@property (nonatomic,weak) NowWeatherView   *   nowWeatherView;


@property (nonatomic,strong) HomeViewModel *homeViewModel;
@property (nonatomic,strong) LocationModel *locationModel;

@property (nonatomic,strong) TableViewDelegate *tDel;
@property (nonatomic,strong) TableViewDataSource *tDataSource;

@property (nonatomic,strong) NSMutableArray *dailyWeatherArr;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.homeViewModel getNowWeatherWithLocation:@"suzhou"];
    [self.homeViewModel getDailyWeatherWithLocation:@"suzhou"];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    NSLog(@"%@",NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES));
}


- (void)configSubiews{
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.container mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scrollView);
        make.width.equalTo(self.scrollView);
    }];
    
    [self.nowWeatherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.container);
        make.height.mas_equalTo(SCREEN.height);
    }];
    
}

- (void)bindViewModel{
    @weakify(self);
    //获取当前天气
    [self.homeViewModel.nowWeatherSub subscribeNext:^(id x) {
        @strongify(self);
        if ([x isKindOfClass:[NSArray class]]) {
            NSDictionary *param = [[x firstObject] objectForKey:@"location"];
            LocationModel *locationModel = [LocationModel mj_objectWithKeyValues:param];
            self.locationModel = locationModel;
            
            NSDictionary *nowWeatherParam = [[x firstObject] objectForKey:@"now"];
            NowWeather *nowWeather = [NowWeather mj_objectWithKeyValues:nowWeatherParam];
            [self.nowWeatherView configureData:nowWeather location:@"苏州"];
            
            [kCoreDataManager insertLocation:kAppDelegate.persistentContainer.viewContext
                               LocationModel:locationModel];
            
        }else if ([x isKindOfClass:[NSString class]]){
            [SVProgressHUD showErrorWithStatus:x];
        }
    } error:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    
    //获取未来三天天气
    [self.homeViewModel.dailyWeatherSub subscribeNext:^(id x) {
        @strongify(self);
        if ([x isKindOfClass:[NSArray class]]) {
            NSArray *results = (NSArray *)x;
            if (results.count > 0) {
                [self.dailyWeatherArr addObjectsFromArray: [DailyWeatherModel mj_objectArrayWithKeyValuesArray:[[results firstObject] objectForKey:@"daily"]]];
                [kCoreDataManager insertDailyWeather:kAppDelegate.persistentContainer.viewContext
                                          WithResult:[self.dailyWeatherArr copy]
                                               locId:self.locationModel.locationId
                                             locName:self.locationModel.name];
            }

        }else if ([x isKindOfClass:[NSString class]]){
            [SVProgressHUD showErrorWithStatus:x];
        }
    } error:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
    
    //监听拖拽的长度
    [[self rac_signalForSelector:@selector(scrollViewDidScroll:) fromProtocol:@protocol(UIScrollViewDelegate)] subscribeNext:^(RACTuple * x) {
        @strongify(self);
        self -> contentOffSetY = ((UIScrollView *)x.first).mj_offsetY;
    }];
    
    //当结束拖拽的时候  判断 拖拽的contentOffSetX
    [[self rac_signalForSelector:@selector(scrollViewDidEndDragging:willDecelerate:) fromProtocol:@protocol(UIScrollViewDelegate)] subscribeNext:^(RACTuple * xb) {
        if (contentOffSetY > 50) {
            @strongify(self);
            WeatherHistoryViewController *weatherHistoryVC = [[WeatherHistoryViewController alloc] init];
            [weatherHistoryVC.dismissSub subscribeNext:^(WeatherHistoryViewController * x) {
                [x dismissViewControllerAnimated:YES completion:nil];
            }];
            weatherHistoryVC.transitioningDelegate = self;
            weatherHistoryVC.location = @"苏州";
            [self presentViewController:weatherHistoryVC animated:YES completion:nil];
        }
    }];
    
    self.scrollView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

#pragma mark --- UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source {
    return [PresentAnimation new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    return [DismissAnimation new];
}

#pragma mark --- Lazy load

- (UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc]init];
        scrollView.backgroundColor = [UIColor redColor];
        scrollView.alwaysBounceVertical = YES;
        [self.view addSubview:(_scrollView = scrollView)];
    }
    return _scrollView;
}

- (UIView *)container{
    if (!_container) {
        UIView *container = [[UIView alloc]init];

        [self.scrollView addSubview:(_container = container)];
    }
    return _container;
}

- (NowWeatherView *)nowWeatherView {
    if (!_nowWeatherView) {
        NowWeatherView *nowWeatherView = [[NowWeatherView alloc] init];
        nowWeatherView.backgroundColor = [UIColor purpleColor];
        [self.container addSubview:nowWeatherView];
    }
    return _nowWeatherView;
}

- (HomeViewModel *)homeViewModel{
    if (!_homeViewModel) {
        _homeViewModel = [[HomeViewModel alloc]init];
    }
    return _homeViewModel;
}

- (NSMutableArray *)dailyWeatherArr {
    if (!_dailyWeatherArr) {
        _dailyWeatherArr = [NSMutableArray array];
    }
    return _dailyWeatherArr;
}

@end
