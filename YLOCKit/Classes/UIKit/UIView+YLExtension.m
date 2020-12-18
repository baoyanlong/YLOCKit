//
//  UIView+YLExtension.m
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import "UIView+YLExtension.h"

@implementation UIView (YLExtension)
- (void)setYl_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)yl_size
{
    return self.frame.size;
}

- (void)setYl_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setYl_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (void)setYl_x:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setYl_y:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setYl_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (void)setYl_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)yl_centerY
{
    return self.center.y;
}

- (CGFloat)yl_centerX
{
    return self.center.x;
}

- (CGFloat)yl_width
{
    return self.frame.size.width;
}

- (CGFloat)yl_height
{
    return self.frame.size.height;
}

- (CGFloat)yl_x
{
    return self.frame.origin.x;
}

- (CGFloat)yl_y
{
    return self.frame.origin.y;
}

- (CGFloat)yl_top
{
    return self.frame.origin.y;
}

- (void)setYl_top: (CGFloat) newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

- (CGFloat)yl_left
{
    return self.frame.origin.x;
}

- (void)setYl_left: (CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

- (CGFloat)yl_bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setYl_bottom: (CGFloat) newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

- (CGFloat)yl_right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setYl_right: (CGFloat)newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

// 获取导航控制器
- (UINavigationController * )yl_navigationController{
    UIResponder * next = [self nextResponder];
    while (next!=nil) {
        if([next isKindOfClass:[UINavigationController class]]){
            return (UINavigationController * )next;
        }
        next = [next nextResponder];
    }
    return nil;
}

//获取标签控制器
- (UITabBarController * )yl_tabBarController{
    UIResponder * next = [self nextResponder];
    while (next!=nil) {
        if([next isKindOfClass:[UITabBarController class]]){
            return (UITabBarController * )next;
        }
        next = [next nextResponder];
    }
    return nil;
}
// 获取view所在的viewController
- (UIViewController *)yl_viewController
{
    //获取当前view的superView对应的控制器
    UIResponder *next = [self nextResponder];
    do {
        if ([next isKindOfClass:[UIViewController class]]) {
            return (UIViewController *)next;
        }
        next = [next nextResponder];
    } while (next != nil);
    return nil;
    
}

/**
 根据view返回截图
 
 @param view 要截图的view
 @return 截图
 */
+ (UIImage *)yl_rendImageWithView:(UIView *)view{
    /*
    //      1.开始位图上下文
    UIGraphicsBeginImageContext(view.frame.size);
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了，关键就是第三个参数 [UIScreen mainScreen].scale。
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    //      2.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    3.截图
    [view.layer renderInContext:ctx];
    //    4.获取图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    //    5.关闭上下文
    UIGraphicsEndImageContext();
    return newImage;*/
    
    UIGraphicsBeginImageContextWithOptions(view.frame.size, YES, [UIScreen mainScreen].scale);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (void)yl_addGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor Frame:(CGRect)frame
{
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = frame;
    //设置开始和结束位置(设置渐变的方向)
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    gradient.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradient.locations = @[@(0), @(1.0f)];
    [self.layer insertSublayer:gradient atIndex:0];
}

/// 设置渐变色
/// @param startColor 起始颜色
/// @param endColor 终止颜色
/// @param frame 渐变范围
/// @param direction 渐变方向（0-横向 1-纵向）
- (void)yl_addGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor Frame:(CGRect)frame Direction:(NSInteger)direction
{
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = frame;
    //设置开始和结束位置(设置渐变的方向)
    if (direction == 0) {
        gradient.startPoint = CGPointMake(0, 0);
        gradient.endPoint = CGPointMake(0, 1);
    }else{
        gradient.startPoint = CGPointMake(0, 0);
        gradient.endPoint = CGPointMake(1, 0);
    }
    
    gradient.colors = @[(__bridge id)startColor.CGColor, (__bridge id)endColor.CGColor];
    gradient.locations = @[@(0), @(1.0f)];
    [self.layer insertSublayer:gradient atIndex:0];
}
@end
