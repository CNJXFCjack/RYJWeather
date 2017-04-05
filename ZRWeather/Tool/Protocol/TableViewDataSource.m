//
//  TableViewDataSource.m
//  RAC_Reward
//
//  Created by yijie on 2017/3/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "TableViewDataSource.h"

@interface TableViewDataSource()

@property (nonatomic,strong) NSArray *dataArr;
@property (nonatomic,copy)   NSString *cellIdentifier;
@property (nonatomic,copy)   ConfigTableViewCellBlock configBlock;
@property (nonatomic)        BOOL isGroup;

@end

@implementation TableViewDataSource

- (instancetype)initWithData:(NSArray *)data
              cellIdentifier:(NSString *)cellIdentifier
                     isGroup:(BOOL)isGroup
    ConfigTableViewCellBlock:(ConfigTableViewCellBlock)configBlock
{
    if (self = [super init]) {
        self.dataArr = data;
        self.cellIdentifier = cellIdentifier;
        self.configBlock = configBlock;
        self.isGroup = isGroup;        
    }
    return self;
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[(NSUInteger) _isGroup ? indexPath.section:indexPath.row];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _isGroup ? _dataArr.count : 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _isGroup ? 1 : _dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.cellIdentifier forIndexPath:indexPath];
    NSLog(@"thread:%@",[NSThread currentThread]);
    id item = [self itemAtIndexPath:indexPath];
    self.configBlock(cell, item ,indexPath);
    return cell;
}


@end
