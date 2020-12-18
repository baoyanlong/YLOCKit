//
//  NSData+YLExtension.h
//  YLOCKit
//
//  Created by 包燕龙 on 2020/12/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (YLExtension)
/// 根据情况压缩图片(小程序分享图片 < 124k)
+ (NSData *)yl_compressImageData:(UIImage *)image;
@end

NS_ASSUME_NONNULL_END
