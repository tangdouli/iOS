//
//  UIViewController+alertView.h
//  SixLink
//
//  Created by 袁斌 on 15/11/11.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertViewManager.h"
@interface UIViewController (alertView)
/**
 -----------------普通提示弹窗-----------------
   默认提示标题：@"温馨提示"
   默认底部按钮：@"确定"
*/

/**
*  @param message 提示内容
*/
-(void)alertViewShowTip:(NSString *)message;
/**
 *  @param message    提示内容
 *  @param completion 执行的事件
 */
- (void)alertViewShowTip:(NSString *)message completion:(choiceCompletionBlock)completion;

/**
 -----------------可以选择的弹窗-----------------
 提示标题：可选则的
 底部按钮：@"确定"，@"取消"    */

/**
 已经有了@"确定" @"取消"
 *  @param message    message
 *  @param completion completion
 */
- (void)alertViewShowChoiceTip:(NSString *)message completion:(choiceCompletionBlock)completion;
- (void)alertViewShowChoiceTip:(NSString *)message doneTitle:(NSString *)doneTitile completion:(choiceCompletionBlock)completion;
- (void)alertViewShowChoiceTip:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 completion:(choiceCompletionBlock)completion;

// 可自定义Title
- (void)alertViewShowChoiceTip:(NSString *)message title:(NSString *)title doneTitle:(NSString *)doneTitle completion:(choiceCompletionBlock)completion;

/*
 -----------------建议用这个-----------------
 建议用下面的方法
 
 举例：
 [self alertViewShowChoiceTip:@"需要版本更新吗？" title:@"温馨提示" button1Title:@"取消" button2Title:@"确定" completion:^(NSInteger index) {
 if (index == 0) {
 //处理事件
 }else{
 //处理事件
 }
 }];
 */
- (void)alertViewShowChoiceTip:(NSString *)message title:(NSString *)title button1Title:(NSString *)button1Title button2Title:(NSString *)button2Title completion:(choiceCompletionBlock)completion;

//三选择弹窗
- (void)alertViewShowChoiceTip:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 button3Title:(NSString *)title3 completion:(choiceCompletionBlock)completion;

@end
