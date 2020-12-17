//
//  YLAppMacros.h
//  Pods
//
//  Created by 包燕龙 on 2020/12/17.
//

#ifndef YLAppMacros_h
#define YLAppMacros_h

/********* 定义项目相关常用宏 **********/
//app版本号
#define yl_AppVersion  (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]
//app Build版本号
#define yl_AppBuild   (NSString *)[[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
//系统版本号（string）
#define yl_PhoneVersion     [[UIDevice currentDevice] systemVersion]
//系统版本号（float）
#define yl_PhoneVersionValue [yl_PhoneVersion floatValue]
//检测是否是竖屏状态
#define yl_IsPortrait ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait || [UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)



/**** 数据判空 ****/
//字符串是否为空
#define yl_IsEmptyStr(str) ([str isKindOfClass:[NSNull class]] || str == nil || [str length] < 1 || [str isEqualToString:@""] ? YES : NO )
//数组是否为空
#define yl_IsEmptyArr(array) (array == nil || [array isKindOfClass:[NSNull class]] || array.count == 0)
//字典是否为空
#define yl_IsEmptyDic(dic) (dic == nil || [dic isKindOfClass:[NSNull class]] || dic.allKeys == 0)
//是否是空对象
#define yl_IsEmptyObj(_object) (_object == nil \
|| [_object isKindOfClass:[NSNull class]] \
|| ([_object respondsToSelector:@selector(length)] && [(NSData *)_object length] == 0) \
|| ([_object respondsToSelector:@selector(count)] && [(NSArray *)_object count] == 0))


/**** 常用缩写 ****/
#define yl_Application            [UIApplication sharedApplication]
#define yl_KeyWindow              [UIApplication sharedApplication].keyWindow
#define yl_AppDelegate            [UIApplication sharedApplication].delegate
#define yl_UserDefaults           [NSUserDefaults standardUserDefaults]
#define yl_NotifCenter            [NSNotificationCenter defaultCenter]


/**** 其他 ****/
//弱引用
#define yl_Weak __weak typeof(self) weakSelf = self;
#define yl_WeakSelf(type)  __weak typeof(type) weak##type = type;
//强引用
#define yl_StrongSelf(type) __strong typeof(type) type = weak##type;


//角度转换弧度
#define yl_DegreesToRadian(x) (M_PI * (x) / 180.0)
//弧度转换角度
#define yl_RadianToDegrees(radian) (radian*180.0)/(M_PI)

//block判空回调
#define yl_BlockNotEmpt(block, ...)  if (block) { block(__VA_ARGS__); }



#endif /* YLAppMacros_h */
