//
//  ViewController.m
//  skipDemo2
//
//  Created by yaojunyu on 2018/9/25.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "ViewController.h"
#import "MFTools.h"
#import "MFAuthLoginDMZJViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
    [self setupNavUI];
}

- (void)setupNavUI{
    self.navigationItem.title = @"首页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = nil;
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor lightGrayColor];
}

- (void)setupUI{
    UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [skipBtn setTitle:@"跳转首页" forState:UIControlStateNormal];
    [skipBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    skipBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    skipBtn.frame = CGRectMake(20, 100, 100, 30);
    [skipBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    skipBtn.tag = 101;
    skipBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:skipBtn];
    
    UIButton *firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [firstBtn setTitle:@"跳转详情页" forState:UIControlStateNormal];
    [firstBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    firstBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    firstBtn.frame = CGRectMake(20, 150, 100, 30);
    [firstBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    firstBtn.tag = 102;
    firstBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:firstBtn];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"三方app登录" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    loginBtn.frame = CGRectMake(20, 200, 100, 30);
    [loginBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    loginBtn.tag = 103;
    loginBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:loginBtn];
    
    UIButton *ssoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [ssoBtn setTitle:@"授权登录" forState:UIControlStateNormal];
    [ssoBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    ssoBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    ssoBtn.frame = CGRectMake(20, 250, 100, 30);
    [ssoBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    ssoBtn.tag = 104;
    ssoBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:ssoBtn];
    
    UIButton *versionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [versionBtn setTitle:@"强更按钮" forState:UIControlStateNormal];
    [versionBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    versionBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    versionBtn.frame = CGRectMake(20, 300, 100, 30);
    [versionBtn addTarget:self action:@selector(versionButtonClick) forControlEvents:UIControlEventTouchUpInside];
    versionBtn.tag = 104;
    versionBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:versionBtn];
    
    UIButton *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [recordBtn setTitle:@"上报按钮" forState:UIControlStateNormal];
    [recordBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    recordBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    recordBtn.frame = CGRectMake(150, 100, 100, 30);
    [recordBtn addTarget:self action:@selector(recordBtnClick) forControlEvents:UIControlEventTouchUpInside];
    recordBtn.tag = 105;
    recordBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:recordBtn];
}

- (void)recordBtnClick{
    [[MFTools sharedInstance] mfRecordTrackEventWithTitle:@"111" capters:@"11" pages:@"1" userId:@"123456" token:@"123efvgt432"];
}

- (void)versionButtonClick{
    [[MFTools sharedInstance] mfUpdateClient];
}

- (void)buttonClick:(UIButton *)sender{

    NSURL *url;
    if(sender.tag == 101){
        url = [NSURL URLWithString:@"yourapp://"];
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            [[UIApplication sharedApplication] openURL:url];
        }
    }
    else if (sender.tag == 102){
        if ([[MFTools sharedInstance] mfOpenDMZJDetailsPage]) {
            [[MFTools sharedInstance] mfOpenDMZJDetailsPage];
        }
        else{
            NSLog(@"未安装应用");
        }
    }
    else if (sender.tag == 103){
        MFAuthLoginDMZJViewController *vc = [MFAuthLoginDMZJViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (sender.tag == 104){
        if ([[MFTools sharedInstance] mfAuthorizedLoginDMZJ]) {
            [[MFTools sharedInstance] mfAuthorizedLoginDMZJ];
        }
        else{
            MFAuthLoginDMZJViewController *vc = [MFAuthLoginDMZJViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }

}


@end
