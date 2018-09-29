//
//  MFTools.h
//  skipDemo2
//
//  Created by yaojunyu on 2018/9/27.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MFTools : NSObject

+ (MFTools *)sharedInstance;


/**
 友盟激活

 @param launchOptions launchOptions
 */
- (void)mfCAnalyticeApplicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;


/**
 打点上报

 @param title 漫画名
 @param capters 章节
 @param pages 页数
 @param userId 用户id
 @param token token
 */
- (void)mfRecordTrackEventWithTitle:(NSString *)title capters:(NSString *)capters pages:(NSString *)pages userId:(NSString *)userId token:(NSString *)token;


/**
 强更生命周期,开启时页面跳转回来依旧提示强更

 @param application application
 */
- (void)mfApplicationWillEnterForeground:(UIApplication *)application;


/**
 调用强更接口
 */
- (void)mfUpdateClient;


/**
 三方app授权登录

 @return 是否安装三方app
 */
- (BOOL)mfAuthorizedLoginDMZJ;


/**
 跳转到三方app详情页

 @return 是否安装三方app
 */
- (BOOL)mfOpenDMZJDetailsPage;


/**
 处理跳转链接接口

 @param url 跳转时传入的URL
 @param options 字典数据
 */
- (void)mfApplicationOpenUrl:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options;

@end

