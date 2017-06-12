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
    return 0.8;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    [containerView addSubview:toVC.view];
    
    CGRect finalFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalFrame, 0, SCREEN.height);
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] delay:0 usingSpringWithDamping:0.8 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        toVC.view.frame = finalFrame;
        
    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
}

@end
