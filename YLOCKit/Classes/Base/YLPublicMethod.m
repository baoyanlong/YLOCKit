//
//  YLPublicMethod.m
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import "YLPublicMethod.h"

@implementation YLPublicMethod



/// 比较当前版本与服务端版本号
/// @param onlineVersion 服务端版本号
/// 返回值0-当前版本为最新版本 1-当前版本不是最新版本
+ (BOOL)compareVersionWithOnlineVersion:(NSString *)onlineVersion
{
    NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
    NSString *currentVersion = infoDict[@"CFBundleShortVersionString"];
    NSArray *onlineArr = [onlineVersion componentsSeparatedByString:@"."];
    NSArray *currentArr = [currentVersion componentsSeparatedByString:@"."];
    BOOL hasNewVersion = NO;
    NSInteger elementMaxCount = 0;
    if (onlineArr.count >= currentArr.count) {
        elementMaxCount = onlineArr.count;
    }else{
        elementMaxCount = currentArr.count;
    }
    for (int i = 0; i < elementMaxCount; i++) {
        NSString *currentNum = @"0";
        NSString *onlineNum = @"0";
        if (currentArr.count > i) {
            currentNum = currentArr[i];
        }
        if (onlineArr.count > i) {
            onlineNum = onlineArr[i];
        }
        if (onlineNum.integerValue < currentNum.integerValue) {
            hasNewVersion = NO;
            break;
        }else if(onlineNum.integerValue > currentNum.integerValue){
            hasNewVersion = YES;
            break;
        }
    }
    return hasNewVersion;
}
@end
