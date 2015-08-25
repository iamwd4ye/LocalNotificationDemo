//
//  AppDelegate.m
//  LocalNotificationDemo
//
//  Created by applex on 15/8/25.
//  Copyright (c) 2015年 applex. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    application.applicationIconBadgeNumber = 0;
    if ([[[UIDevice currentDevice]systemVersion] doubleValue]>8.0) {
        //1.注册通知
        UIUserNotificationSettings * settings=
        [UIUserNotificationSettings
         settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge)
         categories:nil];
        //    ios8注册方法
        [application registerUserNotificationSettings:settings];
        
    }else{
        
        //ios7注册方法
        //    application registerForRemoteNotificationTypes:(UIRemoteNotificationType)
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
         (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];        
    }
    
    return YES;
}

//接受到通知
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    
    NSLog(@"-didReceiveLocalNotification-%@",notification.alertBody);
    
    NSLog(@"---%@",notification.userInfo);
    
    [notification description];
}

//程序即将进入前台把applicationIconBadgeNumber清零
- (void)applicationWillEnterForeground:(UIApplication *)application{
    application.applicationIconBadgeNumber = 0;
}

@end
