//
//  BaseNavViewController.m
//  RYJWeather
//
//  Created by yijie on 2017/3/30.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "BaseNavViewController.h"

@interface BaseNavViewController ()<UINavigationBarDelegate>

@end

@implementation BaseNavViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18],
                                               NSForegroundColorAttributeName:[UIColor blackColor]};
    self.navigationBar.backItem.backBarButtonItem.image = [UIImage imageNamed:@"nav_back_icon"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle{
    UIViewController *topViewController = self.topViewController;
    return [topViewController preferredStatusBarStyle];
}

@end
