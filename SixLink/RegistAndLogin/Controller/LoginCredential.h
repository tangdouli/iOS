//
//  LoginCredential.h
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginCredential : NSObject

@property(nonatomic,strong) NSString * userName;
@property(nonatomic,strong) NSString * userPwd;
@property(nonatomic,strong) NSString * appToken;
@property(nonatomic,strong) NSString * deviceToken;


- (instancetype)initWithAttributes:(NSDictionary *)attributes;

- (void)launchApplication:(void (^)(id result, NSError *error))block;

- (void)saveObject:(LoginCredential *)obj;

- (LoginCredential *)loadObjectWithKey:(NSString *)key;

typedef void (^LaunchCBBlock)(id result, NSError *error);

@property (nonatomic , strong) LaunchCBBlock launchBlock;

@end
