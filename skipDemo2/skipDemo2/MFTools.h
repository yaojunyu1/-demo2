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

- (void)mfCAnalyticeApplicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

- (void)mfRecordTrackEventWithTitle:(NSString *)title capters:(NSString *)capters pages:(NSString *)pages userId:(NSString *)userId token:(NSString *)token;

- (void)mfApplicationWillEnterForeground:(UIApplication *)application;

- (void)mfUpdateClient;

@end

