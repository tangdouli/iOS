//
//  Cedar.h
//  SixDegreesFinancial
//
//  Created by 萝卜 on 15/11/6.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#ifndef Cedar_h
#define Cedar_h
#import "UIViewController+NavigationButton.h"
#import "UIViewController+alertView.h"
#import "AFNetworking.h"
#import "GestureViewController.h"
#import "UserModel.h"
//屏幕尺寸和系统
#define SCREEN_WIDTH ([[UIScreen mainScreen]  bounds].size.width)
#define SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH,  SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH,  SCREEN_HEIGHT))
#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_IPHONE_4_OR_LESS (IS_IPHONE && SCREEN_MAX_LENGTH < 568.0)
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_LATER_IOS7 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0f)
#define IS_LATER_IOS8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0f)
#define IS_LATER_IOS9 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 9.0f)
#define  FONT_SIZE UIScreen.mainScreen.bounds.size.width/320
//快速创建单例.h
#define SingletonH(Calss)     +(Calss *)defaultManager;
//快速创建单例.m
#define SingletonM(Calss)     +(Calss *)defaultManager\
{\
static Calss *CookieManagerInstance = nil;\
static dispatch_once_t predicate;\
dispatch_once(&predicate, ^{\
CookieManagerInstance = [[Calss alloc] init];\
});\
return CookieManagerInstance;\
\
}\

//提示框
#define AlertMsg(message)  [Tool showAlter:(message) andControl:self];

#define kAngleCount(count)  ((count)*M_PI/180)

/**
 *  是否登录
 */
#define IS_LOGIN  ([UserModel userInfoFromFile].loginToken.length == 0 ? NO:YES)

#define NAV_BAR_HEIGHT (64)
#define TAB_BAR_HEIGHT (49)


#endif /* Cedar_h */
