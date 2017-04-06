//
//  TableViewDelegate.m
//  RAC_Reward
//
//  Created by yijie on 2017/3/8.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "TableViewDelegate.h"

@interface TableViewDelegate()

@property (nonatomic,copy) ConfigRowHeight rowHeightHandle;
@property (nonatomic,copy) ConfigHeadHeight headHeightHandle;
@property (nonatomic,copy) ConfigFootHeight footHeighttHandle;

@end

@implementation TableViewDelegate

- (instancetype)initWithRowHeight:(ConfigRowHeight)rowHeight
                       HeadHeight:(ConfigHeadHeight)headHeight
                       FootHeight:(ConfigFootHeight)foorHeight{
    if (self = [super init]) {
        self.rowHeightHandle = rowHeight;
        self.headHeightHandle = headHeight;
        self.footHeighttHandle = foorHeight;
    }
    return self;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.didSelectHandle) {
        self.didSelectHandle(tableView,indexPath);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return [[UIView alloc]init];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *footer = [[UIView alloc]init];
    footer.backgroundColor = [UIColor whiteColor];
    return footer;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (self.rowHeightHandle(indexPath)==0) ? 44:self.rowHeightHandle(indexPath);
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return self.headHeightHandle(section);
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return self.footHeighttHandle(section);
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.willDisplayCellHandle) {
        self.willDisplayCellHandle(tableView,cell,indexPath);
    }
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.didScrollHandle) {
        self.didScrollHandle(scrollView);
    }
}

@end
