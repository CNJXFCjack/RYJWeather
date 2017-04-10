//
//  WeatherHistoryTableViewCell.m
//  ZRWeather
//
//  Created by yijie on 2017/4/6.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "WeatherHistoryTableViewCell.h"
#import "DailyWeather+CoreDataClass.h"

@interface WeatherHistoryTableViewCell()

@property (nonatomic,weak) UILabel *dateLB;
@property (nonatomic,weak) UILabel *highTemLB;
@property (nonatomic,weak) UILabel *lowTemLB;
@property (nonatomic,weak) UIImageView *weatherImg;

@property (nonatomic,weak) UIView *bordeView;

@end

@implementation WeatherHistoryTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutUI];
    }
    return self;
}

- (void)configUIWithModel:(DailyWeather *)dailyWeather {
    self.dateLB.text = [kDateFormatManager transformDateToWeek:dailyWeather.date
                                                    withFormat:@"yyyy-MM-dd"];
    
    self.lowTemLB.text = [NSString stringWithFormat:@"%@℃",dailyWeather.low];
    self.highTemLB.text = [NSString stringWithFormat:@"%@℃",dailyWeather.high];
    
    self.weatherImg.image = [UIImage imageNamed:[dailyWeather.code_day transformImgName]];
}

- (void) layoutUI {
    [self.dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(20);
    }];
    
    [self.lowTemLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_centerX).offset(-20);
    }];
    
    [self.highTemLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView.mas_centerX).offset(20);
    }];
    
    [self.weatherImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.height.width.mas_equalTo(40);
    }];
    
    [self.bordeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.left.equalTo(self.contentView);
        make.height.equalTo(@.5);
    }];
}

- (UILabel *)dateLB {
    if (!_dateLB) {
        UILabel *dateLB = [[UILabel alloc] init];
        dateLB.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        dateLB.textColor = [UIColor blackColor];
        [self.contentView addSubview:(_dateLB = dateLB)];
    }
    return _dateLB;
}

- (UILabel *)highTemLB {
    if (!_highTemLB) {
        UILabel *highTemLB = [[UILabel alloc] init];
        highTemLB.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        highTemLB.textColor = [UIColor blackColor];
        [self.contentView addSubview:(_highTemLB = highTemLB)];
    }
    return _highTemLB;
}

- (UILabel *)lowTemLB {
    if (!_lowTemLB) {
        UILabel *lowTemLB = [[UILabel alloc] init];
        lowTemLB.font = [UIFont fontWithName:@"Helvetica-Light" size:18];
        lowTemLB.textColor = [UIColor blackColor];
        [self.contentView addSubview:(_lowTemLB = lowTemLB)];
    }
    return _lowTemLB;
}

- (UIImageView *)weatherImg {
    if (!_weatherImg) {
        UIImageView *weatherImg = [[UIImageView alloc] init];
        [self.contentView addSubview:(_weatherImg = weatherImg)];
    }
    return _weatherImg;
}

- (UIView *)bordeView {
    if (!_bordeView) {
        UIView *borderView = [UIView new];
        borderView.backgroundColor = DEF_UIColorFromRGB(0xE5E5E5);
        [self.contentView addSubview:(_bordeView = borderView)];
    }
    return _bordeView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
