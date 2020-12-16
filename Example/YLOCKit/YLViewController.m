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
    [YLPublicMethod compareVersionWithOnlineVersion:@"1.0.2"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
