//
//  NSString+YLExtension.h
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (YLExtension)
/**
 获取固定字体大小的字符串高度

 @param text 字符串
 @param fontSize 字符串字体大小
 @param width 文字宽度
 @return 高度值
 */
+ (CGFloat)yl_getStringHeightWithText:(NSString *)text fontSize:(CGFloat)fontSize viewWidth:(CGFloat)width;



/**
 获取有行间距固定字体大小的字符串高度

 @param str 字符串
 @param lineSpacing 行间距
 @param fontSize 字符串字体大小
 @param width 文字宽度
 @return 高度值
 */
+ (CGFloat)yl_getSpaceLabelHeight:(NSString*)str lineSpacing:(CGFloat)lineSpacing fontSize:(CGFloat)fontSize withWidth:(CGFloat)width;


/**
 根据时间戳获取日期

 @param timeInterval 时间戳
 @return 字符类型的日期
 */
+ (NSString *)yl_getTimeDateWithTimeInterval:(NSInteger )timeInterval;

/// 时间戳转换时间(yyyy-MM-dd)
+ (NSString *)yl_timeWithTimeIntervalString:(NSString *)timeString;

/// 时间戳转换时间(yyyy-MM-dd HH:mm:ss)
+ (NSString *)yl_timeWithTimeIntervalString2:(NSString *)timeString;

/// 将某个时间转化成 时间戳
+ (NSString *)yl_timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

/// json字符串转dic
+ (NSDictionary *)yl_dictionaryWithJsonString:(NSString *)jsonString;
/// 字典转json字符串方法
+ (NSString *)yl_convertToJsonData:(NSDictionary *)dict;
/// 去掉字符串数字里无效的0
+ (NSString *)yl_defuseInvalidZero:(NSString *)originalStr;
/// 格式化字符串 保留有效两位小数
+ (NSString *)yl_removeSuffixStr:(NSString *)numberStr;

/// 获取字符串宽度
+ (CGFloat)yl_widthForString:(NSString *)value fontSize:(CGFloat)fontSize andHeight:(CGFloat)height;

/// 十进制转十六进制
+ (NSString *)yl_getHexByInt:(long long int)tmpid;

/// 小写转大写
+ (NSString *)yl_stringToUpper:(NSString *)str;
@end

NS_ASSUME_NONNULL_END
