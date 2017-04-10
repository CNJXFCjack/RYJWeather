//
//  HomeWeatherTableViewCell.m
//  ZRWeather
//
//  Created by yijie on 2017/4/2.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "HomeWeatherTableViewCell.h"
#import "DailyWeatherModel.h"
@interface HomeWeatherTableViewCell()

@property (nonatomic,weak) UILabel *dateLB;
@property (nonatomic,weak) UIImageView *dayWeatherImg;
@property (nonatomic,weak) UIImageView *nightWeatherImg;
@property (nonatomic,weak) UILabel *temperatureLB;
@property (nonatomic,weak) UILabel *dayWeatherLB;
@property (nonatomic,weak) UILabel *nightWeatherLB;
@property (nonatomic,weak) UILabel *windDirectionLB;
@property (nonatomic,weak) UILabel *windDirectionDegreeLB;
@property (nonatomic,weak) UILabel *windScaleLB;
@property (nonatomic,weak) UILabel *windSpeedLB;

@property (nonatomic,weak) UILabel *dayLB;
@property (nonatomic,weak) UILabel *nightLB;

@property (nonatomic,weak) UIView *borderView;

@end

@implementation HomeWeatherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self layoutUI];
    }
    return self;
}

- (void)configUIWithModel:(DailyWeatherModel *)dailyWeatherModel{
    self.dateLB.text = [NSString stringWithFormat:@"Date :%@",dailyWeatherModel.date];
    self.dayWeatherImg.image = [UIImage imageNamed:[dailyWeatherModel.code_day transformImgName]];
    self.nightWeatherImg.image = [UIImage imageNamed:[dailyWeatherModel.code_night transformImgName]];
    self.temperatureLB.text = [NSString stringWithFormat:@"%@℃ ~ %@℃",dailyWeatherModel.high,dailyWeatherModel.low];
    self.dayWeatherLB.text = dailyWeatherModel.text_day;
    self.nightWeatherLB.text = dailyWeatherModel.text_night;
    self.windDirectionLB.text = [NSString stringWithFormat:@"风向 : %@",dailyWeatherModel.wind_direction];
    self.windDirectionDegreeLB.text = [NSString stringWithFormat:@"角度 : %@",dailyWeatherModel.wind_direction_degree];
    self.windScaleLB.text = [NSString stringWithFormat:@"风级 : %@",dailyWeatherModel.wind_scale];
    self.windSpeedLB.text = [NSString stringWithFormat:@"风速 : %@m/s",dailyWeatherModel.wind_speed];
}

- (void)layoutUI {
    
    [self.dateLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(20);
        make.top.equalTo(self.contentView).offset(10);
    }];
    
    [self.dayLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(24);
        make.top.equalTo(self.dateLB.mas_bottom).offset(25);
    }];
    
    [self.dayWeatherImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(60);
        make.centerY.equalTo(self.dayLB.mas_centerY);
        make.height.width.mas_equalTo(30);
    }];
    
    [self.dayWeatherLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dayWeatherImg.mas_right).offset(10);
        make.centerY.equalTo(self.dayWeatherImg);
    }];
    
    [self.nightLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(24);
        make.top.equalTo(self.dayLB.mas_bottom).offset(25);
    }];
    
    [self.nightWeatherImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.dayWeatherImg);
        make.centerY.equalTo(self.nightLB.mas_centerY);
        make.height.width.mas_equalTo(30);
    }];
    
    [self.nightWeatherLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nightWeatherImg.mas_right).offset(10);
        make.centerY.equalTo(self.nightWeatherImg);
    }];
    
    [self.temperatureLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.dateLB);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
    }];
    
    [self.windDirectionLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.temperatureLB.mas_left).offset(-20);
        make.top.equalTo(self.temperatureLB.mas_bottom).offset(10);
    }];
    
    [self.windDirectionDegreeLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.windDirectionLB);
        make.top.equalTo(self.windDirectionLB.mas_bottom).offset(10);
    }];
    
    [self.windScaleLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.windDirectionLB);
        make.top.equalTo(self.windDirectionDegreeLB.mas_bottom).offset(10);
    }];
    
    [self.windSpeedLB mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.windDirectionLB);
        make.top.equalTo(self.windScaleLB.mas_bottom).offset(10);
    }];
    
    [self.borderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.equalTo(self.contentView);
        make.height.mas_equalTo(0.5);
    }];
}

