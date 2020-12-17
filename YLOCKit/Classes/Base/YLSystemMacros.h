//
//  YLSystemMacros.h
//  Pods
//
//  Created by 包燕龙 on 2020/12/17.
//

#ifndef YLSystemMacros_h
#define YLSystemMacros_h

/********* 定义系统常用宏 **********/

// 日志打印详细
#ifdef DEBUG
# define yl_Log(fmt, ...) NSLog((@"[文件名:%s]\n" "[函数名:%s]\n" "[行号:%d] \n" fmt), __FILE__, __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
# define yl_Log(...);
#endif

// 打印函数
#ifdef DEBUG
# define yl_LogFunc(fmt) NSLog((@"[函数名:%s]\n" fmt),  __FUNCTION__);
#else
# define yl_LogFunc();


/**** 沙盒目录文件 ****/
//temp
#define yl_PathTemp NSTemporaryDirectory()
//Document
#define yl_PathDocument [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//Cache
#define yl_PathCache [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]



#endif



#endif /* YLSystemMacros_h */
