//
//  NSString+YLExtension.m
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import "NSString+YLExtension.h"
#import "YLOCKit.h"

@implementation NSString (YLExtension)
+ (CGFloat)yl_getStringHeightWithText:(NSString *)text fontSize:(CGFloat)fontSize viewWidth:(CGFloat)width {
    // 设置文字属性 要和label的一致
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    CGSize maxSize = CGSizeMake(width, MAXFLOAT);
    
    NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    
    // 计算文字占据的高度
    CGSize size = [text boundingRectWithSize:maxSize options:options attributes:attrs context:nil].size;
    
    // 当你是把获得的高度来布局控件的View的高度的时候.size转化为ceilf(size.height)。
    return  ceilf(size.height);
}

+ (CGFloat)yl_getSpaceLabelHeight:(NSString*)str lineSpacing:(CGFloat)lineSpacing fontSize:(CGFloat)fontSize withWidth:(CGFloat)width {
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    paraStyle.alignment = NSTextAlignmentLeft;
    
    paraStyle.lineSpacing = lineSpacing;
    
    paraStyle.hyphenationFactor = 1.0;
    
    paraStyle.firstLineHeadIndent = 0.0;
    
    paraStyle.paragraphSpacingBefore = 0.0;
    
    paraStyle.headIndent = 0;
    
    paraStyle.tailIndent = 0;
    //, NSKernAttributeName:@1.5f
    NSDictionary *dic = @{ NSFontAttributeName:[UIFont systemFontOfSize:fontSize], NSParagraphStyleAttributeName:paraStyle };
    CGSize size = [str boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:dic context:nil].size;
    
    return  ceilf(size.height);
}


+ (NSString *)yl_getTimeDateWithTimeInterval:(NSInteger )timeInterval
{
    NSInteger day = timeInterval/(60*60*24);
    NSInteger hour = (timeInterval-day*60*60*24)/(60*60);
    NSInteger min = (timeInterval-day*60*60*24-hour*60*60)/60;
    NSInteger second = timeInterval-day*60*60*24-hour*60*60-min*60;
    NSString  *hourStr = hour >= 0 && hour < 10 ? [NSString stringWithFormat:@"0%ld时",(long)hour] : [NSString stringWithFormat:@"%ld时",(long)hour];
    NSString  *minStr = min >= 0 && min < 10 ? [NSString stringWithFormat:@"0%ld分",(long)min] : [NSString stringWithFormat:@"%ld分",(long)min];
    NSString  *secondStr = second >= 0 && second < 10 ? [NSString stringWithFormat:@"0%ld秒",(long)second] : [NSString stringWithFormat:@"%ld秒",(long)second];
    
    return [NSString stringWithFormat:@"%ld天 %@%@%@",(long)day,hourStr,minStr,secondStr];
}

/// 时间戳转换时间(yyyy-MM-dd)
+ (NSString *)yl_timeWithTimeIntervalString:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"beijing"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    // 秒值转化为秒（有时后台返回的时毫秒单位）
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/1000];
    
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/// 时间戳转换时间(yyyy-MM-dd HH:mm:ss)
+ (NSString *)yl_timeWithTimeIntervalString2:(NSString *)timeString
{
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    // 秒值转化为秒（有时后台返回的时毫秒单位）
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/1000];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
    
    
}

// 将某个时间转化成 时间戳
+ (NSString *)yl_timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    yl_Log(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return [NSString stringWithFormat:@"%ld",timeSp*1000];
}


+ (NSDictionary *)yl_dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableLeaves
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}


// 字典转json字符串方法
+ (NSString *)yl_convertToJsonData:(NSDictionary *)dict
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
        NSLog(@"%@",error);
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    //去掉字符串中的空格
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    //去掉字符串中的换行符
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}
/// 去掉字符串数字里无效的0
+ (NSString *)yl_defuseInvalidZero:(NSString *)originalStr
{
    
    if (yl_IsEmptyStr(originalStr)) {
        return 0;
    }
    return [NSString stringWithFormat:@"%@",@(originalStr.floatValue)];
}

