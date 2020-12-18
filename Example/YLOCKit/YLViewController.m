//
//  YLViewController.m
//  YLOCKit
//
//  Created by 674934875@qq.com on 12/16/2020.
//  Copyright (c) 2020 674934875@qq.com. All rights reserved.
//

#import "YLViewController.h"
#import <YLOCKit.h>

@interface YLViewController ()

@end

@implementation YLViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    BOOL aa = [YLPublicMethod compareVersionWithOnlineVersion:@"1.0.2"];
    self.view.backgroundColor = [UIColor redColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    [@"" isEqualToString:@""];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    yl_Log(@"hhhhhhhhhh")
    yl_LogFunc
}
@end
