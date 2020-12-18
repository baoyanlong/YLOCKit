//
//  UIView+YLExtension.h
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (YLExtension)
@property (nonatomic, assign) CGSize yl_size;
@property (nonatomic, assign) CGFloat yl_width;
@property (nonatomic, assign) CGFloat yl_height;
@property (nonatomic, assign) CGFloat yl_x;
@property (nonatomic, assign) CGFloat yl_y;
@property (nonatomic, assign) CGFloat yl_centerX;
@property (nonatomic, assign) CGFloat yl_centerY;

@property CGFloat yl_top;
@property CGFloat yl_left;

@property CGFloat yl_bottom;
@property CGFloat yl_right;

/// 获取导航控制器
- (UINavigationController * )yl_navigationController;
/// 获取标签控制器
- (UITabBarController * )yl_tabBarController;
/// 获取view所在的viewController
- (UIViewController *)yl_viewController;
/// 返回一张view的截图
+ (UIImage *)yl_rendImageWithView:(UIView *)view;

/**
*  设置渐变色（横向）
*
*  @param startColor 起始颜色
*  @param endColor   终止颜色
*  @param frame  渐变范围
*/
- (void)yl_addGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor Frame:(CGRect)frame;


/// 设置渐变色
/// @param startColor 起始颜色
/// @param endColor 终止颜色
/// @param frame 渐变范围
/// @param direction 渐变方向（0-横向 1-纵向）
- (void)yl_addGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor Frame:(CGRect)frame Direction:(NSInteger)direction;
@end

NS_ASSUME_NONNULL_END
