//
//  UIButton+YLExtension.h
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, YLKButtonEdgeInsetsStyle) {
    YLButtonEdgeInsetsStyleTop, // image在上，label在下
    YLButtonEdgeInsetsStyleLeft, // image在左，label在右
    YLButtonEdgeInsetsStyleBottom, // image在下，label在上
    YLButtonEdgeInsetsStyleRight // image在右，label在左
};
NS_ASSUME_NONNULL_BEGIN

@interface UIButton (YLExtension)
/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)yl_layoutButtonWithEdgeInsetsStyle:(YLKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;

- (void)show;

- (void)hide;
@end

NS_ASSUME_NONNULL_END
