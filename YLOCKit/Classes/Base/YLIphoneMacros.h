//
//  YLIphoneMacros.h
//  Pods
//
//  Created by 包燕龙 on 2020/12/17.
//

#ifndef YLIphoneMacros_h
#define YLIphoneMacros_h

/********* 定义手机相关常用宏 **********/

//获取屏幕宽度与高度
#define yl_ScreenW  [UIScreen mainScreen].bounds.size.width
#define yl_ScreenH  [UIScreen mainScreen].bounds.size.height
// 屏幕中心点
#define yl_ScreenCenter   CGPointMake(yl_ScreenW / 2, yl_ScreenH / 2)
//根据6，7，8适配
#define yl_ScaleWidth(width) (width / 375.0) * yl_ScreenW
#define yl_ScaleHeight(height) (height / 667.0) * yl_ScreenH
#define yl_ScaleRatio yl_ScreenW / 375.0

//判断是否为X系列
#define yl_isIphoneX \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
//#define yl_StatusBarHeight        ([UIApplication sharedApplication].statusBarFrame.size.height)
//#define yl_isIphoneX ((yl_StatusBarHeight == 44) ? YES : NO)
//#define yl_isIphoneX (yl_ScreenH == 812.0)

// 状态栏高度
#define yl_StatusBarHeight        (yl_isIphoneX ? 44.f : 20.f)
// 导航栏高度
#define yl_NavigationBarHeight    44.f
// 状态栏+导航栏高度
#define yl_StatusBarAndNavigationBarHeight  (yl_isIphoneX ? 88.f : 64.f)
// Tabbar高度
#define yl_TabbarHeight     49.f
// Tabbar高度+安全域距离底部距离
#define yl_TabbarAndSafeBottomHeight   (yl_isIphoneX ? (49.f+34.f) : 49.f)
// 安全域距离顶部的距离
#define yl_SafeAreaTopHeight      (yl_isIphoneX ? 88.f : 64.f)
// 安全域距离底部的距离
#define yl_SafeAreaBottomHeight   (yl_isIphoneX ? 34.f : 0.f)
// 去除上下导航栏剩余中间视图高度
#define yl_ContentHeight           (yl_ScreenH - yl_SafeAreaTopHeight - yl_SafeAreaBottomHeight - yl_TabbarHeight)




#endif /* YLIphoneMacros_h */
