//
//  WeatherHistoryViewModel.m
//  ZRWeather
//
//  Created by yijie on 2017/4/10.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "WeatherHistoryViewModel.h"

@implementation WeatherHistoryViewModel

- (instancetype)init {
    if (self = [super init]) {
        
        self.historyListSub = [RACSubject subject];
        self.deleteHistory = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSManagedObjectID * input) {
            return [self deleteDailyWeatherHistoryWithId:input];
        }];
        
    }
    return self;
}

- (void)historyList {
    [kCoreDataManager fetchDailyWeather:kAppDelegate.persistentContainer.viewContext block:^(BOOL success, NSArray *data, NSError *error) {
        if (success) {
            [self.historyListSub sendNext:data];
        }else {
            [self.historyListSub sendError:error];
        }
    }];
}

- (RACSignal *)deleteDailyWeatherHistoryWithId:(NSManagedObjectID *)objectId {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        
        [kCoreDataManager deleteDailyWeather:(DailyWeather *)[kAppDelegate.persistentContainer.viewContext objectWithID:objectId] context:kAppDelegate.persistentContainer.viewContext block:^(BOOL success, id data, NSError *error) {
            if (success) {
                [subscriber sendNext:@YES];
            }else {
                [subscriber sendNext:@NO];
                [SVProgressHUD showErrorWithStatus:error.localizedDescription];
            }
        }];
        
        return nil;
    }];
}

@end
