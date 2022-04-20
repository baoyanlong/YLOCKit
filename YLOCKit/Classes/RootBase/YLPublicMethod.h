//
//  YLPublicMethod.h
//  YLKit_Example
//
//  Created by 包燕龙 on 2020/12/16.
//  Copyright © 2020 674934875@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLPublicMethod : NSObject
/// 比较本地版本与服务端版本号
/// @param onlineVersion 服务端版本号
/// 返回值0-当前版本为最新版本 1-当前版本不是最新版本
+ (BOOL)compareVersionWithOnlineVersion:(NSString *)onlineVersion;
@end

NS_ASSUME_NONNULL_END