/*
 1.如果有两位小数不为0则保留两位小数,eg: "0.23"
 2.如果有一位小数不为0则保留一位小数，否则显示整数, eg: "0.2" "0"
 也就是说，不能出现"0.20","0.00"这种情况。
 */
+ (NSString *)yl_removeSuffixStr:(NSString *)numberStr{
    if (yl_IsEmptyStr(numberStr)) {
        return @"0.00";
    }else{
        numberStr = [NSString stringWithFormat:@"%.2f",round([numberStr doubleValue]*100)/100];
//        numberStr = [NSString stringWithFormat:@"%.2f",numberStr.floatValue];
        
    }
    return numberStr;
    /*
    if (numberStr.length > 1) {
        
        if ([numberStr componentsSeparatedByString:@"."].count == 2) {
            NSString *last = [numberStr componentsSeparatedByString:@"."].lastObject;
            if ([last isEqualToString:@"00"]) {
                numberStr = [numberStr substringToIndex:numberStr.length - (last.length + 1)];
                return numberStr;
            }else{
                if ([[last substringFromIndex:last.length -1] isEqualToString:@"0"]) {
                    numberStr = [numberStr substringToIndex:numberStr.length - 1];
                    return numberStr;
                }
            }
        }
        return numberStr;
    }else{
        return @"0";
    }*/
}

// 获取字符串的宽度
+ (CGFloat)yl_widthForString:(NSString *)value fontSize:(CGFloat)fontSize andHeight:(CGFloat)height{
    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(CGFLOAT_MAX, height) lineBreakMode:NSLineBreakByWordWrapping];
    //此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
    return sizeToFit.width;
    
}

/**
 十进制转32进制

 @param tmpid 数据
 @return 结果
 */
+(NSString *)yl_getHexByInt:(long long int)tmpid
{
    NSString *nLetterValue;
    NSString *str =@"";
    long long int ttmpig;
    for (int i = 0; i<99; i++) {
        ttmpig=tmpid%32;
        tmpid=tmpid/32;
        switch (ttmpig)
        {
            case 10:
                nLetterValue =@"A";break;
            case 11:
                nLetterValue =@"B";break;
            case 12:
                nLetterValue =@"C";break;
            case 13:
                nLetterValue =@"D";break;
            case 14:
                nLetterValue =@"E";break;
            case 15:
                nLetterValue =@"F";break;
            case 16:
                nLetterValue =@"G";break;
            case 17:
                nLetterValue =@"H";break;
            case 18:
                nLetterValue =@"I";break;
            case 19:
                nLetterValue =@"J";break;
            case 20:
                nLetterValue =@"K";break;
            case 21:
                nLetterValue =@"L";break;
            case 22:
                nLetterValue =@"M";break;
            case 23:
                nLetterValue =@"N";break;
            case 24:
                nLetterValue =@"O";break;
            case 25:
                nLetterValue =@"P";break;
            case 26:
                nLetterValue =@"Q";break;
            case 27:
                nLetterValue =@"R";break;
            case 28:
                nLetterValue =@"S";break;
            case 29:
                nLetterValue =@"T";break;
            case 30:
                nLetterValue =@"U";break;
            case 31:
                nLetterValue =@"V";break;
            default:nLetterValue=[[NSString alloc]initWithFormat:@"%lli",ttmpig];
                
        }
        str = [nLetterValue stringByAppendingString:str];
        if (tmpid == 0) {
            break;
        }
        
    }
    return str;
}

// 小写转大写
+ (NSString *)yl_stringToUpper:(NSString *)str{
    for (NSInteger i = 0; i < str.length; i++) {
        if ([str characterAtIndex:i] >= 'a' & [str characterAtIndex:i] <= 'z') {
            char temp = [str characterAtIndex:i] - 32;
            NSRange range = NSMakeRange(i, 1);
            str = [str stringByReplacingCharactersInRange:range withString:[NSString stringWithFormat:@"%c",temp]];
        }
    }
    return str;
}
@end
