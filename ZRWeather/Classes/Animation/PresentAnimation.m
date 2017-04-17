//
//  PresentAnimation.m
//  ZRWeather
//
//  Created by yijie on 2017/4/14.
//  Copyright © 2017年 heinqi. All rights reserved.
//

#import "PresentAnimation.h"

@implementation PresentAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.6;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
}

@end
