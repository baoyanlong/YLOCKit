//
//  NSData+YLExtension.m
//  YLOCKit
//
//  Created by 包燕龙 on 2020/12/18.
//

#import "NSData+YLExtension.h"
#import "YLOCKit.h"

@implementation NSData (YLExtension)
// 根据情况压缩图片
+ (NSData *)yl_compressImageData:(UIImage *)image
{
    NSData *data=UIImageJPEGRepresentation(image, 1.0);
    yl_Log(@"原始data.length------%ld",data.length);
    if (data.length>1024 *1024*0.1) {
        if (data.length>10240*1024*3*0.1) {
            //3M以及以上
            data=UIImageJPEGRepresentation(image, 0.01);//压缩之后30k~
        }else if (data.length>1024*1024*3){
            //1M~3M
            data=UIImageJPEGRepresentation(image, 0.03);//压缩之后30k~100k
        }else if (data.length>5120*1024*0.1){
            //500k~1M
            data=UIImageJPEGRepresentation(image, 0.1);//压缩之后50k~100k
        }else if (data.length>2048*1024){
            //200k~500k
            data=UIImageJPEGRepresentation(image, 0.2);//压缩之后40k~100k
        }else{
            //100k~200k
            data=UIImageJPEGRepresentation(image, 0.5);//压缩之后50k~100k
        }
    }
    yl_Log(@"压缩后data.length------%ld",data.length);
    return data;
}
@end
