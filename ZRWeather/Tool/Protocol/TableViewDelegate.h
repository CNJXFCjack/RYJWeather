//
//  TableViewDelegate.h
//  RAC_Reward
//
//  Created by yijie on 2017/3/8.
//  Copyright © 2017年 heinqi. All rights reserved.
//

typedef CGFloat(^ConfigRowHeight)(NSIndexPath *);
typedef CGFloat(^ConfigHeadHeight)(NSInteger);
typedef CGFloat(^ConfigFootHeight)(NSInteger);
typedef void(^TabeViewDidSelectHandle)(UITableView *,NSIndexPath *);
typedef void(^TableViewWillDisplayCellHandle)(UITableView *,UITableViewCell *,NSIndexPath *);

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewDelegate : NSObject<UITableViewDelegate>

- (instancetype)initWithRowHeight:(ConfigRowHeight)rowHeight
                       HeadHeight:(ConfigHeadHeight)headHeight
                       FootHeight:(ConfigFootHeight)foorHeight;

@property (nonatomic,copy) TabeViewDidSelectHandle didSelectHandle;
@property (nonatomic,copy) TableViewWillDisplayCellHandle willDisplayCellHandle;

@end
