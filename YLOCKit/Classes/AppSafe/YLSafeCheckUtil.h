//
//  YLSafeCheckUtil.h
//  YLOCKit
//
//  Created by 包燕龙 on 2022/4/19.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLSafeCheckUtil : NSObject

/// 检测gdb/lldb调试
+ (void)disableGdb;

/// 检测Debug状态
+ (void)disableDebugged;

/// 检查签名信息
+ (BOOL)validSignature;

/// 检查越狱状态
+ (BOOL)isJailbroken;

/// 检查代理状态
+ (BOOL)hasProxy;

/// 检查动态库注入
+ (BOOL)isInjected;

@end

NS_ASSUME_NONNULL_END
