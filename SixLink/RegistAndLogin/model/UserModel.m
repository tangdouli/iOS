//
//  UserModel.m
//  SixLink
//
//  Created by 袁斌 on 15/11/24.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "UserModel.h"

#define userFilePath [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:@"user.data"]

@implementation UserModel

MJCodingImplementation

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{
             @"ID" : @"id"
             };
}

+ (void)saveUserInfoToFile:(UserModel *)userInfo
{
    //保存
    [NSKeyedArchiver archiveRootObject:userInfo toFile:userFilePath];
}

+ (UserModel *)userInfoFromFile
{
    UserModel *userinfo = [NSKeyedUnarchiver unarchiveObjectWithFile:userFilePath];
    if (!userinfo) {
        userinfo = [[UserModel alloc]init];
    }
    return userinfo;
}

+ (void)removeUserInfo
{
    NSFileManager *mgr = [NSFileManager defaultManager];
    NSError *error;
    [mgr removeItemAtPath:userFilePath error:&error];
}



@end
