//
//  secondViewController.m
//  sso-demo
//
//  Created by yaojunyu on 2018/9/25.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "secondViewController.h"

@interface secondViewController ()

@end

@implementation secondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"22222";
    
    UILabel *ipLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 200, 200, 150)];
    ipLabel.text = @"22222222";
    ipLabel.backgroundColor = [UIColor yellowColor];
    ipLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:ipLabel];
}


- (void)save{
    
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
