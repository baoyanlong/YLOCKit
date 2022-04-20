//
//  YLSafeCheckUtil.m
//  YLOCKit
//
//  Created by 包燕龙 on 2022/4/19.
//

#import "YLSafeCheckUtil.h"
#import "YLConfusionConstant.h"
#import <sys/sysctl.h>
#import <dlfcn.h>
#import <sys/types.h>
#import <mach-o/dyld.h>

typedef int (*ptrace_ptr_t)(int _request, pid_t _pid, caddr_t _Nullable _addr, int _data);
#if !defined(PT_DENY_ATTACH)
#define PT_DENY_ATTACH 31
#endif

@implementation YLSafeCheckUtil

/// 检测gdb/lldb调试
/*
 //参数1：PT_DENY_ATTACH 表示当前进程不允许被附加
 //参数2：进程id，0就是本进程
 //参数3：地址，根据参数1而定，这里传0
 //数据4：数据，根据参数1而定，这里传0
 ptrace(PT_DENY_ATTACH, 0, 0, 0);
 说明：添加了Ptrace防护，那么lldb调试就会奔溃，
 正常开发的时候这很不友好，所以需要根据环境变量，在Debug环境下关闭Ptrace，Release环境下开启Ptrace防护。
 破解：拦截Ptrace函数
 */
+ (void)disableGdb {
#ifndef DEBUG
    void *handle = dlopen(0, RTLD_GLOBAL | RTLD_NOW);
    ptrace_ptr_t ptrace_ptr = dlsym(handle, CJConfusionCString("ptrace"));
    ptrace_ptr(PT_DENY_ATTACH, 0, 0, 0);
    dlclose(handle);
#endif
}

/// 检测是否被附加 Yes表示被附加了
+ (BOOL)isAttached {
    int name[4];  //里面放字节码。查询的信息
    name[0] = CTL_KERN; //内核查询
    name[1] = KERN_PROC; //查询进程
    name[2] = KERN_PROC_PID; //传递的参数是进程的ID
    name[3] = getpid(); //获取当前进程ID
    struct kinfo_proc info;  //接受查询结果的结构体
    size_t info_size = sizeof(info); //结构体大小
    if(sysctl(name,4, &info, &info_size, 0, 0)){
        NSLog(@"查询失败");
        return NO;
    }
    /*
    查询结果看info.kp_proc.p_flag 的第12位，如果为1，表示调试附加状态。
    info.kp_proc.p_flag & P_TRACED 即可获取第12位
    */
    return ((info.kp_proc.p_flag & P_TRACED) != 0);
}


/// 检测Debug状态
+ (void)disableDebugged {
#ifndef DEBUG
    int name[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PID, getpid()};
    struct kinfo_proc Kproc;
    size_t kproc_size = sizeof(Kproc);
    
    memset((void*)&Kproc, 0, kproc_size);
    
    if (sysctl(name, 4, &Kproc, &kproc_size, NULL, 0) == -1) {
        exit(-1);
    }
    if (Kproc.kp_proc.p_flag & P_TRACED) {
        exit(-1);
    }
#endif
}

/// 检查签名信息
+ (BOOL)validSignature {
    NSString *newPath = [[NSBundle mainBundle] resourcePath];
    NSDictionary *rootDic = [[NSDictionary alloc] initWithContentsOfFile:[newPath stringByAppendingString:YLConfusionNSString("/_CodeSignature/CodeResources")]];
    NSDictionary *fileDic = [rootDic objectForKey:YLConfusionNSString("files2")];
    NSDictionary *infoDic = [fileDic objectForKey:YLConfusionNSString("embedded.mobileprovision")];
    NSData *tempData = [infoDic objectForKey:YLConfusionNSString("hash")];
    NSString *hashStr = [tempData base64EncodedStringWithOptions:0];
    if (![YLProvisionHashAppStore isEqualToString:hashStr] && ![YLProvisionHashAdHoc isEqualToString:hashStr]) {
        NSLog(@"签名错误");
        return NO;
    }
    NSLog(@"签名正确");
    return YES;
}

/// 检查越狱状态
+ (BOOL)isJailbroken {
    //检查是否存在越狱常用文件
    NSArray *jailFilePaths = @[YLConfusionNSString("/Applications/Cydia.app"),
                               YLConfusionNSString("/Library/MobileSubstrate/MobileSubstrate.dylib"),
                               YLConfusionNSString("/bin/bash"),
                               YLConfusionNSString("/usr/sbin/sshd"),
                               YLConfusionNSString("/etc/apt")];
    for (NSString *filePath in jailFilePaths) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
            return YES;
        }
    }
    //检查是否安装了越狱工具Cydia
    if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:YLConfusionNSString("cydia://package/com.example.package")]]){
        return YES;
    }
    //检查是否有权限读取系统应用列表
    if ([[NSFileManager defaultManager] fileExistsAtPath:YLConfusionNSString("/User/Applications/")]){
        NSArray *applist = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:YLConfusionNSString("/User/Applications/") error:nil];
        NSLog(@"applist = %@",applist);
        return YES;
    }
    //检测当前程序运行的环境变量
    char *env = getenv(YLConfusionNSString("DYLD_INSERT_LIBRARIES"));
    if (env != NULL) {
        return YES;
    }
    NSLog(@"设备未越狱");
    return NO;
}

/// 检查代理状态
+ (BOOL)hasProxy {
    NSDictionary *proxySettings = CFBridgingRelease((__bridge CFTypeRef _Nullable)((__bridge NSDictionary *)CFNetworkCopySystemProxySettings()));
    NSArray *proxies = CFBridgingRelease((__bridge CFTypeRef _Nullable)((__bridge NSArray *)CFNetworkCopyProxiesForURL((__bridge CFURLRef)[NSURL URLWithString:YLConfusionNSString("http://www.google.com")], (__bridge CFDictionaryRef)proxySettings)));
    NSDictionary *settings = [proxies objectAtIndex:0];
    NSLog(@"host=%@", [settings objectForKey:(NSString *)kCFProxyHostNameKey]);
    NSLog(@"port=%@", [settings objectForKey:(NSString *)kCFProxyPortNumberKey]);
    NSLog(@"type=%@", [settings objectForKey:(NSString *)kCFProxyTypeKey]);
    if ([[settings objectForKey:(NSString *)kCFProxyTypeKey] isEqualToString:YLConfusionNSString("kCFProxyTypeNone")]) {
        NSLog(@"没有设置代理");
        return NO;
    } else {
        NSLog(@"设置了代理");
        return YES;
    }
}

/// 检查动态库
+ (BOOL)isInjected {
    // 获取加载image的数量
    int count = _dyld_image_count();
    if (count > 0) {
        // 遍历所有的image_name。判断是否有DynamicLibraries
        for (int i = 0; i < count; i++) {
            const char * dyld = _dyld_get_image_name(i);
            NSLog(@"动态库：%s", dyld);
            if (strstr(dyld, "DynamicLibraries")) {
                return YES;
            }
        }
    }
    return NO;
}


@end
