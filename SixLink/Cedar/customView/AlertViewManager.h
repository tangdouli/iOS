//
//  AlertViewManager.h
//  SixLink
//
//  Created by 袁斌 on 15/11/11.
//  Copyright © 2015年 Ubankers. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^choiceCompletionBlock)(NSInteger index);

@interface AlertViewManager : NSObject

+ (instancetype)shareAlertView;

#pragma mark - 弹窗
//普通提示弹窗
- (void)showTipAlert:(NSString *)message;
- (void)showTipAlert:(NSString *)message completion:(choiceCompletionBlock)completion;

//可以选择的弹窗
- (void)showChoiceAlert:(NSString *)message completion:(choiceCompletionBlock)completion;
- (void)showChoiceAlert:(NSString *)message doneTitle:(NSString *)doneTitile completion:(choiceCompletionBlock)completion;
- (void)showChoiceAlert:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 completion:(choiceCompletionBlock)completion;

// 可自定义Title
- (void)showChoiceAlert:(NSString *)message title:(NSString *)title doneTitle:(NSString *)doneTitle completion:(choiceCompletionBlock)completion;
- (void)showChoiceAlert:(NSString *)message title:(NSString *)title button1Title:(NSString *)button1Title button2Title:(NSString *)button2Title completion:(choiceCompletionBlock)completion;

//三选择弹窗
- (void)showChoiceAlert:(NSString *)message button1Title:(NSString *)title1 button2Title:(NSString *)title2 button3Title:(NSString *)title3 completion:(choiceCompletionBlock)completion;

@end
