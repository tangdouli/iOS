//
//  Tool+Login.m
//  SixLink
//
//  Created by 袁斌 on 15/11/23.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "Tool+Login.h"
#define VCode (@"LoginVerifyCode")
#define MPhone (@"LoginMPhone")
#define PCode (@"LoginPCode")
#define Cdate (@"LoginCdate")
#define kTimers (@"LoginkTimers") //isForget
#define kForget (@"LoginkForget")

@implementation Tool (Login)

+(void)savePasswordCode:(NSString *)passwordCode
{
    
    [[NSUserDefaults standardUserDefaults] setObject:passwordCode forKey:PCode];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}
+(NSString *)PasswordCode
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:PCode];
}


+(void)saveVerifyCode:(NSString *)verifyCode
{
    [[NSUserDefaults standardUserDefaults] setObject:verifyCode forKey:VCode];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)VerifyCode
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:VCode];
}

+(void)saveMobilePhone:(NSString *)mobilePhone
{
    
    [[NSUserDefaults standardUserDefaults] setObject:mobilePhone forKey:MPhone];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(NSString *)MobilePhone
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:MPhone];
}
+(void)saveCurrentDate:(NSString *)currentDate
{
    [[NSUserDefaults standardUserDefaults] setObject:currentDate forKey:Cdate];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)currentDate
{
    return [[NSUserDefaults standardUserDefaults] stringForKey:Cdate];
}

+(void)saveEndTimes:(int)times
{
    [[NSUserDefaults standardUserDefaults] setObject:[NSString stringWithFormat:@"%d",times] forKey:kTimers];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(int)endTimes
{
    return [[[NSUserDefaults standardUserDefaults] stringForKey:kTimers] intValue];
}

+(void)setIsForget:(BOOL)isForget
{
    [[NSUserDefaults standardUserDefaults] setBool:isForget forKey:kForget];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(BOOL)isForget
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kForget];
}

@end
