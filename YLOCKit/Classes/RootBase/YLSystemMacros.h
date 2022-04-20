//
//  YLSystemMacros.h
//  Pods
//
//  Created by 包燕龙 on 2020/12/17.
//

#ifndef YLSystemMacros_h
#define YLSystemMacros_h

/********* 定义系统常用宏 **********/

// 日志打印
#ifdef DEBUG
#define yl_Log(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d]\n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#define yl_LogFunc  NSLog(@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d]\n",__FILE__, __func__, __LINE__);
#else
#define yl_Log(...);
#define yl_LogFunc ;
#endif



/**** 沙盒目录文件 ****/
//temp
#define yl_PathTemp NSTemporaryDirectory()
//Document
#define yl_PathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//Cache
#define yl_PathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

//字体名
#define yl_PF_MEDIUM @"PingFangSC-Medium"
#define yl_PF_REGULAR @"PingFangSC-Regular"
#define yl_PF_SEMIBOLD @"PingFangSC-Semibold"
//字体
#define yl_BoldSystemFont(FONTSIZE) [UIFont boldSystemFontOfSize:FONTSIZE]
#define yl_SystemFont(FONTSIZE)    [UIFont systemFontOfSize:FONTSIZE]
#define yl_Font(NAME, FONTSIZE)    [UIFont fontWithName:(NAME) size:(FONTSIZE)]



#endif /* YLSystemMacros_h */
