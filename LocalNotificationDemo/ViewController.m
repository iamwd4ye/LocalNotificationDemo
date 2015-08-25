//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by applex on 15/8/25.
//  Copyright (c) 2015年 applex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
}

//发送通知
- (IBAction)sendNote:(UIButton *)sender {
    
    //1.创建本地推送通知对象
    UILocalNotification * localNotification = [[UILocalNotification alloc] init];
    
    //2.设置属性
    //设置音效(模拟器下是没有音效的，真机下才能测试)
//    localNotification.soundName = @"xxxx.mp3";
    
    //通知的具体内容
    localNotification.alertBody = @"具体内容";
    
    // 锁屏界面显示的小标题（"滑动来" + alertAction）
    localNotification.alertAction = @"xxxxx";
    
    // 通知第一次发出的时间(5秒后发出)
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    // 设置时区（跟随手机的时区）
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    // 设置app图标数字
    localNotification.applicationIconBadgeNumber = 5;
    
    // 设置通知的额外信息
    localNotification.userInfo = @{
                    @"icon" : @"xxx.png",
                    @"title" : @"标题",
                    @"time" : @"2015-06-14 11:19",
                    @"body" : @"xxx:xxxxxxxxxxxxxxxxxxxxxxxxxxxx"
                    };
    
    // 设置启动图片
    localNotification.alertLaunchImage = @"Default";
    
    // 设置重复发出通知的时间间隔
    //    localNotification.repeatInterval = NSCalendarUnitMinute;
    
    // 3.调度通知（启动任务）
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

/**
 *  立即发送通知
 */
- (void)test{
    // 1.创建本地推送通知对象
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    // 2.设置通知属性
    
    //设置音效(模拟器下是没有音效的，真机下才能测试)
    //    localNotification.soundName = @"xxxx.mp3";
    
    //通知的具体内容
    localNotification.alertBody = @"具体内容";
    
    // 锁屏界面显示的小标题（"滑动来" + alertAction）
    localNotification.alertAction = @"xxxxx";
    
    // 通知第一次发出的时间(5秒后发出)
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    // 设置时区（跟随手机的时区）
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    // 设置app图标数字
    localNotification.applicationIconBadgeNumber = 5;
    
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
}

//取消通知
- (IBAction)cancelNote:(UIButton *)sender {
    
    NSArray *notes = [UIApplication sharedApplication].scheduledLocalNotifications;
    NSLog(@"%@", notes);
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

@end
