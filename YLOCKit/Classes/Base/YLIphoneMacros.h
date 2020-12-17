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
//根据6，7，8适配
#define yl_ScaleWidth(width) (width / 375.0) * SCREEN_WIDTH
#define yl_ScaleHeight(height) (height / 667.0) * SCREENH_HEIGHT

//判断是否为X系列
#define  yl_isIPHONE_X \
({BOOL isPhoneX = NO;\
if (@available(iOS 11.0, *)) {\
isPhoneX = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;\
}\
//#define yl_STATUSBAR_HEIGHT ([UIApplication sharedApplication].statusBarFrame.size.height)
//#define yl_IS_iPhoneX ((yl_STATUSBAR_HEIGHT == 44) ? YES : NO)

// 状态栏高度
#define yl_StatusBarHeight        (yl_isIPHONE_X ? 44.f : 20.f)
// 顶部导航栏高度
#define yl_NavigationBarHeight    44.f
// 顶部安全距离
#define yl_SafeAreaTopHeight      (yl_isIPHONE_X ? 88.f : 64.f)
// 底部安全距离
#define yl_SafeAreaBottomHeight   (yl_isIPHONE_X ? 34.f : 0.f)
// Tabbar高度
#define yl_TabbarHeight           49.f

// 去除上下导航栏剩余中间视图高度
#define yl_ContentHeight           (yl_ScreenH - yl_SafeAreaTopHeight - yl_SafeAreaBottomHeight - yl_TabbarHeight)


#endif /* YLIphoneMacros_h */
