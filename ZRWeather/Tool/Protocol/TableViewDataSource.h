//
//  TableViewDataSource.h
//  RAC_Reward
//
//  Created by yijie on 2017/3/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

typedef void(^ConfigTableViewCellBlock)(id cell,id item,id indexPath);
typedef void(^EditCellBlock)(UITableViewCellEditingStyle editingStyle,NSIndexPath *indexPath);

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TableViewDataSource : NSObject<UITableViewDataSource>

- (instancetype)initWithData:(NSArray *)data
              cellIdentifier:(NSString *)cellIdentifier
                     isGroup:(BOOL)isGroup
    ConfigTableViewCellBlock:(ConfigTableViewCellBlock)configBlock;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic,assign) BOOL canEdit;
@property (nonatomic,copy) EditCellBlock editCellBlock;

@end
