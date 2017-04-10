//
//  WeatherHistoryViewModel.h
//  ZRWeather
//
//  Created by yijie on 2017/4/10.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "BaseViewModel.h"

@interface WeatherHistoryViewModel : BaseViewModel

@property (nonatomic,strong) RACSubject *historyListSub;
@property (nonatomic,strong) RACCommand *deleteHistory;

- (void)historyList;

@end
