//
//  MFTools.m
//  skipDemo2
//
//  Created by yaojunyu on 2018/9/27.
//  Copyright © 2018年 yaojunyu. All rights reserved.
//

#import "MFTools.h"
#import <UMAnalytics/MobClick.h>
#import <UMCommon/UMCommon.h>
#import "AFNetworking.h"

static MFTools * globalNoticeSharedInstance = nil;

@interface MFTools () <UIAlertViewDelegate>

@property (nonatomic, retain) NSString *downloadUrl;
@property (nonatomic, assign) BOOL isUpdate;

@end

@implementation MFTools

+ (MFTools *)sharedInstance
{
    if (!globalNoticeSharedInstance){
        globalNoticeSharedInstance = [[MFTools alloc] init];
    }
    return globalNoticeSharedInstance;
}

- (void)mfCAnalyticeApplicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    //友盟初始化
    [UMConfigure setLogEnabled:YES];
    [UMConfigure initWithAppkey:@"trrr" channel:nil];
    //友盟上报
    [MobClick setScenarioType:E_UM_NORMAL];
    [MobClick event:@""];
}

- (void)mfRecordTrackEventWithTitle:(NSString *)title capters:(NSString *)capters pages:(NSString *)pages userId:(NSString *)userId token:(NSString *)token{
    //打点上报地址
    NSString *urlStr = @"http://pay.myfcomic.com/api/check/userDot";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];  //AFHTTPResponseSerializer serializer
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    [dict setObject:userId forKey:@"user_id"];
    [dict setObject:token forKey:@"token"];
    [dict setObject:title forKey:@"comic_id"];
    [dict setObject:capters forKey:@"chapter_id"];
    [dict setObject:pages forKey:@"page_id"];
    
    [manager POST:urlStr parameters:nil headers:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        if ([[dict objectForKey:@"code"] intValue] == 1) {
            NSLog(@"上报成功");
        }
        else{
            NSLog(@"上报失败");
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"请求失败%@",error);
    }];
}

- (void)mfUpdateClient{
    //获取服务器版本号地址
    NSString *urlStr = @"http://pay.myfcomic.com/api/iosVersionUpdate";
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];  //AFHTTPResponseSerializer serializer
    manager.responseSerializer.acceptableContentTypes = [manager.responseSerializer.acceptableContentTypes setByAddingObject:@"text/html"];
    
    [manager GET:urlStr parameters:nil headers:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //返回版本号,app下载地址
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:nil];
        NSLog(@"dict == %@",dict);
        NSDictionary *data = [dict objectForKey:@"data"];
        NSString *severVersion = [data objectForKey:@"server_version"];
        self.downloadUrl = [data objectForKey:@"download_url"];
        //info.plist本地版本号
        NSString *clientVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
        
        //是否x允许关闭强更提示
        if ([[data objectForKey:@"is_close"] intValue] == 1) {
            self.isUpdate = NO;
            
            if ([self determineWhetherToUpdate:severVersion locationVersion:clientVersion]) {
                
                NSString *alertMessage = [NSString stringWithFormat:@"新版本%@上线了，马上去更新",severVersion];
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"更新提示"
                                      message:alertMessage
                                      delegate:self
                                      cancelButtonTitle:@"更新"
                                      otherButtonTitles:@"取消",nil];
                [alert show];
                return;
            }
        }
        else if ([[data objectForKey:@"is_close"] intValue] == 2){
            self.isUpdate = YES;
            
            if ([self determineWhetherToUpdate:severVersion locationVersion:clientVersion]) {
                
                NSString *alertMessage = [NSString stringWithFormat:@"新版本%@上线了，马上去更新",severVersion];
                UIAlertView *alert = [[UIAlertView alloc]
                                      initWithTitle:@"更新提示"
                                      message:alertMessage
                                      delegate:self
                                      cancelButtonTitle:@"更新"
                                      otherButtonTitles:nil];
                [alert show];
                return;
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@",error);
    }];
}

- (void)mfApplicationWillEnterForeground:(UIApplication *)application
{
    if (self.isUpdate) {
        [self mfUpdateClient];
    }
}

//判断版本号大小
- (BOOL)determineWhetherToUpdate:(NSString *)serverVersion locationVersion:(NSString *)locationVersion
{
    NSArray *serverArray = [serverVersion componentsSeparatedByString:@"."];
    NSMutableArray *serverMutableArray = [NSMutableArray arrayWithArray:serverArray];
    NSLog(@"serverMutableArray = %@",serverMutableArray);
    int serverCount = [serverMutableArray count];
    
    NSArray *locationArray = [locationVersion componentsSeparatedByString:@"."];
    NSMutableArray *locationMutableArray = [NSMutableArray arrayWithArray:locationArray];
    NSLog(@"locationMutableArray = %@",locationMutableArray);
    int locationCount = [locationArray count];
    
    int count = serverCount - locationCount;
    
    NSLog(@"______count = %d______",count);
    if (count == 0) {
        //直接比较
    }
    else if(count < 0)
    {
        //serverArray补位比较
        count = -count;
        while (count--) {
            [serverMutableArray addObject:@"0"];
        }
    }
    else if(count > 0)
    {
        //locationArray补位比较
        while (count--) {
            [locationMutableArray addObject:@"0"];
        }
    }
    
    NSLog(@"%@%@",serverMutableArray,locationMutableArray);
    for (int i = 0; i< [serverMutableArray count]; i++) {
        if ([[locationMutableArray objectAtIndex:i] intValue] > [[serverMutableArray objectAtIndex:i] intValue]) {
            return NO;
        }
        else if ([[locationMutableArray objectAtIndex:i] intValue] < [[serverMutableArray objectAtIndex:i] intValue]) {
            return YES;
        }
    }
    return NO;
}

#pragma mark - UIAlertViewMethod
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        //跳转appstore
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:self.downloadUrl]];
    }
}

@end
