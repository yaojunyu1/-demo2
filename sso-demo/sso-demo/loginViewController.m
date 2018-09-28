//
//  loginViewController.m
//  sso-demo
//
//  Created by yaojunyu on 2018/9/26.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "loginViewController.h"

@interface loginViewController ()

@end

@implementation loginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"授权登录";
    
    UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [skipBtn setTitle:@"点击授权登录" forState:UIControlStateNormal];
    [skipBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    skipBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    skipBtn.frame = CGRectMake(20, 100, 100, 30);
    [skipBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    skipBtn.tag = 101;
    skipBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:skipBtn];
}

- (void)buttonClick:(UIButton *)button{
    NSURL *url = [NSURL URLWithString:@"skipdemo://"];
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
    else{
        //appstore
        NSLog(@"未安装");
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
