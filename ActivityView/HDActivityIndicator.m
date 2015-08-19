//
//  HDActivityIndicator.m
//  ActivityView
//
//  Created by yanshu on 15/8/19.
//  Copyright (c) 2015年 yanshu. All rights reserved.
//

#import "HDActivityIndicator.h"

@interface HDActivityIndicator ()
@property CALayer *lineLayer;
@end

@implementation HDActivityIndicator

- (void)startAnimating
{
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    replicatorLayer.frame = self.bounds;
    replicatorLayer.position = CGPointMake(0, 0);
    NSInteger numOfDot = 15;
    replicatorLayer.instanceCount = numOfDot;
    CGFloat angle = (M_PI * 2) / numOfDot;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    replicatorLayer.instanceDelay = 1.5 / numOfDot;
    [self.layer addSublayer:replicatorLayer];
    
    [self addCyclingLineAnimationLayerAtLayer:replicatorLayer withTintColor:[UIColor orangeColor] size:self.frame.size];
    
}
- (void)addCyclingLineAnimationLayerAtLayer:(CALayer *)layer withTintColor:(UIColor *)color size:(CGSize)size{
    self.lineLayer = [CALayer layer];
    self.lineLayer.bounds = CGRectMake(0, 0, 3, size.width/6);
    self.lineLayer.position = CGPointMake(size.width/2, 5);
    self.lineLayer.backgroundColor = color.CGColor;
    self.lineLayer.opacity = 0.9;
    self.lineLayer.cornerRadius = 1.5;
    self.lineLayer.shouldRasterize = YES;
    self.lineLayer.rasterizationScale = [UIScreen mainScreen].scale;
    
    [layer addSublayer:self.lineLayer];
    
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animation1.fromValue = @0;
    animation1.toValue = @0.9;
    animation1.duration = 1.5;
    animation1.repeatCount = CGFLOAT_MAX;
    
    
    [self.lineLayer addAnimation:animation1 forKey:@"animation"];
}
- (void)stopAnimating
{
    [self.lineLayer removeAnimationForKey:@"animation"];
}
@end