- (UILabel *)dateLB {
    if (!_dateLB) {
        UILabel *dateLB = [[UILabel alloc]init];
        dateLB.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:(_dateLB = dateLB)];
    }
    return _dateLB;
}

- (UIImageView *)dayWeatherImg{
    if (!_dayWeatherImg) {
        UIImageView *dayWeatherImg = [[UIImageView alloc]init];
        [self.contentView addSubview:(_dayWeatherImg = dayWeatherImg)];
    }
    return _dayWeatherImg;
}

- (UIImageView *)nightWeatherImg{
    if (!_nightWeatherImg) {
        UIImageView *nightWeatherImg = [[UIImageView alloc]init];
        [self.contentView addSubview:(_nightWeatherImg = nightWeatherImg)];
    }
    return _nightWeatherImg;
}

- (UILabel *)temperatureLB {
    if (!_temperatureLB) {
        UILabel *temperatureLB = [[UILabel alloc]init];
        temperatureLB.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:(_temperatureLB = temperatureLB)];
    }
    return _temperatureLB;
}

- (UILabel *)dayWeatherLB {
    if (!_dayWeatherLB) {
        UILabel *dayWeatherLB = [[UILabel alloc]init];
        dayWeatherLB.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:(_dayWeatherLB = dayWeatherLB)];
    }
    return _dayWeatherLB;
}

- (UILabel *)nightWeatherLB {
    if (!_nightWeatherLB) {
        UILabel *nightWeatherLB = [[UILabel alloc]init];
        nightWeatherLB.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:(_nightWeatherLB = nightWeatherLB)];
    }
    return _nightWeatherLB;
}

- (UILabel *)windDirectionLB {
    if (!_windDirectionLB) {
        UILabel *windDirectionLB = [[UILabel alloc]init];
        windDirectionLB.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:(_windDirectionLB = windDirectionLB)];
    }
    return _windDirectionLB;
}

- (UILabel *)windDirectionDegreeLB {
    if (!_windDirectionDegreeLB) {
        UILabel *windDirectionDegreeLB = [[UILabel alloc]init];
        windDirectionDegreeLB.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:(_windDirectionDegreeLB = windDirectionDegreeLB)];
    }
    return _windDirectionDegreeLB;
}

- (UILabel *)windScaleLB {
    if (!_windScaleLB) {
        UILabel *windScaleLB = [[UILabel alloc]init];
        windScaleLB.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:(_windScaleLB = windScaleLB)];
    }
    return _windScaleLB;
}

- (UILabel *)windSpeedLB {
    if (!_windSpeedLB) {
        UILabel *windSpeedLB = [[UILabel alloc]init];
        windSpeedLB.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:(_windSpeedLB = windSpeedLB)];
    }
    return _windSpeedLB;
}

- (UILabel *)dayLB {
    if (!_dayLB) {
        UILabel *dayLB = [[UILabel alloc]init];
        dayLB.text = @"Day";
        dayLB.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:(_dayLB = dayLB)];
    }
    return _dayLB;
}

- (UILabel *)nightLB {
    if (!_nightLB) {
        UILabel *nightLB = [[UILabel alloc]init];
        nightLB.text = @"Night";
        nightLB.font = [UIFont systemFontOfSize:13];
        [self.contentView addSubview:(_nightLB = nightLB)];
    }
    return _nightLB;
}

- (UIView *)borderView {
    if (!_borderView) {
        UIView *borderView = [UIView new];
        borderView.backgroundColor = DEF_UIColorFromRGB(0xE5E5E5);
        [self.contentView addSubview:(_borderView = borderView)];
    }
    return _borderView;
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
