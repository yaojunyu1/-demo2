//
//  MFAuthLoginDMZJViewController.m
//  skipDemo2
//
//  Created by yaojunyu on 2018/9/29.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "MFAuthLoginDMZJViewController.h"

#define RGBA(R,G,B,A) [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:A]

@interface MFAuthLoginDMZJViewController ()

@end

@implementation MFAuthLoginDMZJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupNavUI];
    [self setupUI];
}

- (void)setupNavUI{
    self.navigationItem.title = @"原生授权请求登录页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : RGBA(51, 51, 51, 1)}];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = nil;
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
}

- (void)setupUI{
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
