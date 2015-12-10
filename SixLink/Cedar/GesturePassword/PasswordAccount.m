//
//  PasswordAccount.m
//  Gesture
//
//  Created by 袁斌 on 15/11/8.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import "PasswordAccount.h"

#define kPassword @"kPassword"
#define kpasswordDict  @"kpasswordDict"
#define kNeedPassword @"kNeedPassword"
#define kShowTrack  @"kShowTrack"

@implementation PasswordAccount

+(void)savePasswordDictWithMobileKey:(NSString *)mobileKey value:(NSString *)result

{
    
    NSDictionary *arrs = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kPassword];
    
    NSMutableDictionary *passwordsArrs = [arrs mutableCopy];
    if (passwordsArrs == nil) {
        passwordsArrs = [NSMutableDictionary dictionary];
    }
    if (passwordsArrs.allKeys.count == 5 && passwordsArrs.allKeys.count > 0) {
        
        [passwordsArrs removeObjectForKey:[passwordsArrs.allKeys firstObject]];
        
    }
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:result forKey:mobileKey];
    [passwordsArrs addEntriesFromDictionary:dict];
    [[NSUserDefaults standardUserDefaults] setObject:passwordsArrs forKey:kPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
    
}

+(NSString *)getPasswordWithMobileKey:(NSString *)mobileKey

{
    NSDictionary *passes = [[NSUserDefaults standardUserDefaults] dictionaryForKey:kPassword];
    UBLog(@"passwordspasses:%@",passes);
    
    NSString *result = [passes objectForKey:mobileKey];
    UBLog(@"result:%@ , %@",result,mobileKey);

    if (result) {
        return result;
    }
    return @"";
    
}

+(void)needPasswordIsOn:(BOOL)isOn
{
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:kNeedPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

+(BOOL)isOnWithNeedPassword
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kNeedPassword];
}

+(void)showTrackIsOn:(BOOL)isOn
{
    [[NSUserDefaults standardUserDefaults] setBool:isOn forKey:kShowTrack];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
+(BOOL)isOnWithShowTrack
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kShowTrack];
}

@end
