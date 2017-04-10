//
//  UIView+Line.m
//  91Job
//
//  Created by GK-Mac on 16/8/6.
//  Copyright © 2016年 HeinQi. All rights reserved.
//

#import "UIView+Line.h"

@implementation UIView (Line)

/**
 *  实线
 *
 *  param frame
 *
 *  return
 */
+ (instancetype)borderLineWithFrame:(CGRect)frame {
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = [UIColor colorWithRed:220/255.0f green:220/255.0f blue:220/255.0f alpha:1.0f];
    return view;
}

/**
 *  实线
 *
 *  param frame
 *  param color
 *
 *  return
 */
+ (instancetype)borderLineWithFrame:(CGRect)frame withcolor:(UIColor*)color{
    UIView *view = [[UIView alloc] initWithFrame:frame];
    view.backgroundColor = color;
    return view;
}

/**
 ** lineView:	   需要绘制成虚线的view
 ** lineLength:	 虚线的宽度
 ** lineSpacing:	虚线的间距
 ** lineColor:	  虚线的颜色
 **/
+ (void)drawDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor
{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    [shapeLayer setBounds:lineView.bounds];
    [shapeLayer setPosition:CGPointMake(CGRectGetWidth(lineView.frame) / 2, CGRectGetHeight(lineView.frame))];
    [shapeLayer setFillColor:[UIColor clearColor].CGColor];
    //  设置虚线颜色为blackColor
    [shapeLayer setStrokeColor:lineColor.CGColor];
    //  设置虚线宽度
    [shapeLayer setLineWidth:CGRectGetHeight(lineView.frame)];
    [shapeLayer setLineJoin:kCALineJoinRound];
    //  设置线宽，线间距
    [shapeLayer setLineDashPattern:[NSArray arrayWithObjects:[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing], nil]];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, CGRectGetWidth(lineView.frame), 0);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [lineView.layer addSublayer:shapeLayer];
}

/**
 *  对view的边框画成虚线
 *
 *  @param lineView    需要绘制成虚线的view
 *  @param lineLength  虚线的宽度
 *  @param lineSpacing 虚线的间距
 *  @param lineColor   虚线的颜色
 *
 *  return
 */
+ (void)drawBorderDashLine:(UIView *)lineView lineLength:(int)lineLength lineSpacing:(int)lineSpacing lineColor:(UIColor *)lineColor viewBounds:(CGRect)bounds{
    
    CAShapeLayer *border = [CAShapeLayer layer];
    border.strokeColor = lineColor.CGColor;
    border.fillColor = nil;
    border.path = [UIBezierPath bezierPathWithRect:bounds].CGPath;
    border.frame = lineView.bounds;
    border.lineWidth = 1.f;
    border.lineCap = @"square";
    //虚线的间距和长度
    border.lineDashPattern = @[[NSNumber numberWithInt:lineLength], [NSNumber numberWithInt:lineSpacing]];
    [lineView.layer addSublayer:border];
}


@end
