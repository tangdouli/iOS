//
//  RegisterController.h
//  SixLink
//
//  Created by 萝卜 on 15/11/16.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import "SuperViewController.h"

@interface RegisterController : SuperViewController

@property (weak, nonatomic) IBOutlet UITextField *mobileInput;

@property (weak, nonatomic) IBOutlet UITextField *Security;

@property (weak, nonatomic) IBOutlet UIButton    *voiceRecognition;//语音验证码

@property (weak, nonatomic) IBOutlet UIButton    *getSecurityBtn;//短信验证码
@property (weak, nonatomic) IBOutlet UIButton *login;

//获取验证码
- (IBAction)getSecurityAction:(UIButton *)sender;

//注册
- (IBAction)registerAction:(UIButton *)sender;

//登录
- (IBAction)loginAction:(UIButton *)sender;

@end
