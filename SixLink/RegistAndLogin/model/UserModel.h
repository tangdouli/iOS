//
//  UserModel.h
//  SixLink
//
//  Created by 袁斌 on 15/11/24.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

/*
 base =     {
 addTime = "<null>";
 avatarId = "<null>";
 email = "<null>";
 id = 137603;
 loginToken = 1448328245039;
 mobile = 17717069936;
 nickName = "<null>";
 };
 */

/**
*  时间
*/
@property(nonatomic,copy)NSString *addTime;
/**
 *  头像
 */
@property(nonatomic,copy)NSString *avatarId;
/**
 *  邮件
 */
@property(nonatomic,copy)NSString *email;
/**
 *  id
 */
@property(nonatomic,copy)NSString *ID;
/**
 *  token
 */
@property(nonatomic,copy)NSString *loginToken;
/**
 *  手机号
 */
@property(nonatomic,copy)NSString *mobile;
/**
 *  昵称
 */
@property(nonatomic,copy)NSString *nickName;
/**
 *  存储用户信息
 *
 *  @param userInfo 基本信息
 */
+ (void)saveUserInfoToFile:(UserModel *)userInfo;
/**
 *  读取用户信息
 *
 *  @return UserModel
 */
+ (UserModel *)userInfoFromFile;
/**
 *  删除用户信息
 */
+ (void)removeUserInfo;

@end
