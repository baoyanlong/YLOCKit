//
//  UIColor+YLExtension.h
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (YLExtension)
//3ca4fd
+ (UIColor *)yl_colorWithHexString:(NSString *)color;
//从十六进制字符串获取颜色，
//color:支持@“#123456”、 @“0X123456”、 @“123456”三种格式
+ (UIColor *)yl_colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;
@end

NS_ASSUME_NONNULL_END
