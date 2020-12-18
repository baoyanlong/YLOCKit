//
//  UIViewController+YLExtension.h
//  YLOCKit
//
//  Created by 包燕龙 on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (YLExtension)
/** 获取当前屏幕显示的viewcontroller */
+ (UIViewController *)yl_currentViewController;
@end

NS_ASSUME_NONNULL_END
