//
//  LoginCredential.m
//  SixLink
//
//  Created by 萝卜 on 15/11/9.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "LoginCredential.h"

@implementation LoginCredential


#pragma mark -- interface
- (void)launchApplication:(void (^)(id result, NSError *error))block   {
    
    //1. get cookie
    NSString *cookieVal = [self getCookieByKey:COOKIENAME];

    
    
    //2. send login request
    if (cookieVal) {
//        [[AFAppTuWeiAAPIClient sharedClient].requestSerializer setValue:cookieVal forHTTPHeaderField:COOKIENAME];
//        
//        //if has logined before then process login else execute block and showing login interface
//        [self getAuthToken:block];
//        
//        
//        //3. send token request
    }else{
        self.launchBlock = block;
//        [self getAppToken:^(id result, NSError *error){
//            [self getAuthToken:self.launchBlock];
//        }];
    }
    
}

- (NSString*) getCookieByKey:(NSString*) key
{
    NSString * cookieStr = nil;
    NSArray *cookies =[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:key]) {
            if ([cookie.expiresDate compare:[NSDate date]] == NSOrderedDescending) {
                cookieStr = cookie.value;
            }else{
                [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            }
            break;
        }
    }
    return  cookieStr;
}

- (void) deleteCookieByKey:(NSString*) key
{

    NSArray *cookies =[NSHTTPCookieStorage sharedHTTPCookieStorage].cookies;
    for (NSHTTPCookie *cookie in cookies) {
        if ([cookie.name isEqualToString:key]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
            break;
        }
    }
}

- (void)getAuthToken:(void (^)(id result, NSError *error))block   {
    
//    [[AFAppTuWeiAAPIClient sharedClient] POST:APP_LOGIN_URL parameters:[self loginParameters] success:^(NSURLSessionDataTask * __unused task, id JSONSTR) {
//        NSError *serializationError;
//        id serialObj = [NSJSONSerialization JSONObjectWithData:JSONSTR options:NSJSONReadingMutableContainers error:&serializationError];
//        NSNumber *code = [serialObj objectForKey:@"code"];
//        if (code.integerValue == 30013) {
//            [self deleteCookieByKey:COOKIENAME];
//        }
//        
//        if (block) block(serialObj,nil);
//        
//    } failure:^(NSURLSessionDataTask *__unused task, NSError *error) {
//        if (block) {
//            block(nil, error);
//        }
//    }];
    
}


- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    self = [super init];
    if (!self) {
        return nil;
    }
    if (attributes) {
        self.userName = [attributes valueForKeyPath:@"userName"];
        self.userPwd = [attributes valueForKeyPath:@"userPwd"];
        self.deviceToken = [attributes valueForKeyPath:@"deviceToken"];
    }else{
//        [self getDefaultLoginCredentail];
    }
    
    return self;
}
-(void) getDefaultLoginCredentail   {
    
    LoginCredential *defaultUser = [self loadObjectWithKey:@"UserAccount"];
    if (defaultUser) {
        self.userName = defaultUser.userName;
        self.userPwd = defaultUser.userPwd;
        self.deviceToken = defaultUser.deviceToken;
    }
    
}


#pragma mark -- archive
- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.userName forKey:@"userName"];
    [encoder encodeObject:self.userPwd forKey:@"userPwd"];
    [encoder encodeObject:self.deviceToken forKey:@"deviceToken"];
}


- (id)initWithCoder:(NSCoder *)decoder
{
    if(self = [super init])
    {
        self.userPwd = [decoder decodeObjectForKey:@"userPwd"];
        self.userName = [decoder decodeObjectForKey:@"userName"];
        self.deviceToken = [decoder decodeObjectForKey:@"deviceToken"];
    }
    return  self;
}


- (void)saveObject:(LoginCredential *)obj
{
    NSData *myEncodedObject = [NSKeyedArchiver archivedDataWithRootObject:obj];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:myEncodedObject forKey:@"UserAccount"];
}
- (LoginCredential *)loadObjectWithKey:(NSString *)key
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSData *myEncodedObject = [defaults objectForKey:key];
    if (myEncodedObject) {
        return [NSKeyedUnarchiver unarchiveObjectWithData: myEncodedObject];
    }
    return nil;
}

/******* 登录 ******/

//-(NSDictionary*) loginParameters
//{
//    
//    
//    NSString *pwdStr = [GTMBase64 encodeBase64String:self.userPwd];
//    
//    NSDictionary *parmeters = [NSDictionary dictionaryWithObjectsAndKeys:@"BRANDAPP_IOS",@"client_id",@"eF453$faefw123",@"client_secret",self.userName,@"username",pwdStr,@"password",self.websiteId,@"domain",self.deviceToken,@"deviceToken", nil];
//    return parmeters;
//}


@end
