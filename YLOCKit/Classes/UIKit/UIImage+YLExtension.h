//
//  UIImage+YLExtension.h
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (YLExtension)
/**
 *  返回拉伸图片
 */
+ (UIImage *)yl_resizedImage:(NSString *)name;
/**
 *  用颜色返回一张图片
 */
+ (UIImage *)yl_imageWithColor:(UIColor*)color Alpha:(CGFloat)alpha;
/**
 *  带边框的图片
 *
 *  @param name        图片
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
+ (instancetype)yl_circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;


/**
 *  使用图像名创建图像视图
 *
 *  @param imageName 图像名称
 *
 *  @return UIImageView
 */
+ (instancetype)yl_imageViewWithImageName:(NSString *)imageName;

/**
 * 圆形图片
 */
- (UIImage *)yl_circleImage;

/// 压缩图片
+ (UIImage *)yl_compressImageWith:(UIImage *)image;

/// 压缩图片尺寸
+ (UIImage *)yl_imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

/// 截取图片的一部分
+ (UIImage *)yl_getImageFromImage:(UIImage *)bigImage newRect:(CGRect)newRect;
@end

NS_ASSUME_NONNULL_END
