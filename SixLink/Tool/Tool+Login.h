//
//  Tool+Login.h
//  SixLink
//
//  Created by 袁斌 on 15/11/23.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "Tool.h"

@interface Tool (Login)

//存放当前注册用户的密码
+(void)savePasswordCode:(NSString *)passwordCode;

+(NSString *)PasswordCode;


//存放注册时候的验证码
+(void)saveVerifyCode:(NSString *)verifyCode;

+(NSString *)VerifyCode;

//存放当前注册用户的手机号
+(void)saveMobilePhone:(NSString *)mobilePhone;

+(NSString *)MobilePhone;

/**
 *  存储当前的日期
 *
 *  @param currentDate currentDate
 */
+(void)saveCurrentDate:(NSString *)currentDate;

+(NSString *)currentDate;

/**
 *  存储剩余多少次数
 *
 *  @param times times
 */
+(void)saveEndTimes:(int)times;

+(int)endTimes;

/**
 *  是否是忘记手势密码
 *
 *  @param isForget BOOL
 */
+(void)setIsForget:(BOOL)isForget;

+(BOOL)isForget;

@end
