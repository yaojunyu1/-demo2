//
//  ViewController.m
//  skipDemo2
//
//  Created by yaojunyu on 2018/9/25.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "ViewController.h"
#import "MFTools.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupUI];
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
    [firstBtn setTitle:@"跳转第一页" forState:UIControlStateNormal];
    [firstBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    firstBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    firstBtn.frame = CGRectMake(20, 150, 100, 30);
    [firstBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    firstBtn.tag = 102;
    firstBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:firstBtn];
    
    UIButton *secBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [secBtn setTitle:@"跳转第二页" forState:UIControlStateNormal];
    [secBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    secBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    secBtn.frame = CGRectMake(20, 200, 100, 30);
    [secBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    secBtn.tag = 103;
    secBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:secBtn];
    
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
        url = [NSURL URLWithString:@"ssodemo://"];
    }
    else if (sender.tag == 102){
        url = [NSURL URLWithString:@"ssodemo://first"];
    }
    else if (sender.tag == 103){
        url = [NSURL URLWithString:@"ssodemo://second"];
    }
    else if (sender.tag == 104){
        url = [NSURL URLWithString:@"ssodemo://login"];
    }
    
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        
        [[UIApplication sharedApplication] openURL:url];
        
    }
    else{
        NSLog(@"未安装");
    }
}


@end
