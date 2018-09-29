//
//  AppDelegate.m
//  sso-demo
//
//  Created by yaojunyu on 2018/9/25.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "secondViewController.h"
#import "firstViewController.h"
#import "loginViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    ViewController *rvc = [[ViewController alloc] init];
    self.window.backgroundColor = [UIColor whiteColor];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rvc];
    
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options{
    NSString *urlStr = url.absoluteString;
    //导航控制器
    UINavigationController *navi = (UINavigationController *)self.window.rootViewController;
    //避免连续跳转时页面叠加
//    [navi popToRootViewControllerAnimated:NO];
    //判断跳转不同页面
    if ([urlStr hasPrefix:@"yourapp://detail"]){
        secondViewController *sec = [[secondViewController alloc] init];;
        [navi pushViewController:sec animated:YES];
    }
    else if ([urlStr hasPrefix:@"yourapp://login"]){
        loginViewController *login = [[loginViewController alloc] init];;
        [navi pushViewController:login animated:YES];
    }
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"传过来的参数是"
                                                    message:urlStr
                                                   delegate:self
                                          cancelButtonTitle:@"取消"
                                          otherButtonTitles:nil, nil];
    [alert show];

    
    return YES;
}

@end
