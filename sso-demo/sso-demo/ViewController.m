//
//  ViewController.m
//  sso-demo
//
//  Created by yaojunyu on 2018/9/25.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "ViewController.h"
#import "firstViewController.h"
#import "secondViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    self.navigationItem.title = @"111111";
    
    [self setupNavUI];
    [self setupUI];
}

- (void)setupNavUI{
    self.navigationItem.title = @"首页";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] init];
    backButtonItem.title = nil;
    self.navigationItem.backBarButtonItem = backButtonItem;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60)
                                                         forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    self.navigationController.navigationBar.barTintColor = [UIColor grayColor];
}

- (void)setupUI{
    UIButton *skipBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [skipBtn setTitle:@"跳转按钮" forState:UIControlStateNormal];
    [skipBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    skipBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    skipBtn.frame = CGRectMake(20, 100, 100, 30);
    [skipBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    skipBtn.tag = 101;
    skipBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:skipBtn];
    
    UIButton *firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [firstBtn setTitle:@"第一页" forState:UIControlStateNormal];
    [firstBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    firstBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    firstBtn.frame = CGRectMake(20, 150, 100, 30);
    [firstBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    firstBtn.tag = 102;
    firstBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:firstBtn];
    
    UIButton *secBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [secBtn setTitle:@"第二页" forState:UIControlStateNormal];
    [secBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    secBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    secBtn.frame = CGRectMake(20, 200, 100, 30);
    [secBtn addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    secBtn.tag = 103;
    secBtn.backgroundColor = [UIColor redColor];
    [self.view addSubview:secBtn];
    
}

- (void)buttonClick:(UIButton *)sender{
    NSURL *url;
    if(sender.tag == 102){
        firstViewController *first = [firstViewController new];
        [self.navigationController pushViewController:first animated:YES];
    }
    else if (sender.tag == 103){
        secondViewController *sec = [secondViewController new];
        [self.navigationController pushViewController:sec animated:YES];
    }
    else if (sender.tag == 101){
        url = [NSURL URLWithString:@"myapp://"];
        
        if ([[UIApplication sharedApplication] canOpenURL:url]) {
            
//            [[UIApplication sharedApplication] openURL:url options:@{} completionHandler:nil]; 10.0以后方法为了适配10.0以前统一用旧方法,可以吧参数拼接在URL里
            //此方法10.0以后过期
            [[UIApplication sharedApplication] openURL:url];
        }
        else{
            //appstore
            NSLog(@"未安装");
        }
    }

    
    
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    UIViewController *vc = segue.destinationViewController;
}


@end
