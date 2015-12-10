//
//  GestureViewController.h
//  Gesture
//
//  Created by 袁斌 on 15/11/7.
//  Copyright © 2015年 yinbanke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GestureView.h"
#import "PasswordAccount.h"
@interface GestureViewController : UIViewController
/**
 *  重置密码或者校验密码
 */
@property(assign,nonatomic)CaseMode style;
/**
 *  是否是注册进来的
 */
@property(assign,nonatomic)BOOL isRegister;

@end
