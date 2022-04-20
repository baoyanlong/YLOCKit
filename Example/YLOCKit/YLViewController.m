//
//  YLViewController.m
//  YLOCKit
//
//  Created by 674934875@qq.com on 12/16/2020.
//  Copyright (c) 2020 674934875@qq.com. All rights reserved.
//

#import "YLViewController.h"
//*********** 安全工具测试  ***********/
#import "YLSafeCheckUtil.h"
#import "YLIPAddressUtils.h"

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 安全工具测试
    [self testSafeMethods];
}

//*********** 安全工具测试  ***********/
- (void)testSafeMethods {
    // 检测gdb/lldb调试
    [YLSafeCheckUtil disableGdb];
    
    //
    [YLSafeCheckUtil disableDebugged];
    
    BOOL _hasProxy = [YLSafeCheckUtil hasProxy];
    
    //
    BOOL _isJailbroken = [YLSafeCheckUtil isJailbroken];
    
    BOOL _validSignature = [YLSafeCheckUtil validSignature];
    
    NSLog(@"_hasProxy = %d,_isJailbroken = %d,_validSignature = %d",_hasProxy, _isJailbroken, _validSignature);
    
    NSString *ip = [YLIPAddressUtils getDeviceIPAddress];
    NSLog(@"ip = %@", ip);
}


@end
