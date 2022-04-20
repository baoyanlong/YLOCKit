//
//  YLConfusionConstant.h
//  YLOCKit
//
//  Created by 包燕龙 on 2022/4/19.
//

#ifndef CJConfusionConstant_h
#define CJConfusionConstant_h

#pragma mark --- StringParse

#define STRING_ENCRYPT_KEY 0x45
static inline NSString *SDAESKey(void) {
    
    unsigned char key[] = {
        ('a' ^ STRING_ENCRYPT_KEY),
        ('b' ^ STRING_ENCRYPT_KEY),
        ('c' ^ STRING_ENCRYPT_KEY),
        ('h' ^ STRING_ENCRYPT_KEY),
        ('e' ^ STRING_ENCRYPT_KEY),
        ('n' ^ STRING_ENCRYPT_KEY),
        ('y' ^ STRING_ENCRYPT_KEY),
        ('u' ^ STRING_ENCRYPT_KEY),
        ('\0' ^ STRING_ENCRYPT_KEY)
    };
    unsigned char *tem = key;
    while (((*tem) ^= STRING_ENCRYPT_KEY) != '\0') {
        tem++;
    }
    return [NSString stringWithUTF8String:(const char *)key];
}

static inline char *YLDecrtyptedString(char *cstring) {
    char *tmp = cstring;
    while(*tmp) {
        *tmp ^= 0xEF;
        tmp++;
    }
    return cstring;
}

// 字符串混淆加密和解密的宏开关
// #define YL_Confusion
#ifdef YL_Confusion
    #define YLConfusionNSString(string)    [NSString stringWithUTF8String:YLDecrtyptedString(string)]
    #define YLConfusionCString(string)     YLDecrtyptedString(string)
#else
    #define YLConfusionNSString(string)    @string
    #define YLConfusionCString(string)     string
#endif

// 校验值，可通过上一次打包获取
#define YLProvisionHashAppStore            YLConfusionNSString("EoE1OARnTTVDqLag/X4Y0us+b/M=")
#define YLProvisionHashAdHoc               YLConfusionNSString("nZmRn6D2pJIJ0X8RNN/rqUyvxx4=")


#endif /* YLConfusionConstant_h */

