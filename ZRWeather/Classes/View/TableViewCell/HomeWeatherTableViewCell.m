//
//  HomeWeatherTableViewCell.m
//  ZRWeather
//
//  Created by yijie on 2017/4/2.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "HomeWeatherTableViewCell.h"

@interface HomeWeatherTableViewCell()

@property (nonatomic,weak) UILabel *dateLB;
@property (nonatomic,weak) UIImageView *weatherImg;
@property (nonatomic,weak) UILabel *highTemperatureLB;
@property (nonatomic,weak) UILabel *lowTemperatureLB;

@end

@implementation HomeWeatherTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (UILabel *)dateLB {
    if (!_dateLB) {
        UILabel *dateLB = [[UILabel alloc]init];
        
        [self.contentView addSubview:(_dateLB = dateLB)];
    }
    return _dateLB;
}

- (UIImageView *)weatherImg{
    if (!_weatherImg) {
        
    }
    return _weatherImg;
}

- (UILabel *)highTemperatureLB {
    if (!_highTemperatureLB) {
        UILabel *highTemperatureLB = [[UILabel alloc]init];
        
        [self.contentView addSubview:(_highTemperatureLB = highTemperatureLB)];
    }
    return _highTemperatureLB;
}

- (UILabel *)lowTemperatureLB {
    if (!_lowTemperatureLB) {
        UILabel *lowTemperatureLB = [[UILabel alloc]init];
        
        [self.contentView addSubview:(_lowTemperatureLB = lowTemperatureLB)];
    }
    return _lowTemperatureLB;
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
