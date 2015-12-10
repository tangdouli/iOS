//
//  PasswordAccount.h
//  Gesture
//
//  Created by 袁斌 on 15/11/8.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PasswordAccount : NSObject

/**
 *  保存多用户的手势密码
 *
 *  @param mobileKey 手机号为键
 *  @param result    密码为值
 */
+(void)savePasswordDictWithMobileKey:(NSString *)mobileKey value:(NSString *)result;

/**
 *  取出手势密码
 *
 *  @param mobileKey 根据手机号来取出当前的密码
 *
 *  @return 密码
 */
+(NSString *)getPasswordWithMobileKey:(NSString *)mobileKey;

/**
 *  需不需要设置密码
 *
 *  @return BOOL
 */
+(BOOL)isOnWithNeedPassword;
+(void)needPasswordIsOn:(BOOL)isOn;

/**
 *  是否显示轨迹
 *
 *  @return BOOL
 */
+(BOOL)isOnWithShowTrack;
+(void)showTrackIsOn:(BOOL)isOn;


@end
